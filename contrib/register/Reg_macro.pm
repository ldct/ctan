###############################################################################
#
# File:         Reg_macro.pm
# RCS:          $Header: /doc_tools/register/Reg_macro.pm 1.2 2004/08/16 23:37:06 lovell Exp $
# Description:  Module for parsing register macros from LaTeX documentation
# Author:       Matthew Lovell
# Created:      Mon Mar 31 16:50:05 2003
# Modified:     Mon Aug 16 14:51:20 2004
# Language:     CPerl
#
# (C) Copyright 2003, Matthew Lovell, all rights reserved.
#
###############################################################################

=pod

=head1 NAME

Reg_macro.pm

=head1 SYNOPSIS

Parses register/CSR information from LaTeX files.

=head1 DESCRIPTION

After searching through a files input/include tree, this module will search
for all \begin{register} macros.  All available information will be parsed
out of each encountered macro.  Parsed information includes:

  register name
  function
  offset
  field names, positions, and widths
  register reset value
  register reset mask
  register write mask

The parsed information can either be used either to produce in-order
tables for inclusion in documentation or to provide CSR information to
Phase 1 tools (metacheckers, CSR checkers, etc).

=head1 PUBLIC ROUTINES

 get_tex_files()   Recursively follow a file's input/include/import tree 

 get_regs()        Parse CSR information from a single specified file

 build_reg_hash()  Build a multi-level hash, keyed by function and 
                   offset, from the specified register information

=head1 SEE ALSO

Any project-specific LaTeX introductory material.


=head1 AUTHOR

Matthew Lovell (lovell@indra.com)

=cut

###############################################################################

package Reg_macro;
use     Exporter;
@ISA    = qw(Exporter);
@EXPORT = qw(get_tex_files
	     get_regs
	     build_reg_hash
	     $REG_DEBUG
	     $REG_STRIDE
	     $REG_ERRORS
	    );

use FileHandle;
use Data::Dumper;

# Debug flag
$REG_DEBUG = 0;

# How large are registers?  Default is 64-bits.
$REG_STRIDE = hex(0x08);   

# Error count
$REG_ERRORS = 0;

###############################################################################
#                         P U B L I C     R O U T I N E S                     #
###############################################################################




# Read a .tex file line by line, finding all \include or \input
# commands.  Recurse upon encountering one of those, thus making
# a list of the entire TeX file tree.  
#
# This subroutine can also be called with an option indicating that
# all \includegraphics targets should be parsed.  With that option,
# this routine can extract all dependencies for a LaTeX file, which
# is useful for GNU make.
#
# Arguments: filename
#            flag indicating all dependencies should be tracked
#
sub get_tex_files {
  my ($filename, $all_files) = @_;

  # return immediately for some file types
  if ($filename =~ /\.(eps|pdf|ps|func|error)$/) {
    print "#INFO  Reg_macro   Not attempting to read '$filename'\n" if ($REG_DEBUG);
    return $filename;
  }
 
  my $path = dirname($filename);

  # Add .tex if not present
  if ($filename !~ /\.\w+$/) {
    $filename .= '.tex';
  }

  # initialize file list
  my @file_list = ($filename);

  my $file = new FileHandle "$filename";  
  unless (defined $file) {
    print STDERR "#ERROR Reg_macro  Unable to open '$filename'\n";
    $REG_ERRORS++;
    return @file_list;
  }

  # Allow files to turn off dependency extraction in particular sections,
  # when desired.  This may be useful if a preamble needs to input a file
  # from the texmf tree, for example.
  my $dependency_skip = 0;

  while (<$file>) {

    $dependency_skip = 1 if (m/^%% DEPEND OFF/);
    $dependency_skip = 0 if (m/^%% DEPEND ON/);
    next if $dependency_skip;

    # Skip over comments.
    s/^%.*$//;             # Remove whole comment lines
    s/([^\\])%.*$/$1/;     # Remove everything after unescaped %'s


    # Get all include and input commands
    my @list = m/\\(?:include|input)\{([\w\/.-]+)\}/g;
    if ($path ne '' and $path ne '.') {
      @list = map { $path . "/" . $_ } @list;
    }

    # Find any import commands
    if (m|\\import\{([\w\/.-]+)}\{([\w\/.-]+)\}|) {
      push(@list,$1.$2);
    }

    # Find ALL files for make dependencies
    if ($all_files) {

      # Graphics files
      if (m|\\includegraphics(?:\[.*?\])?\{([\w\/.-]+)\}|) {

        # Add .eps if not present
        my $gfx_file = $1;
        if ($gfx_file !~ /\.\w+$/) {
          $gfx_file .= '.eps';
        }

        if ($path ne '' and $path ne '.') {
          $gfx_file = $path . "/" . $gfx_file;
        }

        push(@list,$gfx_file);
      }


      # project-specific:
      #
      #   CSR files (just look for the \CSRtable invocation)
      if (m|\\CSRtable|) {
	my $func_file;
	($func_file = $filename) =~ s/\.tex$/.func/;
	push(@list, $func_file);
      }


    } # end all_files

    my $subfile;
    for $subfile (@list) { 
      push(@file_list, get_tex_files($subfile, $all_files));
    }
  }

  return @file_list;
} # get_tex_files




