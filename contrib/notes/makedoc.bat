@echo off
rem MAKEDOC.BAT (FOR MSDOS)

rem Everything after a `rem' is ignored


rem ----------------- create a `ltxdoc.cfg': --------------------------

rem Edit the next line for options to pass to the package notes:
rem echo \PassOptionsToPackage{color}{notes}"	     >> ltxdoc.cfg

rem Edit the next line for options to pass to the class:
echo \PassOptionsToClass{a4paper}{article} >  ltxdoc.cfg
echo \batchmode                         >> ltxdoc.cfg

rem The next lines produce full indexes and change logs
rem you may not want those:

rem echo \AtBeginDocument{\RecordChanges}              >> ltxdoc.cfg
rem echo \AtEndDocument{\PrintChanges}                 >> ltxdoc.cfg
echo \AtBeginDocument{\CodelineIndex\EnableCrossrefs}  >> ltxdoc.cfg
echo \AtEndDocument{\PrintIndex}                       >> ltxdoc.cfg
echo \AtEndDocument{\addcontentsline{toc}{section}{Index}} >> ltxdoc.cfg

rem If you do not want any code listings, just documentation, then instead
rem of the lines above, uncomment the following:

rem echo \AtBeginDocument{\OnlyDescription}             >> ltxdoc.cfg

rem ---------- latex the documentation using `ltxdoc.cfg': --------------

echo 1st latex notes.dtx
latex notes.dtx
  
echo 2nd latex notes.dtx
latex notes.dtx

echo If you don't have Makeindex, exit now!
echo makeindx -s gind.ist notes.idx
makeindx -s gind.ist notes.idx

echo 3rd latex notes.dtx
latex notes.dtx

echo +++++++++++++ all done! ++++++++++++

