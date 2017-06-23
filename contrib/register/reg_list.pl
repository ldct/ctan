#!/usr/bin/env perl
###############################################################################
#
# File:         reg_list.pl
# RCS:          $Header: /doc_tools/register/reg_list.pl 1.2 2004/08/16 23:37:07 lovell Exp $
# Description:  Output a table (per function) of CSR's in offset order
# Author:       Matthew Lovell
# Created:      Mon Mar 31 16:50:05 2003
# Modified:     Mon Aug 16 17:36:19 2004
# Language:     CPerl
#
# (C) Copyright 2003, Matthew Lovell, all rights reserved.
#
###############################################################################

use lib("$ENV{WJ_HOME}/docs/common",
	"$ENV{WJ_HOME}/docs/common");

use Getopt::Long;
use FileHandle;
use Reg_macro;


# Parameters controlling execution
my $params = 
  {
   file  => "",       # LaTeX file to parse
   list  => 0,        # just list files
   table => 0,        # produce table files
   Make  => 0,        # dependency extraction
  };


$DEBUG = 0;

###############################################################################
#                               M A I N                                       #
###############################################################################

# read options and get files from command-line
get_input_opts($params);
$REG_DEBUG = 1 if ($DEBUG);

my @files = get_tex_files($params->{file}, $params->{Make});

if ($DEBUG or $params->{list}) {
  print "\nFile tree\n";
  print "----------------------------\n";
  print join("\n",@files) . "\n\n";
  exit if ($params->{list});
}


#
# Just output Makefile dependencies and exit
#
if ($params->{Make}) {
  print_depends_list($params->{file},
		     @files);
  exit(0);
}


#
# ...otherwise, go on to extract some register information
#

my @reg_data = ();

for (@files) {
  get_regs($_,\@reg_data)
}

my $reg_hash = build_reg_hash(\@reg_data);

if (!$params->{table}) {
  print_reg_list($reg_hash);
} else {
  make_reg_files($params->{file}, $reg_hash);
}


exit($REG_ERRORS);

###############################################################################
#                         S U B R O U T I N E S                               #
###############################################################################


# Print out file dependencies in a format suitable for use by
# GNU make.  Makefile rules should be setup to update this
# information as necessary.
#
# Arguments: .tex filename
#            array of dependencies
#
sub print_depends_list {
  my ($file, @depends) = @_;

  my @setup_files = qw[HPpreamble.tex preamble.sty];

  # separate all .error files
  my @error_files = grep { $_ =~ /\.error$/ } @depends;

  # separate all .func files
  my @func_files = grep  { $_ =~ /\.func$/ } @depends;

  # ensure output is on STDOUT
  select STDOUT;

  my $aux_file, $dvi_file, $d_file, $ps_file;
  ($aux_file = $file) =~ s/\.tex$/.aux/;
  ($dvi_file = $file) =~ s/\.tex$/.dvi/;
  ($ps_file = $file) =~ s/\.tex$/.ps/;
  ($d_file = $file) =~ s/\.tex$/.d/;


  print "#\n";
  print "# Generated dependency file.  Do NOT check into HMS !!\n";
  print "#\n\n";

  # Print out dependency list for the .aux file itself
  print "$aux_file $dvi_file : \\\n";
  map { print "\t$_ \\\n" } @setup_files;
  map { print "\t$_ \\\n" } @error_files;
  map { print "\t$_ \\\n" } @func_files;

  foreach my $file (@depends) {
    next if ($file =~ m/\.(?:error|func)$/);
    next if ($file =~ m/newHP\.eps/);
    print "\t$file \\\n";
  }
  print "\n";


  # Repeat for the .d file, leaving out unneeded files
  print "$d_file : \\\n";

  foreach my $file (@depends) {
    next if ($file =~ m/\.(?:error|func)$/);
    next if ($file =~ m/\.eps$/);
    print "\t$file \\\n";
  }
  print "\n\n";


} # print_depends_list



