# File: maketfm.awk
# $Id: maketfm.awk,v 1.1 1999/05/25 12:16:26 loreti Exp $
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
# (CHARACTER C 9 ...) being contiguous, and immediately followed by
# (CHARACTER O 72 ...) in every .pl file.  It just reads from "infile1"
# until (CHARACTER C 0 ...), inserts the sequence (CHARACTER C 0 ...) ...
# (CHARACTER C 9 ...) from "infile2", then what follows starting from
# (CHARACTER O 72 ...) still from "infile1".

BEGIN {
  out = 1;
  
  while (getline <infile1 >0) {
    if ($1 == "(CHARACTER" && $2 == "O" && $3 == "72") out = 1;
    if ($1 == "(CHARACTER" && $2 == "C" && $3 == "0") {
      out = 0;
      while (getline <infile2 >0) {
        if ($1 == "(CHARACTER" && $2 == "C" && $3 == "0") out = 1;
        if ($1 == "(CHARACTER" && $2 == "O" && $3 == "72") {
          close(infile2);
          out = 0;
          break;
        }
        if (out) print;
      }
    }
    if (out) print;
  }
  close(infile1);
}
