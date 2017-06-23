#!/usr/bin/python
# -*- coding: utf-8 -*-
# This file generate the inheritance graphs (.dot and .pdf file) from the .bib file examples.
# To do it, its create temporary .tex file, calling a specific .bib file (as https://github.com/plk/biber/issues/110 was rejected).
# It is licensed on GPL 3 licenses.
# https://www.gnu.org/licenses/gpl-3.0.fr.html
# Copyright : Maïeul Rouquette 2016-…

import os


# specific preamble for some file
specific_preamble = {
  "example-bookineditor-BookineditorFromEditor":"\\toggletrue{BookineditorFromEditor}\n"
}

#List all the files on the current directory
directory_files = os.listdir(".")


#Loop on them, and for the .bib file, generate the .tex, .dot and .pdf file
for file_name in directory_files:
    basename, ext = os.path.splitext(file_name)

    if ext != '.bib':#only the .bib file
        continue

    # write the .tex file content
    tex_file_name = basename + ".tex"
    tex_file_content = "\documentclass{article}\n\
    \\usepackage[bibstyle=morenames]{biblatex}\n"
    
    if basename in specific_preamble:
        tex_file_content = tex_file_content + specific_preamble[basename]
        
    tex_file_content = tex_file_content + "\\bibliography{" + file_name + "}\n\
    \\begin{document}\n\
    \\nocite{*}\n\
    \end{document}"
    tex_file_file = open(tex_file_name, "w")
    tex_file_file.write(tex_file_content)
    tex_file_file.close()

    # generate the .bcf, .dot and .pdf file
    os.system("pdflatex " + basename)
    os.system("biber -output-format=dot --dot-include=crossref,field " + basename)
    os.system("dot -Tpdf " + basename + ".dot " + "-o " + basename + ".pdf")

    # delete the temporary files, to avoid distributing it and to have cleaner folder
    for ext in ["aux","bcf","blg","log","run.xml","tex"]:
        os.remove(basename+"."+ext)
