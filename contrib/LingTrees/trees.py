#! /usr/bin/python
#
# COPYRIGHT 2005, 2006, Avery D Andrews 3rd
#
#  GPL2
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

class TreesError(Exception):

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
def TreesWhinge(issue):
    sys.stderr.write(issue)
    global error_occurred
    error_occurred=1


class Node:
    def __init__(self, label):
        self.tri = 0
        self.mother = None
        self.daughters = None
        self.next = None
        self.tag = ""
        self.label = label

OUTPUT_DEFAULT = 0 # write output to command-line-specified file our sysout
OUTPUT_TEMP    = 1 # write the next tree to a specified output file
OUTPUT_PERM    = 2 # write all to a specified output file

def parse_line(line, infile):
    text = string.strip(line)
    if text=='':
        raise TreesError('Blank line in tree at line %d.'%infile.linenum)
    white = line[:string.find(line,text[0])]
    return len(white), text


def get_line(infile):
    line = infile.readline()
    while infile.nextline[:2]=='.-':
       line = line + string.strip(infile.readline()[2:])
    if line=='':
        raise TreesError('File ends during tree at line %d.'%infile.linenum)
    return parse_line(line, infile)
    

#
# gets sub-trees whose first line has the same indentation as first param
#
def get_daughters(indent, text, infile, mother):
    daughter, newindent, newtext = build_tree(indent, text, infile)
    daughter.mother = mother
    daughters = [daughter]
    prevdaughter = daughter
    while newindent==indent:
        newdaughter, newindent, newtext = build_tree(newindent, newtext, infile)
        newdaughter.mother = mother
        prevdaughter.next = newdaughter
        daughters.append(newdaughter)
        prevdaughter=newdaughter
    if newindent > indent:
        raise TreesError('Indentation fault at line %d.'%infile.linenum)
    return daughters, newindent, newtext


#
#  pattern for option parsing
#
optpattern = re.compile("\s*(\S*)\s*(.*?)\s*$")

#
# text is not supposed to be '.]'
#
def build_tree(indent, text, infile):
    linenum = infile.linenum
    textlist = re.split("[|]",text)
    node = Node(textlist[0])
    dict = node.optdict = {}
    for command in textlist[1:]:
        matchcom = optpattern.match(command)
        if matchcom:
           comm = matchcom.group(1)
           if not comm in [
             'tag',     # custom tag for the line
             'tri',     # node has a triangle over it
             'none',    # node has no line going to it
             'dot',     # node line is dotted
             'dash',    # node line is dashed
             'after',   # something after the connection command
             'style',   # style commands
             'dotted',  # nice pstricks dots
             'connect', # custom connection command
             'width',   # node is of set width
             'dtwidths',# widths of daughter nodes
             ]:
              TreesWhinge("Warning: unknown option '%s' near line %d\n"%(command,linenum))
           dict[comm] = matchcom.group(2)
    if dict.has_key("tag"):
        node.tag = dict["tag"]
    else:
        global tag_count
        node.tag = "Z%d"%tag_count
        tag_count=tag_count+1
    if dict.has_key("none"):
        if dict.has_key("tri"):
            TreesWhinge("Incompatible options 'none' and 'tri' near line %d (tri wins)\n"%linenum)
        if dict.has_key("dash") or dict.has_key("dot") or dict.has_key("linestyle"):
            TreesWhinge("Incompatible options 'none' and some line style near line %d (none wins)\n"%linenum)

    newindent, newtext = get_line(infile)
    if newindent > indent:
        node.daughters, newindent, newtext = get_daughters(newindent, newtext, infile, node)
    return node, newindent, newtext


