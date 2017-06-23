#!/usr/bin/env perl
# $Id: nmbibtex.pl,v 1.1 2015-04-26 00:19:37 boris Exp $
#
# Copyright 2015, Michael Cohen <mcohen@u-aizu.ac.jp>
# and Boris Veytsman <borisv@lk.net>
# This work may be distributed and/or modified under the
# conditions of the LaTeX Project Public License, either
# version 1.3 of this license or (at your option) any 
# later version.
# The latest version of the license is in
#    http://www.latex-project.org/lppl.txt
# and version 1.3 or later is part of all distributions of
# LaTeX version 2003/06/01 or later.
#
# This work has the LPPL maintenance status `maintained'.
#
# The Current Maintainer of this work is Boris Veytsman

=pod

=head1 NAME

nmbibtex - a program to compile bibliographies for the package nmbib

=head1 SYNOPSIS

nmbibtex I<OPTIONS> I<FILE>

=head1 DESCRIPTION

nmbibtex calls L<bibtex(1)> for all aux files produced by the package
nmbib

=head1 OPTIONS

=over 4

=item B<-h>

Print the help information and exit

=item B<-min-crossrefs> I<number>

Send the option C<-min-crossref=NUMBER> to L<bibtex(1)>

=item B<-terse>

Send the option C<-terse> to L<bibtex(1)>

=item B<-v>

Print the copyright information and exit

=back

=head1 AUTHORS AND LICENSE

Copyright 2015, Michael Cohen mcohen@u-aizu.ac.jp
and Boris Veytsman borisv@lk.net

This work may be distributed and/or modified under the
conditions of the LaTeX Project Public License, either
version 1.3 of this license or (at your option) any 
later version.

=cut

    use strict;

my $USAGE = <<'END';
Usage: nmbibtex [-min-crossref NUMBER] [-terse] FILE

Copyright 2015, Michael Cohen mcohen@u-aizu.ac.jp
and Boris Veytsman borisv@lk.net

This work may be distributed and/or modified under the
conditions of the LaTeX Project Public License, either
version 1.3 of this license or (at your option) any 
later version.
END

    use Getopt::Long;

my $help=0;
my $terse=0;
my $mincross=-1;

GetOptions("h" => \$help, 
	   'v' => \$help,
	   '-terse' => \$terse,
	   "-min-crossrefs=i" => \$mincross) or die $USAGE;

if ($help){ 
    die $USAGE;
}

my $cmdline = "bibtex ";
if ($terse) {
    $cmdline .= "-terse ";
}
if ($mincross>0) {
    $cmdline .= "-min-crossrefs=$mincross ";
}



my $file = shift;

if (!length($file)) {
    die $USAGE;
}

# Just in case strip the suffix
$file =~ s/\.aux$//;
$file =~ s/\.AUX$//;

my @auxfiles = glob("$file-*.aux");
foreach my $auxfile (@auxfiles) {
    print `$cmdline $auxfile`;
}
