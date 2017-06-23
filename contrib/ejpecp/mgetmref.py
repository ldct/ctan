#! /usr/bin/env python
##################################################################################
#
#  getmref.py - gets the references links to MathSciNet throught the BatchMRef:
#                                 http://www.ams.org/batchref?qdata=xmldocument
#
#  Copyright (C) 2004 Sigitas Tolusis, VTeX Ltd. and Jim Pitman, Dept. Statistics,
#  U.C. Berkeley
#  E-mail: sigitas@vtex.let
#  http://www.stat.berkeley.edu/users/pitman
#
#  This program is free software; you can redistribute it and/or
#  modify it under the terms of the GNU General Public License
#  as published by the Free Software Foundation; either version 2
#  of the License, or (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  Requires python ver. 2.2
#
#  Usage:
#    getmref.py <bbl or tex file>
#
#  Program (description):
#    - makes inputfile copy to <inputfilename>.getmref.bak;
#    - for each successful bibitem reference search adds line \MR{<mrid>},
#      where <mrid> is data from XML tag <mrid> without front symbols "MR";
#    - writes all adds to <inputfilename>;
#    - generates log file <inputfilename>.getmref.log;
#    - writes to stdout log info
#
#  Changes:
#    2004/04/26 - \bibitem line removed from the query
#
#
###################################################################################
SVNinfo = "$Id: getmref.py 46 2006-03-30 07:02:14Z sigitas $"

import sys, urllib, re, os.path, time, string
from xml.dom.minidom import parseString
import xml.parsers.expat as par

starttime = time.time()
res = re.search(r'\S+:\s\S+\s+(.*?)\s.*\$', SVNinfo)
if res:
  ver = res.group(1)
else:
  ver = '0.0'
print "# getmref, v. %s #" % ver

#
# bbl file parsing /begin
#

def escapetex(instr):
  res = reduce(lambda a,b: string.replace(a, b[0], b[1]), (instr, ("\\&", '&amp;'), ("<", '&lt;'), (">", '&gt;')))
  return res

def query(instring, bibID, address = 'http://www.ams.org/batchmref'):
  domas = None; res = None; err = 0
  escapetexstring = escapetex(instring)
  querystring = r'''<?xml version = "1.0" encoding = "UTF-8"?>
<mref_batch>
<mref_item outtype="tex">
<inref>
%s
</inref>
<myid>%s</myid>
</mref_item>
</mref_batch>''' % (escapetexstring, bibID)
  try:
    indom = parseString(querystring)
  except par.ExpatError, err:
    print >>sys.stderr,"[parse query]: %s" % querystring
    print >>sys.stderr,sys.exc_info()
    pass
  else:
    queryinfo = {}
    queryinfo['qdata'] = querystring
    queryval = urllib.urlencode(queryinfo)
    try:
      batchmref = urllib.urlopen(address, queryval)
      res = batchmref.read()
      domas = parseString(res)
    except err:
      print >>sys.stderr,"[parse res]: %s" % res
      print >>sys.stderr,sys.exc_info()
      pass
  return domas, res, err

def remcomm(line):
  "Removes TeX comments"
  bibre = re.compile(r'\s*(.*?)(?<!\\)%.*\n$')
  fmtline = re.sub('^%.*\n$','', line)
  if fmtline:
    matchobj = bibre.search(fmtline)
    if matchobj:
      return matchobj.groups(1)[0]
    else:
      return fmtline
  else:
    return fmtline

def formatbibitem(bibID, domas):
  errstring = None; outtype = None; mrid = None; myid = bibID; outref = None; err = 0
  try:
    mref = domas.getElementsByTagName("mref_batch")[0]
    mref_errors = mref.getElementsByTagName("batch_error")
    if len(mref_errors):
      errlist =  [ mref_error.childNodes[0].nodeValue() for mref_error in mref_errors ]
      errstring = ''.join(errlist)
      err = -2
    else:
      mref_items = [item for item in mref.getElementsByTagName("mref_item")]
      matches = mref_items[0].getElementsByTagName("matches")[0].childNodes[0]._get_nodeValue()
      if matches == '1':
        for item in mref_items:
          outtype = dict(item.attributes.items())["outtype"]
          mrid = item.getElementsByTagName("mrid")[0].childNodes[0]._get_nodeValue()
          err = 0
          if mrid[:2] == "MR":
            mrid = mrid[2:]
          myids = item.getElementsByTagName("myid")
          if len(myids):
            myid = myids[0].childNodes[0]._get_nodeValue()
          else:
            myid = bibID
          outref = string.strip(item.getElementsByTagName("outref")[0].childNodes[0]._get_nodeValue())
      else:
        err = -1
  except:
    err = -3
    print >>sys.stderr,"[formatbibitem]: %s" % bibID
    print >>sys.stderr,sys.exc_info()
    pass
  return mrid, outref, err