def write_tree(node, outfile, indent=0):
    dict = node.optdict
    lineoptions=""
    if node.mother:
        if dict.has_key('dash'):
            line = "\\makedash{3pt}"
        elif dict.has_key('dot'):
            line = "\\makedash{1pt}"
        else:
            line = ""
        if dict.has_key('dotted'):
            lineoptions = lineoptions+"linestyle=dotted,linewidth=\\treedotwidth"
        if dict.has_key('style'):
            if lineoptions:
                lineoptions = lineoptions+','+dict['style']
            else:
                lineoptions = dict['style']
        if lineoptions:
            lineoptions = "[%s]"%lineoptions
        if dict.has_key('after'):
            lineoptions = lineoptions+dict['after']
        if dict.has_key('tri'):
            line = line+"\\nodetriangle{%s}{%s}%s%%\n"%(node.mother.tag, node.tag, lineoptions)
        elif dict.has_key('none'):
            if dict.has_key('after'):
                line = dict['after']
        else:
            if dict.has_key('connect'):
                connect = dict['connect']
            else:
                connect = "\\nodeconnect"
            line = line+"%s{%s}{%s}%s"%(connect, node.mother.tag, node.tag, lineoptions)
    else:
        line = ''
    if dict.has_key('width'):
        width = '\\setnodewidth{%s}'%dict['width']
    elif node.mother!=None and node.mother.optdict.has_key('dtwidths'):
        width = '\\setnodewidth{%s}'%node.mother.optdict['dtwidths']
    else:
        width = ""
    if node.daughters:
        outfile.write("{%s\\ntnode{%s}{%s}{%s},\n"%(width,node.tag,node.label,line))
        for daughter in node.daughters:
            write_tree(daughter, outfile, indent+2)
        outfile.write('}')
    else:
        outfile.write("{%s\\tnode{%s}{%s}{%s}}"%(width,node.tag,node.label, line))
    if node.next:
#        if node.mother.next:
            outfile.write(",\n")


def process_tree(infile, outfile):
    indent, text = get_line(infile)
    if text[:2]=='.]':
        return
#    outfile.write('indent: %d; text: %s\n'%(indent, text))
    global tag_count
    tag_count = 0
    tree, newindent, newtext =  build_tree(indent, text, infile)
    if newindent!=0:
        raise TreesError('Indentation fault at line %d.'%infile.linenum)
    if newtext!='.]':
        raise TreesError('Bad tree end at line %d.'%infile.linenum)
    outfile.write('%%% begin tree\n\\tree')
    write_tree(tree, outfile)
    outfile.write('%%\n%%end tree\n')
    

def make_folders(path):
    folder, file = os.path.split(path)
    folder = string.strip(folder)
    if folder and not os.path.exists(folder):
        os.makedirs(folder)

def process_file(infile, outfile):
    global error_occurred
    error_occurred =0
    outfilemode = OUTPUT_DEFAULT
    while 1:
        line = infile.readline()
        if line == '':
            break;
        if line[:3]=='.>>':
            outfilemode = OUTPUT_PERM
            line = string.strip(line[3:])
            make_folders(line)
            outfile2 = outfile
            outfile = open(line,'w')
        elif line[:3] == '.<<':
            outfilemode = OUTPUT_DEFAULT
        elif line[:2] == '.>':
            if outfilemode == OUTPUT_PERM:
                sys.stderr.write("Warning: temp output directive after permanent at line %d"%infile.linenum)
            else:
                line = string.strip(line[2:])
                make_folders(line)
                outfile2 = outfile
                outfilemode = OUTPUT_TEMP
                outfile = open(line,'w')
        elif line[:2] == '.[':
            try:
                process_tree(infile, outfile)
            except TreesError, error:
                sys.stderr.write(error.value)
                errfile=open(errfilename,'w')
                errfile.write(error.value)
                outfile.write('BAD TREE:\n  %s'%error.value)
            try:
               if outfilemode == OUTPUT_TEMP and outfile2:
                   outfile = outfile2
                   del outfile2
            except UnboundLocalError:
              pass
        else:
            outfile.write(line)


if __name__=="__main__":
    argv=sys.argv
#    print 'cwd:'+os.getcwd()
    if len(argv)<2:# run as filter
        infile=sys.stdin
        outfile=sys.stdout
        errfilename = 'trees.err'
#        errfile=open("trees.err","w")
    else:
        infile=open(argv[1]+'.txp','r')
        outfile=open(argv[1]+'.tex','w')
        errfilename = argv[1]+'.err'
#        errfile=open(argv[1]+'.err','w')

    process_file(Source(infile), outfile)
    if error_occurred:
        sys.exit(1)
    sys.stderr.write("trees ran without issues\n")

#
#  changelog
#
#  v 3.1  Feb 28 2006
#    widths and dtwidths commands, for controlling width
#      of nodes.
#
#  v 3.0  Jan 30 2006
#    adjusted to write for pst-node
#    name changed to lingtrees.py
#    implement additional options for PSTricks
#
#  v 2.2, Jan 18 2006
#   implemented none, dash and dot options from Chris Manning's version
#
#  v 2.1, Dec 28 2005
#   .>, .>>, >> directives added for writing to files
#   .- directive added for continuation of lines
#
            
