Readme file associated to the psfragx package.

This file describes how to install the package.

All you need is the file psfragx.dtx. If the file psfragx.ins does
not exist, run LaTeX on the file psfragx.dtx. This should
generate the file psfragx.ins.

Run LaTeX on the file psfragx.ins. This generates all the files of
the package. The documentation will be generated if you run LaTeX
on psfragx.drv.

In order to create the index, you should run makeindex like this.
> makeindex -s gind psfragx.idx
> makeindex -s gglo -o psfragx.gls psfragx.glo

Do not forget to re-run LaTeX on psfragx.drv two times.

You can now read the file psfragx.dvi or transform it into
psfragx.ps or psfragx.pdf.

If you want to modify the default behaviour of psfragx, do not
edit the code, but create a file psfragx.cfg to this end. This
file will be input after the package psfragx is loaded.

Finally, if your TeX implementation uses a database to find files,
you should rebuild this database. fpTeX and teTeX systems use
> mktexlsr

Happy TeXing.

Pascal Kockaert

