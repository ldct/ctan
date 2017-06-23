#!/usr/bin/perl

$enc2uni=$ARGV[0];
$encname=$ARGV[1];
shift;shift;
$glyph2uni=join("', `",@ARGV);

while(<>) {
	if ($_ =~ /^#/) { next }
	s/(....);([^;]*);/$glyphenc{$1}=$2/e;
}

print <<"ENDHEADER";
% This file is generated from `$enc2uni' and `$glyph2uni'
%
% LIGKERN hyphen hyphen =: endash ; endash hyphen =: emdash ;
% LIGKERN quoteleft quoteleft =: quotedblleft ;
% LIGKERN quoteright quoteright =: quotedblright ;
% LIGKERN comma comma =: quotedblbase ; less less =: guillemotleft ;
% LIGKERN greater greater =: guillemotright ;
% LIGKERN f f =: ff ; f i =: fi ; f l =: fl ; ff i =: ffi ; ff l =: ffl ;
%
% LIGKERN space {} * ; * {} space ; zero {} * ; * {} zero ;
% LIGKERN one {} * ; * {} one ; two {} * ; * {} two ;
% LIGKERN three {} * ; * {} three ; four {} * ; * {} four ;
% LIGKERN five {} * ; * {} five ; six {} * ; * {} six ;
% LIGKERN seven {} * ; * {} seven ; eight {} * ; * {} eight ;
% LIGKERN nine {} * ; * {} nine ;
%
/${encname}Encoding [
ENDHEADER

$n=0;
open(ENC2UNI,$enc2uni);
while(<ENC2UNI>) {
	if ($_ =~ /^#/) { next }
	s/(..);([^;]*);/$codeenc=$1;$codeuni=$2/e;
	if ($n % 16 == 0) { printf "%% 0x%02X\n",$n }
	$n++;
	if ($glyphenc{$codeuni} ne "") {
		print "/$glyphenc{$codeuni}\n";
	} else {
		print "/.notdef\n";
	}
}
close(ENC2UNI);

print "] def\n";
