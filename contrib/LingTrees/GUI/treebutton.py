#! /usr/bin/python
#
# Saved in Unix format (by TextPad) so that the cretinous bash shell
#   can find the interpreter.  Above line may need to be tweaked for *nix
#   depending on how Python is set up.
#
# COPYRIGHT 2005, 2006, Avery D Andrews 3rd, except for the DataDialog
#  class cribbed from Frederik Lundh
#
# License: GPL 2
#
#  changelog at end

import os, os.path, subprocess, sys, re, string, time
import Tix
from Tkinter import *
from Tkconstants import *
import zlib # (for compressed distributable)

import trees

#################################
#
#  Default Options
#    the r"..." notation causes backslashes to be taken verbatim,
#    rather than as escapes
#
BALLOONWAIT = 2000                                        # delay for balloon help
FLOATONTOP  = 0                                        #Windoze only


#
# crap to organize shutdown: isn't there a decent way to do this?
#
TCL_ALL_EVENTS          = 0


class RunSample:

    def __init__(self, w):
        

        #
        #  defaults that can be overridden
        #

        self.options = {'initwait' : BALLOONWAIT,
                        'floatwin' : FLOATONTOP}
        
        for option in self.options.keys():
            setattr(self,option,self.options[option])
            
        
        #
        #  where am I
        #
        self.path = sys.path[0]
        path1, path2 = os.path.split(self.path)
        if path2 == "library.zip":
            self.path=path1

        #
        # crap for organizing orderly shutdown
        #
        z = w.winfo_toplevel()
        z.wm_protocol("WM_DELETE_WINDOW", lambda self=self: self.shutdown())
        self.exit = -1
        self.root = w
        #
        # the help balloon
        #
        balloon = Tix.Balloon(w, initwait=self.initwait)
        #
        #  folderFrame line: an entry for the folder where the files are
        #
        folderFrame = Tix.Frame(w)
        
        self.folderName = StringVar()
        self.treesFileName = StringVar()
        self.floatWin = IntVar()
        self.floatWin.set(FLOATONTOP)
        
        #
        # make window float or not
        #
        if sys.platform[0:3]=="win":
            self.floatWin.set(self.floatwin)

        def setFolder(event, self=self):
            name = self.dirLabelEntry.entry.get()
            self.folderName.set(name)
            self.treesFileDialog.fsbox.config(directory=name)
            self.treesFileName.set("")
            self.texFileName.set("")

        self.dirLabelEntry = dirLabelEntry= Tix.LabelEntry(folderFrame, takefocus=0, 
           label='Folder: ',  options = '''entry.width 20 label.width 9 label.anchor e''')
        dirLabelEntry.entry["textvariable"] = self.folderName
        dirLabelEntry.entry.bind("<KeyPress-Return>", setFolder)
        dirLabelEntry.pack(side=RIGHT, expand=YES, fill=X)
        balloon.bind_widget(dirLabelEntry,
          msg="You can enter the directory for the trees file here, but it's usually better to browse with the '...' button below.\n")
        folderFrame.pack(side=TOP, expand=YES, fill=X)
        #
        # next line: the Trees file
        #
        treesFrame = Tix.Frame(w)
        self.treesLabelEntry = treesLabelEntry = Tix.LabelEntry(treesFrame, label = " Trees file: ", options = '''
                                      entry.width 20
                                      label.width 9 label.anchor e
                                      ''')

        treesLabelEntry.entry["textvariable"] = self.treesFileName
        
        def treesFileCommand(filePath, self=self):
            dirName, fileName = os.path.split(filePath)
            self.treesFileName.set(fileName)
            if dirName!=self.folderName.get():
