This is README.TXT 26.05.1999 Kr

Copyright 1992 1999 R. Huelse, W. Kaspar

This file is part of the expdlist package.
------------------------------------------

This file may be distributed under the terms of the
LaTeX Project Public License Distributed from CTAN
archives in directory macros/latex/base/lppl.txt; either
version 1 of the License, or (at your option) any later version.


README for the `expdlist' package
=================================

The expanded description environment will not replace the LaTeX
description environment, but on request you will have some additional
features. It supports an easy possibility of changing the left margin.
Also there is with \listpart a new command available which is valid in
all list environments. It gives the possibility to break a list for a
comment without touching any counters.

You should get the following files:

  expdlist.dtx     `expdlist' style for LaTeX, you have to run this
                   through the docstrip.tex program to produce the
                   corresponding style file.

  readme.txt       This File

  expdlist.ins     This is the installation script that will produce
                   the executable files in this package and the driver
                   files for the documentation.


Installation
============

To produce the executable files please run expdlist.ins through LaTeX,
i.e., say

   latex expdlist.ins

or whatever is necessary to run process a file with LaTeX on your
system.  This will generate the files:

  expdlist.sty  The expdlist style option for LaTeX.
  expdlist.drv  The driver file for producing the english documentation.
  expdlisg.drv  The driver file for producing the german documentation.

To produce the documentation run the corresponding driver files
through LaTeX. You are allowed to change the driver files to get a
special layout, etc. To get an index run the idx file through the
program MAKEINDEX.

Please note that you need to specify a style file for MAKEINDEX:

   gind.ist   for the index file   (result should be named *.ind)

Sample invocation for Unix:

   makeindex -s gind.ist expdlist


Distribution Conditions
=======================

All the files in this package are distributed under the terms of
the LaTeX Project Public License Distributed from CTAN
archives in directory macros/latex/base/lppl.txt; either
version 1 of the License, or (at your option) any later version.


Reporting Bugs
==============

Error reports in case of UNCHANGED versions to

                          Wolfgang Kaspar
                          Westf"alische Wilhelms-Universit"at M"unster
                          Zentrum f"ur Informationsverarbeitung
                          R"ontgenstra"se 9-13
                          48149 M"unster
                          Federal Republic of Germany
               Phone:     (0251)/83-31673
               Internet:  <kaspar@uni-muenster.de>
