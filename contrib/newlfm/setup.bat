del *.toc
del *.dvi
latex newlfm.ins
latex newlfm.dtx
latex newlfm.dtx
dvips -l 23 newlfm
del *.toc
del *.dvi
copy newlfm.dvi manual.dvi
copy newlfm.ps manual.ps