#                print dirName
#                print self.folderName.get()
                self.folderName.set(dirName)        

        self.treesFileDialog = treesFileDialog = Tix.ExFileSelectDialog(root, title="Trees File Selection", command=treesFileCommand)
        self.treesFileDialog.fsbox.config(pattern="*.txp")

        def selectTreesFile(dialog=treesFileDialog):
            dialog.popup()

        linepattern = re.compile("\s*(.+?)\s*=\s*(.+?)\s*$")
        #
        # load up history
        #
        self.historypath = historypath = os.path.join(self.path, "TreeButton.cfg")
        if os.path.exists(historypath):
            history = open(historypath,"r")
            line = history.readline()
            treesdir = treesFileDialog.fsbox.dir
            while line != "":
                linematch = linepattern.match(line)
                if linematch:
                    if linematch.group(1)=="treesfolder":
                        treesdir.insert(0,linematch.group(2))
                    elif linematch.group(1)=="folder":
                        self.folderName.set(linematch.group(2))
                    elif linematch.group(1)=="treesfile":
                        self.treesFileName.set(linematch.group(2))
                    else:
                        item = linematch.group(1)
                        if item == "floatwin":
                            self.floatWin.set(int(linematch.group(2)))
                        elif item in self.options.keys():
                            setattr(self,item,linematch.group(2))
                        else:
                            print "Unknown Setup Option: %s"%line
                else:
                    print 'matchless: '+line
                line = history.readline()
        for dialog in (treesFileDialog,):
            box = dialog.fsbox
            list = box.dir.slistbox.listbox
            if list.size()>0:
                box.config(directory=list.get(0))
  
        tbt = Tix.Button(treesFrame,text="...", command=selectTreesFile)
        tbt.pack(side=RIGHT)
        treesLabelEntry.pack(side=RIGHT, expand=YES, fill=X)
        treesFrame.pack(side=TOP, expand=YES, fill=X)
        #
        # bottom line: the view buttons
        #
        runButFrame = Tix.Frame(w)

        def treesCommand(self=self):
            os.chdir(self.folderName.get())
            treesFile = self.treesFileName.get()
            base, ext = os.path.splitext(treesFile)
            treesout = base+".tex"
            global errfilename
            trees.errfilename = base+".err"
            if 1:
                infile = open(treesFile, "r")
                outfile = open(treesout, "w")
                trees.process_file(trees.Source(infile), outfile)
                if trees.error_occurred:
                    print "Trees had a problem"
                    return
                else:
                   print "Trees ran without issues"
                outfile.close()

        treesButFrame = Tix.Frame(runButFrame)
        txb = Tix.Button(treesButFrame, text="Run Trees", command=treesCommand)
        txb.pack(side=LEFT, anchor=W)
        

        if sys.platform[0:3]=="win":
#            floatFrame = Tix.Frame(w)
            floatLabel = Tix.Label(treesButFrame, text="Keep TreeButton on top")
            floatLabel.pack(side=RIGHT, anchor=E)
            floatCheck = Tix.Checkbutton(treesButFrame, variable=self.floatWin,
               command=lambda self=self: self.checkFloat())
            floatCheck.pack(side=RIGHT, anchor=E)
#            floatFrame.pack(side=TOP, anchor=W)
            
        treesButFrame.pack(side=LEFT,anchor=N)
        
        runButFrame.pack(side=TOP)

            
        if sys.platform[0:3]=="win":
 #       if 0:  # disable this stuff for now
            menubar = Menu(w)
            w.configure(menu = menubar)
            system_menu = Menu(menubar, tearoff=0, name="system")
            system_menu.add_separator()
            for (label, command) in [("Run trees", treesCommand),
                                     ]:
                system_menu.add_command(label=label, command=command)
            menubar.add_cascade(menu = system_menu)


        #
        # load icon if possible  s/b late to avoid goofy-looking startup
        #
        iconpath = os.path.join(self.path,'treerunner.ico')
        if os.path.exists(iconpath):
            self.iconpath = iconpath
            try:
                z.wm_iconbitmap(bitmap=iconpath)
            except:
                pass
        else:
            self.iconpath = None
        #
        # ready to rock and roll
        #
        print "TreeButton is ready."
        

    #
    # float on top stuff
    #
    def checkFloat(self):
        if sys.platform[0:3]=="win":
            self.root.wm_attributes("-topmost", self.floatWin.get())
            if self.floatWin.get()==0:
                self.root.lift()

    #
    # shutdown crap
    #
    def mainloop(self):
        while self.exit < 0:
            self.root.tk.dooneevent(TCL_ALL_EVENTS)

        
    def shutdown(self):
        global errno, strerror        
        try:
            history = open(self.historypath,"w")
            for label, list in [("treesfolder", self.treesFileDialog.fsbox.dir.slistbox.listbox)]:
                try:
                    for i in range(list.size()-1,-1,-1):
                        history.write("%s = %s\n"%(label, list.get(i)))
                        if i==10:
                             break
                except TclError:
                   print "Tcl had a problem; no history saved"
            history.write("%s = %s\n"%('folder',self.folderName.get()))
            history.write("%s = %s\n"%('treesfile',self.treesFileName.get()))
            for option in self.options.keys():
                value = getattr(self,option)
                if option == "floatwin":
                    value = `self.floatWin.get()`
                if value!=self.options[option]:
                    history.write("%s = %s\n"%(option, value))
            history.close()
        except Exception, instance:
              print instance.__class__.__name__ + ": "+str(instance)
            
#        print "*"+`texlist.get(0, texlist.size()-1)`+"*"
        
        self.exit=0
        

        print "Goodbye from TreeButton"
        


    
if __name__ == '__main__':
    #
    #  sys.path[0] is the folder containing the script,
    #
    # print sys.path
    
    errfilename = ""
    
    root = Tix.Tk(className="  TreeButton")
    runner = RunSample(root)
#    root.wm_attributes("-topmost", 1)
    runner.checkFloat()
    runner.mainloop()

#
# changelog
#
# Mar 5 2006
#  derive from TreeRunner by removing stuff
#
# Feb 14 2006
#  version 1