def handlebibitem(lines, bibID, biblabel=None):
  res = 0; err = None; outref = None
  outstring = string.strip(''.join(lines))
  lines[:] = [re.sub(r'\\MR\{.*?\}', '', a) for a in lines]
  biblines = [x for x in [remcomm(a) for a in lines] if x]
  bibstring = re.sub(r'\n', ' ', ''.join(biblines))
  match = re.search(r'\\bibitem\s*?(?:\[.*?\])?\s?\{(?:.*?)\}(.*)(\\endbibitem)?$',bibstring.strip())
  if match:
      querystring = match.group(1).strip()
  else:
      querystring = bibstring
  domas = None
  try:
    domas, xmlres, err = query(querystring, bibID)
  except:
    res = -2
    print >>sys.stderr,"[parse query]: %s" % querystring
    print >>sys.stderr,sys.exc_info()
    print 'Error',
  else:
    mrid, outref, err = formatbibitem(bibID, domas)
    if not mrid:
      print 'Not Found',
      res = -1
    else:
      print mrid,
      if mrid[:2] == "MR":
        outstring = bibstring + '\\MR{%s}' % mrid[2:].rjust(7,'0')
      else:
        outstring = bibstring + '\\MR{%s}' % mrid.rjust(7,'0')
      outstrip, nsub = re.subn(r'\\endbibitem',r'',outstring)
      if nsub:
        outstrip += '\n\\endbibitem'
      outstring = re.sub(r'  ', r' ', outstrip)
  if not outref:
    outref = "Not found!"
  else:
    outref = re.sub(r'(?<!\\)#',r'\#', outref)
  if biblabel:
    print >>datafile, '\\bibitem%s{%s}\n%s\n' % (biblabel, bibID, outref)
  else:
    print >>datafile, '\\bibitem{%s}\n%s\n' % (bibID, outref)
  return '%s\n' % outstring, res

def handleextra(extralines):
  if len(extralines):
    print >>outputfile, ''.join(extralines),

