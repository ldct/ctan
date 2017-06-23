hilowres is a package that can be used to simplify a global inclusion of
low resolution versions of high resolution images, if each pair of files
have the same basename (e.g. bird_low.eps and bird.eps). The package is
a totally uncomplicated wrapper around the \includegraphics command of the
graphicx package. 

Example usage: \hilowfig[width=3in]{bird}. If the option `low' is
specified when loading the package, then the low resolution version
(i.e. bird_low.eps) is used, otherwise the high resolution version (i.e.
bird.eps) is used.

Author: Johann Gerell <jogerell@acc.umu.se>
