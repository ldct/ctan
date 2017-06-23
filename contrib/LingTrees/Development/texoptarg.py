#! /usr/bin/python
#
# COPYRIGHT 2006, Avery D Andrews 3rd
#
# License: GPL2
#
# Purpose: this script converts macro 'declarations' in the style
#   of the accompanying macros.txo to a chain of TeX macros with
#   optional arguments, with [#d=X] indicating an optional argument
#   with default value X.  Allowed delimiters are [], (), <>; Input
#   verification not very thorough.

#
#  changelog at end

import sys, string, os, re

#
# would be an idea to subclass 'file', but then I wouldn't
#   know how to make it work with sys.stdin
#
class Source:

    def __init__(self, source):
        self.linenum = 0
        self.file = source
        self.nextline = source.readline()

    def readline(self):
        self.linenum = self.linenum+1
        returnline = self.nextline
        self.nextline = self.file.readline()
        return returnline

class ProgramError(Exception):

    def __init__(self, value):
        self.value = value+'\n'
        #
        # UGH: there must be a better way to do this
        #
        global error_occurred
        error_occurred=1

    #
    # UMM: actually this doesn't seem to do what I expect it to (be
    #   the spelling of an error instance in backquotes)
    #
    def __str__(self):
        return self.value

#
# complain and set error flag but don't stop
#
def ProgramWhinge(issue):
    sys.stderr.write(issue)
    global error_occurred
    error_occurred=1


blanklinepattern = re.compile("^\s*(%.*)?$")

#
# pulls out three fields, the first ought be \def, \gdef etc.
#    the second is the name, preceeding by backslash
#    the third is the arguments.
# they can be separated by whitespace, but don't have to be
#
deflinepattern = re.compile("^\s*(\\\\[a-zA-Z]+)\s*(\\\\[a-zA-Z@]+)\s*(\S*)\s*$")

#    [ indicates [, (, <, likewise ].  1 indicates any digit
#
#         #1 or [#1#], not followed by a closing bracket  
#                            
oblargpattern = re.compile("([\[\(<])?#(\d)(?![=\]\)>])(#[\]\)>])?(.*)")
#                                 1      2                 3        4
#
#                      [#1(=opt)]
#
optargpattern = re.compile("([\[\(<])#(\d)(=[^[([\]\)>]*)?([([\]\)>])(.*)")
#                               1       2        3            4       5
#
def process_file(infile, outfile):
    global error_occurred
    error_occurred =0
    while 1:
        line = infile.readline()
        if line == '':
            break;
        blankmatch = blanklinepattern.match(line)
        if blankmatch:
            pass
        else:
            defmatch = deflinepattern.match(line)
            if defmatch:
                (defin, name, arguments) = defmatch.group(1,2,3)
                outfile.write("\n%%\n%%    %s\n%%\n%%\n"%name)
                produce_definition(defin, name, arguments, 1, [], infile, outfile)
            else:
                raise ProgramError("line %d ill-formed"%infile.linenum)        

def produce_definition(defcom, name, arguments, count, arglist, infile, outfile):
    blankmatch = blanklinepattern.match(arguments)
    if blankmatch:
        write_definition(defcom, name, arglist, outfile)
        return
    #
    # obligatory arguments
    #
    argmatch = oblargpattern.match(arguments)
    if argmatch:
#        print "%s: %s"%(name,argmatch.group(3))
        if argmatch.group(1):
            if not argmatch.group(3):
                raise ProgramError("no closing bracket in line %d"%infile.linenum)
        if argmatch.group(3):
            if not argmatch.group(2):
                raise ProgramError("no opening bracket in line %d"%infile.linenum)
        if count!=int(argmatch.group(2)):
            raise ProgramError("argument number sequence error line %d"%infile.linenum)
        if argmatch.group(1):
#            print `argmatch.group(2)`
            arg = "%s#%d%s"%(argmatch.group(1), count, argmatch.group(3))
            arglist.append((arg,arg))
        else:
            arglist.append(("#%d"%count, "{#%d}"%count))
        produce_definition(defcom,name,argmatch.group(4),count+1, arglist,infile, outfile)
        return
    #
    # optional arguments
    #
    argmatch = optargpattern.match(arguments)
    if argmatch:
        write_definition_start(defcom, name, arglist, outfile)
        nextname = '\@'+name[1:]
        outfile.write("{\@ifnextchar %s\n  {%s"%(argmatch.group(1), nextname))
        #
        #  iftrue
        #
        write_args_in_def(arglist,outfile)
        outfile.write("}")
        outfile.write("\n")
        #
        # iffalse
        #
        if argmatch.group(3):
            defaultval = argmatch.group(3)[1:]
        else:
            defaultval = ""
#        print "default: %s"%defaultval
        outfile.write("  {%s"%nextname)
        write_args_in_def(arglist,outfile)
        outfile.write("%s%s%s}\n}\n"%(argmatch.group(1),defaultval,argmatch.group(4)))
        #
        # next argument
        #
        arg ="%s#%s%s"%argmatch.group(1,2,4)
        arglist.append((arg, arg))
        produce_definition(defcom, nextname, argmatch.group(5), count+1, arglist, infile, outfile)

    
def write_args_in_def(arglist, outfile):
    for arg in arglist:
        outfile.write(arg[1])

def write_definition_start(defcom, name, arglist, outfile):
    outfile.write("%s%s"%(defcom, name))
    for arg in arglist:
        outfile.write(arg[0])

def write_definition(defcom, name, arglist, outfile):
    write_definition_start(defcom, name, arglist, outfile)
    outfile.write("{\n\n}\n")

if __name__=="__main__":
    argv=sys.argv
#    print 'cwd:'+os.getcwd()
    if len(argv)<2:# run as filter
        infile=sys.stdin
        outfile=sys.stdout
        errfilename = 'texoptarg.err'
#        errfile=open("texoptarg.err","w")
    else:
        infile=open(argv[1]+'.txo','r')
        outfile=open(argv[1]+'.tex','w')
        errfilename = argv[1]+'.err'
#        errfile=open(argv[1]+'.err','w')

    try:
        process_file(Source(infile), outfile)
    except ProgramError, error:
        sys.stderr.write(error.value)
        errfile=open(errfilename,'w')
        errfile.write(error.value)
    if error_occurred:
        sys.exit(1)
    sys.stderr.write("texoptarg ran without issues\n")
    
#    
# Changelog:
#
#   Jan 24 2006:  first apparently working version
#
