This is the 00readme.txt file to accompany PSfrag, a system for LaTeX to
integrate LaTeX equations with Encapsulated PostScript figures.

These files compose the April 11, 1998 release of PSfrag 3.04. This is a
maintenance release, and fixes some bugs and shortcomings in version 3.03. If
you decide to install this release, you should not need to re-compile any of
your files, unless you happened to encounter one of the bugs in an earlier
version.

+-------------------------------+
|QUICK INSTALLATION INSTRUCTIONS|
+-------------------------------+

1. Run LaTeX on psfrag.ins, generating the package file psfrag.sty and
   the PostScript header file psfrag.pro.
2. Place psfrag.sty anywhere in your TeX search path; for kpathsea-based
   systems such as teTeX, this is determined by the TEXINPUTS variable.
3. Place psfrag.pro where your DVI-to-PostScript driver (e.g., dvips)
   can find it. For kpathsea-based systems such as teTeX, this is
   determined by the DVIPSHEADERS variable. For dvips in particular,
   this includes the directory containing tex.pro and special.pro.

More complete instructions are found in pfgguide.{tex,ps}. The files
example.eps and testfig.eps are needed to typeset the documentation, so
do not delete them if you want to re-generate pfgguide.ps. In fact, a
good test to see if your TeX/LaTeX/PSfrag installation is working
properly is to rename pfgguide.ps, generate a new pfgguide.ps from the
.tex file, and compare the two files.

+------------------------------------+
|IMPORTANT NOTES FOR PSFRAG 2.X USERS|
+------------------------------------+

Note that PSfrag 3.x is quite a bit different from previous versions.
The interface has been preserved, but the most notable difference is
the absence of the preprocessing script ps2frag. That's right: _you
will no longer need to run the ps2frag script_. This is a relief, of
course, to users who could never get Perl working on their OS.

However, PLEASE HEED the following differences between PSfrag 2.x and
PSfrag 3.x! You will be soundly flogged with wet noodles if you ask
about these and you haven't read this warning or the ones in pfgguide:
1) PSfrag replacements no longer show up in their proper positions when
   viewing the file with Xdvi. Instead, they show up in a vertical list
   along the left side of the figure. So, you can check if they are
   typeset properly in Xdvi, but you can't make sure they are properly
   placed. To do that, you should use a PostScript previewer like
   GhostView and GhostScript. This is an unforunate but necessary
   consequence of the elimination of the preprocessing step.
2) If you use the \tex command, note that it has been _deprecated_.
   Now, you have to explicitly turn it on, either for the entire
   LaTeX document or for each file individually. pfgguide.{tex,ps}
   describe how to do this in detail. The reasons for this once
   again turn to the elimination of the preprocessing step.
I think that the elimination of the ps2frag script far outweighs
either of these two (possible) disadvantages.

+---------------+
| RELEASE NOTES |
+---------------+

This is a bug-fix release, which fixes the following bugs encountered
in PSfrag 3.03:

1. Attempting to use EPS figures as PSfrag replacements would cause
   an infinite loop. This should work properly now.
2. Since the last release, the DVI-to-PS driver DVIPSone changed in
   a way that made PSfrag replacements appear upside down.
3. Small improvements to the psfrag.pro file have been made, which
   will hopefully allow you to make EPS files out of PSfrag-ged 
   figures. I can't make any guarantees about this yet.
4. The manual has been improved slightly; the known issues for
   XFig and Seminar are now discussed. In addition, a more complete
   discussion about ``valid'' tags is included.

Bug reports and suggestions should go to psfrag@rascals.stanford.edu,
the PSfrag maintainer's email-list. However, before submitting a bug
report, please make sure that it is not already covered in the "Known
issues" section of pfgguide.tex!

Michael C. Grant

