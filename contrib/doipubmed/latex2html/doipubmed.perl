#!/usr/bin/perl

# File          : doipub.perl
# Author        : Nicola Talbot
# Date          : 9th September 2005
# Last Modified : 20 Aug 2007
# Version       : 1.01
#
# This is a LaTeX2HTML style implementing the doipubmed package, and
# is distributed as part of that package.
# Copyright 2007 Nicola L.C. Talbot
# This work may be distributed and/or modified under the
# conditions of the LaTeX Project Public License, either version 1.3
# of this license of (at your option) any later version.
# The latest version of this license is in
#   http://www.latex-project.org/lppl.txt
# and version 1.3 or later is part of all distributions of LaTeX
# version 2005/12/01 or later.
#
# This work has the LPPL maintenance status `maintained'.
#
# The Current Maintainer of this work is Nicola Talbot.

sub do_cmd_doitext{
   local($_) = @_;
   local($doi);

   s/$next_pair_pr_rx/$doi=$2;''/eo;
   join('', "doi", $_);
}

sub do_cmd_pubmedtext{
   local($_) = @_;
   local($pubmed);

   s/$next_pair_pr_rx/$pubmed=$2;''/eo;
   join('', "PubMed", $_);
}

sub do_cmd_doi{
   local($_) = @_;
   local($doi,$doitext,$br_id);

   s/$next_pair_pr_rx/$br_id=$1;$doi=$2;''/eo;

   $doitext = &translate_commands("\\doitext$OP$br_id$CP$doi$OP$br_id$CP");

   $doi=~s/#/${percent_mark}23/g;
   join('',
        &make_href("http://dx.doi.org/$doi", $doitext),
        $_);
}

sub do_cmd_pubmed{
   local($_) = @_;
   local($pubmed,$pubmedtext,$br_id);

   s/$next_pair_pr_rx/$br_id=$1;$pubmed=$2;''/eo;

   $pubmedtext = &translate_commands("\\pubmedtext$OP$br_id$CP$pubmed$OP$br_id$CP");

   join('',
        &make_href("http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&list_uids=$pubmed&dopt=Abstract",
                   $pubmedtext),
        $_);
}

sub do_cmd_citeurl{
   local($_) = @_;
   local($url);

   s/$next_pair_pr_rx/$url=$2;''/eo;

   join('', '&lt;',
        &make_href($url, $url), '&gt;',
        $_);
}

1;
