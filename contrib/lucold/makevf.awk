# File: maketfm.awk
# $Id: makevf.awk,v 1.1 1999/05/25 12:16:26 loreti Exp $
#
# Author: Maurizio Loreti, aka MLO or (HAM) I3NOO
# Work:   University of Padova - Department of Physics
#         Via F. Marzolo, 8 - 35131 PADOVA - Italy
# Phone:  +39 (049) 827-7216   FAX: +39 (049) 827-7102
# EMail:  loreti@padova.infn.it
# WWW:    http://wwwcdf.pd.infn.it/~loreti/mlo.html
#
#########################################################################
#
#  This awk procedure relies on the sequence (CHARACTER C 0 ...) ...
# (CHARACTER C 9 ...) being contiguous and immediately followed by
# (CHARACTER O 72 ...) in every .vpl file.  This GNU-awk program
# copies the .vpl file "infile" to stdout, remapping the numerical
# characters to another font: namely the file "mft" with checksum
# "ck".

BEGIN {
  numbers = "0123456789";

  while (getline <infile >0) {
    if ($1 == "(VTITLE") {
      print "(VTITLE )";
    } else if ($1 == "(LIGTABLE") {

      # Insert MAPFONT 1 before LIGTABLE (and after MAPFONT 0)

      print "(MAPFONT D 1";
      print "   (FONTNAME " mft ")";
      print "   (FONTCHECKSUM O " ck ")";
      print "   (FONTAT R 1.0)";
      print "   (FONTDSIZE R 10.0)";
      print "   )";
      print;
    } else if ($1 == "(CHARACTER"   &&
               $2 == "C"   &&
               index(numbers, $3) != 0) {

      # Switch all numerical characters to MAPFONT 1: skips to the
      # closing parenthesis of the record, and insert an appropriate
      # couple of SELECTFONT/SETCHAR statements before.  The input
      # has been processed from "maketfm.awk", and all the mapping
      # information is missing (only for these characters).

      paren = 0;
      save3 = $3;
      while (1) {
        for (i=1; i<=length(); i++) {
          c = substr($0, i, 1);
          if (c == "(") paren++;
          if (c == ")") paren--;
        }
        if (paren == 0) break;
        print;
        if (getline <infile <=0) {
          print >/dev/stderr "Corrupted file, " infile;
          exit;
        }
      }
      print "   (MAP";
      print "      (SELECTFONT D 1)";
      print "      (SETCHAR C " save3 ")";
      print "      )";
      print;
    } else {
      print;
    }
  }
}
