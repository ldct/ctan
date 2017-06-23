del *.toc
del *.dvi
del *.cfg
latex newlfm.ins
latex newlfm.dtx
latex newlfm.dtx
latex newlfm.dtx
pdflatex newlfm.dtx
dvips -l 24 newlfm
copy newlfm.dvi manual.dvi
copy newlfm.ps manual.ps
ps2pdf manual.ps manual.pdf
dvips newlfm
del *.toc
del *.dvi
dvips newlfm
copy palm.pdf palmb.pdf
copy palm.eps palmb.eps
latex test1
latex test1
pdflatex test1
dvips test1
latex test1alt
latex test1alt
pdflatex test1alt
dvips test1alt
latex test2
latex test2
pdflatex test2
dvips test2
latex test2alt
latex test2alt
pdflatex test2alt
dvips test2alt
latex test3
latex test3
pdflatex test3
dvips test3
latex test3alt
latex test3alt
pdflatex test3alt
dvips test3alt
latex test4
latex test4
pdflatex test4
dvips test4
latex test4alt
latex test4alt
pdflatex test4alt
dvips test4alt
latex test5
latex test5
pdflatex test5
dvips test5
latex test5alt
latex test5alt
pdflatex test5alt
dvips test5alt
latex test6
latex test6
pdflatex test6
dvips test6
latex test6alt
latex test6alt
pdflatex test6alt
dvips test6alt
latex test7
latex test7
pdflatex test7
dvips test7
latex test7alt
latex test7alt
pdflatex test7alt
dvips test7alt
latex test8
latex test8
pdflatex test8
dvips test8
latex test8alt
latex test8alt
pdflatex test8alt
dvips test8alt
latex test9
latex test9
pdflatex test9
dvips test9
latex test10
latex test10
pdflatex test10
dvips test10
latex test11
xlatex test11
pdflatex test11
dvips test11
echo off
echo                                                                           *
echo ***************************************************************************
echo ***************************************************************************
echo newlfm setup has finished.                                                *   
echo                                                                           *
echo To determine success, check for existence of                              * 
echo newlfm.cls setdim.sty addrset.sty                                         *
echo manual.ps newlfm.ps test1.ps - test7.ps                                   * 
echo                                                                           *
echo To finish, move all files *.sty *.cls to the TeX path                     * 
echo In addition, letrinfo.tex should go to the same place as newlfm.cls.      *
echo                                                                           *
echo They should go to the local path, not the package path                    *
echo                                                                           * 
echo This ensures that upgrades to the package do not delete your              *
echo tailored version.                                                         * 
echo                                                                           *
echo This file can be run as often as you wish.                                *
echo ***************************************************************************
echo ***************************************************************************
echo                                                                           *