# Read a .tex file line by line, looking for register declarations
# using the register.sty macro.  This subroutine only examines
# a single file.
# 
# Arguments: filename
#            reference to array of register information
#
sub get_regs {
  my ($filename, $reg_data) = @_;

  my $file = new FileHandle "$filename";

  # Record the function in which a register resides.  Allow this to 
  # be defined for just the first register in a file, then carried
  # over to all the others.
  my $function = 0;

  while (<$file>) {
    # find register definition
    if ( m/\\begin\{register\}\{[\w\!]+\}\{(.*)\}\{(.*)\}%(.*)$/ ) {
      my $long_name  = $1;
      my $offset     = $2;
      my $testable   = 1;
      my $short_name = undef;

      my $remainder  = $3;

      if ($remainder ne "") {
	if ($remainder =~ /don\'?t(_| )test/i) { $testable = 0 }
	if ($remainder =~ /NAME=([\w\\<>\d]+)/i) { $short_name = $1 }
	if ($remainder =~ /func=(\d)/i) { $function = $1 }
	if ($remainder =~ /off(?:set)?=([\w-,g]+)/) { $offset = $1 }
      }

      # get rid of escaped underscores
      $long_name =~ s/\\_/_/g;
      $short_name =~ s/\\_/_/g;

      my $width = 0;
      my $reg = {
		 long_name  => $long_name,
		 short_name => $short_name,
		 function   => $function,
		 offset     => $offset,
		 testable   => $testable,
		 fields     => []				
		};


      # now we need to extract fields.  first,
      # read in rest of the reg macro
      @wholereg = ();
      while (<$file>) {
	push(@wholereg, $_);
	last if (/\\end\{register\}/);
      }


      # combine lines if nested {}'s do not match
      for (my $i = 0; $i <= $#wholereg; $i++) {
	my $open  = grep(/\{/, split(//, $wholereg[$i]));
	my $close = grep(/\}/, split(//, $wholereg[$i]));

	if ($open != $close) {
	  my ($next) = splice(@wholereg, $i+1, 1);
	  $wholereg[$i] .= $next;
	  redo;
	}
      }

      foreach (@wholereg) {

	if (m/\\label\{(.*)\}/) {
	  $reg->{label} = $1;
	}

	# normal register field (reset value specified)
	if ( m/\\regfield\{(.*)\}\s*\{(.*)\}\s*\{(.*)\}\s*\{(.*)\}\s*%(.*)$/s ) {
	  my $remain = $5;
	  my $field_name  = $1;
	  my $field_len   = $2;
	  my $field_start = $3;  
	  my $reset       = $4;	  $reset =~ s/^\{//;  $reset =~ s/\}$//;  $reset =~ s/_//g;
	  my $reset_mask  = $testable;	  # indicates field is deterministic after reset
	  my $write_mask  = $testable;    # indicates field is modified by regbus writes


	  if ($field_name =~ m/\{([\w ])\}$/) {
	    $field_name = $1;
	  }
	  $field_name =~ s/\\_/_/g;


	  if ($remain =~ /read(?:_| )only/i) { $write_mask = 0; }
	  if ($remain =~ /status/i)          { $reset_mask = 0; $write_mask = 0; }
	  if ($field_name =~ /reserved/i)    { $write_mask = 0; }


	  if ($field_len > 32) {
	    die "#ERROR Reg_macro  Field of greater than 32 bits in $short_name!\n";	    
	  }

	  push(@{$reg->{fields}},
	       {
		name  => $field_name,
		len   => $field_len,
		start => $field_start,
		reset => $reset,
		reset_mask => $reset_mask,
		write_mask => $write_mask
	       });
	}


	# register field without reset
	if ( m/\\regfieldb\{(.*)\}\s*\{(.*)\}\s*\{(.*)\}\s*%(.*)$/s ) {
	  my $remain = $4;
	  my $field_name  = $1;
	  my $field_len   = $2;
	  my $field_start = $3;  
	  my $reset_mask  = $testable;	  # indicates field is deterministic after reset
	  my $write_mask  = $testable;    # indicates field is modified by regbus writes


	  if ($field_name =~ m/\{([\w ])\}$/) {
	    $field_name = $1;
	  }
	  $field_name =~ s/\\_/_/g;

	  if ($remain =~ /read(?:_| )only/i) { $write_mask = 0; }
	  if ($remain =~ /status/i)          { $reset_mask = 0; $write_mask = 0; }
	  if ($field_name =~ /reserved/i)    { $write_mask = 0; }

	  if ($field_len > 32) {
	    die "#ERROR Reg_macro  Field of greater than 32 bits in $short_name!\n";	    
	  }

	  push(@{$reg->{fields}},
	       {
		name  => $field_name,
		len   => $field_len,
		start => $field_start,
		reset_mask => $reset_mask,
		write_mask => $write_mask
	       });
	}


      } # end of register macro found
      
      print Dumper $reg if ($REG_DEBUG);
      push(@$reg_data, $reg);
      
    }
  }

} # get_regs



# Build a hash of registers, keyed on function and offset.  That is, 
# given parsed register information, construct a hash with the
# following structure
#
# $reg_hash { function } { offset }
#
# This will enable loops that iterate through registers in offset order
#
# Arguments: reference to array of reg information from get_regs
# Returns:   reference to constructed hash
#
sub build_reg_hash {
  my ($reg_array) = @_;
  my $reg_hash = {};
  
  my $unknown_count = 0;

  # iterate through all defined registers
  foreach my $reg (@$reg_array) {

    if ($reg->{offset} =~ m/^(0x[0-9A-F]+)$/i) {
      # simple offset specified
      my $offset = $1;

      if (exists $reg_hash->{$reg->{function}}{$offset}) {
	print STDERR "##ERROR Reg_macro  A Collision at offset $offset of function $reg->{function} \n";
	print STDERR "  Existing register: " . $reg_hash->{$reg->{function}}{$offset}{long_name} . "\n";
	print STDERR "  New register:      " . $reg->{long_name} . "\n";
	print STDERR "#END\n";
	$REG_ERRORS++;
      }

      $reg_hash->{$reg->{function}}{$offset} = $reg;
      
    } elsif ($reg->{offset} =~ m/^(0x[0-9A-F]+)\s*-+\s*(0x[0-9A-F]+)/i) {
      
      # range specified.  
      my $start = hex($1);
      my $end = hex($2);

      # determine stride
      my $stride = $REG_STRIDE;
      if ($reg->{offset} =~ m/,((?:0x)?[0-9A-F]+)/) {
	$stride = hex($1);
      }
      
      my $count = 0;
      for (my $index = $start; $index <= $end; $index += $stride) {

	my $offset = sprintf("0x%03x",$index);

	if (exists $reg_hash->{$reg->{function}}{$offset}) {
	  print STDERR "##ERROR Reg_macro  Collision at offset $offset of function $reg->{function} \n";
	  print STDERR "  Existing register: " . $reg_hash->{$reg->{function}}{$offset}{long_name} . "\n";
	  print STDERR "  New register:      " . $reg->{long_name} . "\n";
	  print STDERR "#END\n";
	  $REG_ERRORS++;
	}

	# perform any substitutions in long_name
	my $reg_copy = { %{$reg} };
	if ($reg_copy->{long_name} =~ m/<n>/) {
	  $reg_copy->{long_name} =~ s/<n>/$count/;
	} else {
	  $reg_copy->{long_name} .= " $count";
	}

	# perform any substitutions in short_name
	if ($reg_copy->{short_name} =~ m/<n>/) {
	  $reg_copy->{short_name} =~ s/<n>/$count/;
	} else {
	  $reg_copy->{short_name} .= "$count";
	}

	$reg_hash->{$reg->{function}}{$offset} = $reg_copy;
	$count++;
      }      

    } else {
      # unknown offset
      $reg_hash->{$reg->{function}}{"unk".$unknown_count++} = $reg;
      print STDERR "#WARNING Reg_macro   Register '$reg->{long_name}' has an unknown offset \n";
    }

  } # end foreach

  return $reg_hash;
} # build_reg_hash



# Convert an ASCII string representing a binary number to a true decimal number
sub bin2dec {
  return unpack("N", pack("B32", substr("0" x 32 . shift, -32)));
}

# Convert a true number to a binary ASCII string
sub dec2bin {
  my $str = unpack("B32", pack("N", shift));
  return $str;
}

# Covert an ASCII string representing a hex number to a binary ASCII string;
sub hex2bin {
  return unpack("B32", pack("N", hex(shift)));
}

# Convert an ASCII string representing a binary number to a hex ASCII string;
sub bin2hex {

    my $Bin = shift(@_);
    my $Hex;

    # Clean up string and look for errors
    chomp $Bin;

    if ($Bin =~ m/[^10]/) {
        print STDERR "#ERROR Reg_macro  $Bin is not binary\n";
        return ("");
    }
    return scalar reverse unpack "h*",(pack "b*", scalar reverse $Bin);
}



# required by Perl
1;

## Local Variables:
## mode: perl
## End:





