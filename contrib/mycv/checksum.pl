#!/usr/bin/perl

# $Id: checksum.pl 91 2012-05-20 19:28:13Z ghangenit $

use Term::ANSIColor;
use warnings;
use strict;

##
## Variables
##

my $checksumregex = "[a-fA-F0-9]{32}";
my %checksums = (
   SRCCHECKSUM => "mycv.dtx 8AACA8304D7F1F21480FDD12D7F53EC1",
   EXPCHECKSUM => "Examples/mycv-examples.dtx A745EADAE2358B66C6BFC3F55F3EA793",
   DOCCHECKSUM => "Doc/mycv.tex 83ECEA99562FE163FDF735FFC582AE3B"
);

my @externalcmds = ( 'pdftex', 'latexmk' );

##
## Functions
##

sub exitWithError($$)
{
   my $stasus=shift;
   my $cmd=shift;

   printf STDERR ("Error: command <%s> exited with value %d.\n", $cmd, $stasus >> 8);
   exit $stasus;
}

sub checksum()
{
   # 'keys' returns the list of keys in an apparently random order
   for my $key ( keys %checksums )
   {
      my ($filename, $expectedmd5) = split " ", $checksums{$key};

      print "\n------------------------------------------------------------\n";
      print "<$filename>:\n<$expectedmd5> is the expected checksum.\n";

      # gets some info among which the checksum of the file '$filename'
      my @result = `$externalcmds[0] "\\message{\\pdfmdfivesum file{$filename}}\\end"`;
      exitWithError( $?, $externalcmds[0] ) if ( $? != 0 );

      foreach my $info (@result)
      {
         if ( $info =~ /($checksumregex)/ ) # the checksum info
         {
            chomp($info);
            print "<$info> is the found checksum.";
            if ( $info eq $expectedmd5 )
            {
               print color 'bold green';
               print "\n[OK, they match!]\n"; print color 'reset';
            }
            else
            {
               print color 'bold red';
               print "\n[OOPS, they do not match!]\n"; print color 'reset';
            }
         }
      }
      print "------------------------------------------------------------\n";
   }

   `$externalcmds[1] -c texput.log 2>&1`; # removes the log file produced by 'pdftex'
   exitWithError( $?, $externalcmds[1] ) if ( $? != 0 );
}

##
## Main
##

checksum();