# Print out register names in offset order to STDOUT.  Used to 
# ensure script is acting correctly.
#
# Arguments: reference to hash constructed by build_reg_hash
#
sub print_reg_list {
  my ($reg_hash) = @_;

  my @functions = keys %$reg_hash;
  
  print "\n";
  for my $func (sort @functions) {

    print "Function $func Registers\n";
    print "-" x 80 . "\n";

    for my $offset (sort { hex($a) <=> hex($b) } keys %{$reg_hash->{$func}}) {
      my $output = "";
      if ($offset =~ /^unk/) {
	$output = sprintf(" ?   %-50s  %-20s", 
			   $reg_hash->{$func}{$offset}{long_name},
			   $reg_hash->{$func}{$offset}{short_name}
			  );
      } else {
	$output = sprintf("%03x  %-50s  %-20s", 
			  hex($offset),
			  $reg_hash->{$func}{$offset}{long_name},
			  $reg_hash->{$func}{$offset}{short_name}
			 );
      }

      print "$output\n";
    }

    print "\n\n";
  }

} # print_reg_list



# Output a LaTeX longtable listing registers in each function. 
#
# Arguments: name of latex file parsed, used as the root for 
#            the table files names
#
#            reference to hash created by build_reg_hash
#
sub make_reg_files {
  my ($orig_file, $reg_hash) = @_;

  my @functions = keys %$reg_hash;
  for my $func (sort @functions) {

    my $filename = $orig_file =~ s/\.tex$//;
    $filename = $orig_file . ".func$func";

    my $file = new FileHandle ">$filename";  
    if (!defined $file) {
      print STDERR "#ERROR reg_list.pl  Unable to open $filename for writing!";
      die;
    }

    for my $offset (sort { hex($a) <=> hex($b) } keys %{$reg_hash->{$func}}) {

      my $name = $reg_hash->{$func}{$offset}{long_name};
      if (defined $reg_hash->{$func}{$offset}{short_name}) {
	$name .= " ($reg_hash->{$func}{$offset}{short_name})";
      }

      my $pageref = "";
      if (exists $reg_hash->{$func}{$offset}{label}) {
	$pageref = '\pageref{' . $reg_hash->{$func}{$offset}{label} . '}';
      }

      if ($offset =~ /^unk/) {
	printf $file "\\texttt{?} & %s & %s \\\\\n",
	  $name, $pageref;	
      } else {
	printf $file "\\texttt{0x%03x} & %s & %s \\\\\n",
	  hex($offset), $name, $pageref;	
      }

    }

    close $file;

  }  


} # make_reg_files


# Retrieve the input parms passed to this script and set the proper
# options.  Some global variables may be set by this subroutine.
#
# Arguments: reference to parameters hash
#
sub get_input_opts {  
  my ($params) = @_;
  my $help     = 0;
  
  # Setup for GetOptions
  $Getopt::Long::autoabbrev = 1;
  $Getopt::Long::ignorecase = 0;
  $Getopt::Long::order = $PERMUTE;

  my @optl = ();
  push(@optl, 
       "help",        \$help,	          # show usage information
       "debug",       \$DEBUG,            # show debug information
       "file=s",      \$params->{file},    # LaTeX file to parse

       "list",        \$params->{list},
       "table",       \$params->{table},
       "Make",        \$params->{Make},
       );

  GetOptions(@optl);

  if ($help) {
    print_usage_and_die();
  }

  if ($params->{file} eq "") {
    print "Must specify a LaTeX file.  Use --help for usage info.\n";
    exit(1);
  }


  return;
} # get_input_opts


sub print_usage_and_die {
   $usage = <<"@@USAGE_INFO";
Register (CSR) Lister

This script parses all register/CSR diagrams found in a LaTeX document.
The document can include or import sub-documents; the script will follow
the tree.

By default, a human-readable list of registers, ordered by offset
within each function, is printed to STDOUT.  If the -table option is
given, files are written with a similar table formatted for inclusion
in a LaTeX document.  The filenames will have the same root as the
file specified on the command-line, but with an extension of 

  .func<function>

for each non-empty function encountered during parsing.

Usage:

  reg_list.pl -file <.tex file> 
               ( [-table] | [-list] | [-Make] )
               [-debug] [-help]


    <.tex file>  LaTeX file to parse

    Mutually exclusive
    ------------------
    -table       Produce LaTeX table output, no STDOUT output
    -list        Show the file tree of <.tex file>, then quit
    -Make        Produce makefile dependencies for specified LaTeX file


    Other options
    -------------
    -debug       Show parsing debug information
    -help        Print this stuff


@@USAGE_INFO

   print $usage;
   exit(1);
} # print_usage_and_die
