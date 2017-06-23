# File: makefd.awk
# $Id: makefd.awk,v 1.1 1999/05/25 12:16:26 loreti Exp $
#
# Author: Maurizio Loreti, aka MLO or (HAM) I3NOO
# Work:   University of Padova - Department of Physics
#         Via F. Marzolo, 8 - 35131 PADOVA - Italy
# Phone:  +39 (049) 827-7216   FAX: +39 (049) 827-7102
# EMail:  loreti@padova.infn.it
# WWW:    http://wwwcdf.pd.infn.it/~loreti/mlo.html

BEGIN {
  FS="[{ ]";
  OFS="{";
  
  # Converts the input file name to the output file name;
  # e.g. t1hlh.fd --> t1hlos.fd .
  
  out = tolower(infile);
  sub("hlh", "hlos", out);
  
  while (getline <infile >0) {
    if ($1 == "%Filename:") {

      # The first record: just a comment with the file name.

      print "%Filename: " out;
      continue;
    } else if ($1 == "%Created") {

      # Second and third records: comments, skipped.

      continue;
    } else if ($1 == "\\ProvidesFile") {

      # The original (splitted in two lines) \ProvidesFile command
      # is converted to an hard-wired one-line equivalent.

      print "\\ProvidesFile{" out "}[Lucida Bright with Old Style numerals]";
      if (getline <infile >0) {
        continue;
      } else {
        print >/dev/stderr "Corrupted file, " infile;
        exit;
      }
    } else if ($1 == "\\DeclareFontFamily") {

      # The \DeclareFontFamily command: just convert "hlh" --> "hlos".

      $3 = "hlos}";
    } else if ($1 == "\\DeclareLucidaFontShape") {

      # In the \DeclareLucidaFontShape commands, in addition to the
      # conversion "hlh" --> "hlos", we must change the file name ---
      # but only for the upright shapes ("n").  I think it has no sense
      # a conversion for italic or smallcaps numerals to Old Style ...

      $3 = "hlos}";
      flag = ($5 == "n}");
      print;
      if (getline <infile >0) {
        if (flag) sub("hlh", "hlo");
      } else {
        print >/dev/stderr "Corrupted file, " infile;
        exit;
      }
    } else if ($1 == "\\DeclareFontShape") {

      # \DeclareFontShape: "hlh" --> "hlos"; hlh/b/n and hlh/bx/n are
      # mapped to hlos/b/n and hlos/bx/n .

      if ($5 == "n}" && ($4 == "b}" || $4 == "bx}")) {
        gsub("hlh", "hlos");
      } else {
        sub("hlh", "hlos");
      }
    }
    print;
  }
}