def handlebbl(inputfile, out=sys.stdout, data=sys.stdout):
  print "Job started:",
  total = 0; successful = 0; errors = 0; state = 0; pseudobibID = 0; readbib = ''
  bibl_begin = re.compile(r'\s*\\begin\s*\{thebibliography\}.*$')
  bibre = re.compile(r'^\s*\\bibitem.*')
  bibreF = re.compile(r'\s*\\bibitem\s*(\[.*?\])*?\s?\{(.*?)\}.*$',re.S)
  comments = re.compile(r'\s*%.*$')
  bibl_end = re.compile(r'\s*\\end\s*\{thebibliography\}.*$')
  for line in inputfile:
    if len(readbib):
      readbib += line
      matchobj = bibreF.search(readbib)
      if matchobj:
        line = "%s" % readbib
        readbib = ''
      else:
        continue
    if line:
      if state == 0:
        matchobj = bibl_begin.search(line)
        if matchobj:
          print >>data,matchobj.group(0)
          print >>data,"\\csname bibmessage\\endcsname\n"
          state = 1
        print >>out, line,
        continue
      elif state == 1:
        matchobj = bibre.search(line)
        if matchobj:
          matchobj = bibreF.search(line)
          if matchobj:
            biblabel, bibID = matchobj.groups()
            if not len(bibID):
              pseudobibID += 1
              bibID = '%s' % pseudobibID
            state = 2
            lines = [line]
            extralines = []
            continue
          else:
            readbib = line
            continue
        else:
          print >>out, line,
          continue
      elif state == 2:
        matchobj = bibre.search(line)
        if matchobj:
          matchobj = bibreF.search(line)
          if matchobj:
            total += 1
            print >>data,line
            outstring, sres = handlebibitem(lines, bibID, biblabel)
            if not sres:
              successful += 1
            else:
              errors += 1
            print >>out, outstring,
            handleextra(extralines)
            lines = [line]
            extralines = []
            biblabel, bibID = matchobj.groups()
            if not len(bibID):
              pseudobibID += 1
              bibID = '%s' % pseudobibID
            continue
          else:
            readbib = line
            continue
        else:
          matchobj = bibl_end.search(line)
          if matchobj:
            state = 0
            total += 1
            outstring, sres = handlebibitem(lines, bibID, biblabel)
            if not sres:
              successful += 1
            else:
              errors += 1
            print >>out, outstring,
            handleextra(extralines)
            print >>out, line,
            print >>data,matchobj.group(0)
            continue
          else:
            if line[:-1] == '':
              state = 3
              extralines = [line]
              continue
            matchobj = comments.search(line)
            if matchobj:
              state = 3
              extralines = [line]
              continue
            lines.append(line)
            continue
      elif state == 3:
        matchobj = bibre.search(line)
        if matchobj:
          matchobj = bibreF.search(line)
          if matchobj:
            state = 2
            total += 1
            outstring, sres = handlebibitem(lines, bibID, biblabel)
            if not sres:
               successful += 1
            else:
               errors += 1
            print >>out, outstring,
            handleextra(extralines)
            lines = [line]
            extralines = []
            biblabel, bibID = matchobj.groups()
            if not len(bibID):
              pseudobibID += 1
              bibID = '%s' % pseudobibID
            continue
          else:
            readbib = line
            continue
        else:
          matchobj = bibl_end.search(line)
          if matchobj:
            state = 0
            total += 1
            outstring, sres = handlebibitem(lines, bibID, biblabel)
            if not sres:
              successful += 1
            else:
              errors += 1
            print >>out, outstring,
            handleextra(extralines)
            print >>out, line,
            print >>data,matchobj.group(0)
            continue
          else:
            if line[:-1] == '':
              extralines.append(line)
              continue
            matchobj = comments.search(line)
            if matchobj:
              extralines.append(line)
              continue
            state = 2
            lines.extend(extralines)
            lines.append(line)
            extralines = []
            continue
    else:
      break
  print "Job ended"
  print "Total: %s, found: %s, errors: %s" % (total, successful, errors)
  return (total, successful, errors)

#
# bbl file parsing /end
#

if len(sys.argv) < 2:
  progname = os.path.basename(sys.argv[0])
  print "Usage:\n   %s <bbl or tex file>" % progname
  sys.exit(1)
infilename = sys.argv[1]
filebase = os.path.splitext(infilename)[0]
outfilename = "%s.getmref.tmp" % filebase
datafilename = "%s.getmref.data" % filebase
logfilename = "%s.getmref.log" % filebase

inputfile = file(infilename, 'r')
outputfile = file(outfilename, 'w')
datafile = file(datafilename, 'w')
logfile = file(logfilename, 'w')
if os.path.isfile("%s.getmref.bak" % filebase):
  os.unlink("%s.getmref.bak" % filebase)

sys.stderr = file("%s.getmref.err" % filebase, 'w')
total = 0; successful = 0; errors = 0
print >>logfile, "File: %s" % infilename
try:
  total, successful, errors = handlebbl(inputfile, outputfile, datafile)
except:
  print >>sys.stderr,"[handlebbl]"
  print >>sys.stderr,sys.exc_info()
print >>logfile, "   total: %s, found: %s, errors: %s, time: %ss" % (total, successful,
 errors, int(round(time.time()-starttime)))

inputfile.close()
outputfile.close()
datafile.close()
logfile.close()
sys.stderr.close()
sys.stderr = sys.__stderr__
if os.path.isfile("%s.getmref.err" % filebase):
  if not os.stat("%s.getmref.err" % filebase)[6]:
    os.unlink("%s.getmref.err" % filebase)
if os.path.isfile("%s.getmref.bak" % filebase):
  os.unlink("%s.getmref.bak" % filebase)
os.rename(infilename, "%s.getmref.bak" % filebase)

#mes modif
#os.rename(outfilename, infilename)
f=open(outfilename,"r")
g=open(infilename,"w")
x=f.read()
g.write(re.sub(r"\r"," ",x))

#fin de la modif

print 'Job completed in %ss' % int(round(time.time()-starttime))



