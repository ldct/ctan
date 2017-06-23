############################################################################
#                                                                          #
#  Extension to LaTeX2HTML to load further features from                   #
#  the EASYEQN package.                                                    #
#                                                                          #
#  date          : 2002, March 18                                          #
#  release       : 1.1 (beta)                                              #
#  first release : 1999, Sept. 12                                          #
#  file          : easyeqn.perl                                            #
#  author        : Enrico Bertolazzi                                       #
#  email         : enrico.bertolazzi@ing.unitn.it,                         #
#                                                                          #
#  This program is free software; you can redistribute it and/or modify    #
#  it under the terms of the GNU General Public License as published by    #
#  the Free Software Foundation; either version 2, or (at your option)     #
#  any later version.                                                      #
#                                                                          #
#  This program is distributed in the hope that it will be useful,         #
#  but WITHOUT ANY WARRANTY; without even the implied warranty of          #
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the           #
#  GNU General Public License for more details.                            #
#                                                                          #
#  You should have received a copy of the GNU General Public License       #
#  along with this program; if not, write to the Free Software             #
#  Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.               #
#                                                                          #
#  Copyright (C) 1999                                                      #
#                                                                          #
#      Enrico Bertolazzi                                                   #
#      Dipartimento di Ingegneria Meccanica e Strutturale                  #
#      Universita` degli Studi di Trento                                   #
#      Via Mesiano 77, I-38050 Trento, Italy                               #
#                                                                          #
#            ___    ____  ___   _   _        ___    ____  ___   _   _      #
#           /   \  /     /   \  \  /        /   \  /     /   \  \  /       #
#          /____/ /__   /____/   \/        /____/ /__   /____/   \/        #
#         /   \  /     /  \      /        /   \  /     /  \      /         #
#        /____/ /____ /    \    /        /____/ /____ /    \    /          #
#                                                                          #
############################################################################

package main;

$display_env_rx = join('|', $display_env_rx, 'EQ','EQA');

%easyeqn_align = (
		  'l' => " ALIGN=\"LEFT\" ",
		  'c' => " ALIGN=\"CENTER\" ",
		  'r' => " ALIGN=\"RIGHT\" "
		  ) ;

%easyeqn_valign = (
		   't' => " VALIGN=\"TOP\" ",
		   'c' => " VALIGN=\"CENTER\" ",
		   'b' => " VALIGN=\"BOTTOM\" "
		   ) ;

$easyeqn_label_vpos = "c" ;
$easyeqn_label_hpos = "r" ;
$easyeqn_lc         = "c" ;
$easyeqn_allnumber  = 0 ;

sub do_easyeqn_leqno { $easyeqn_label_hpos = "l" ; }
sub do_easyeqn_fleqn { $easyeqn_lc = "l" ; }
sub do_easyeqn_math { }
sub do_easyeqn_allnumber { $easyeqn_allnumber = 1 ; }
sub do_easyeqn_warning { }

sub do_cmd_refeq {
    local($_) = @_;
    join('',&process_ref($cross_ref_mark,$cross_ref_mark,'')) ;
}

sub do_cmd_eqlabeltop {
    local($_) = @_;
    $easyeqn_label_vpos = "t" ;
    join('',$_);
}

sub do_cmd_eqlabelbot {
    local($_) = @_;
    $easyeqn_label_vpos = "b" ;
    join('',$_);
}

sub do_cmd_eqlabelcenter {
    local($_) = @_;
    $easyeqn_label_vpos = "c" ;
    join('',$_);
}

sub do_cmd_equationcenter {
    local($_) = @_;
    $easyeqn_lc = "c" ;
    join('',$_);
}

sub do_cmd_equationleft {
    local($_) = @_;
    $easyeqn_lc = "l" ;
    join('',$_);
}

sub do_cmd_numberleft {
    local($_) = @_;
    $easyeqn_label_hpos = "l" ;
    join('',$_);
}

sub do_cmd_numberright {
    local($_) = @_;
    $easyeqn_label_hpos = "r" ;
    join('',$_);
}

sub do_env_EQ {
    local($_) = @_;
    $_ =~ s/\\eqlabel/\\label/g ;
    my $label = " " ;
    my $label_name = "";
   
    $latex_body .= join('',
			"\n\\setcounter{equation}{",
			$global{'eqn_number'}, "}\n");

    if ( $easy_allnumber ) { $global{'eqn_number'}++ ; }
    
    if ( /\\label\s*\[([^\]]+)\]\s*(<<\d+>>)(.+)\2/ || /\\label\s*(\([^\)]+\))\s*(<<\d+>>)(.+)\2/ ) { 
	# \label[..]{..}
	# \label(..){...}
	$_ = $`. $' ;
	$label_name = $3 ;
	my $buffer = $1 ;	
	$buffer =~ s/~/$global{'eqn_number'}/i ;
	$label = join('', &translate_commands($buffer) ) ;
    }
    elsif (/\\label\s*\[([^\]]+)\]/ || /\\label\s*(\([^\)]+\))/ ) {
	# \label[..] 
	# \label(..)
	$_ = $`. $' ;
	my $buffer = $1 ;	
	$buffer =~ s/~/$global{'eqn_number'}/i ;
	$label = join('', &translate_commands($buffer) ) ;
    }
    elsif ( /\\label\s*(<<\d+>>)(.+)\1/ ) {
	# \label{...}
	$_ = $`. $' ;
	$label_name = $2 ;
	$global{'eqn_number'}++ unless $easy_allnumber ;
	$label = join('',"(", &translate_commands('\theequation'), ")" ) ;
    }
    elsif (/\\yesnumber/ || $easyeqn_allnumber ) {
	$_ = $`. $' ;
	$global{'eqn_number'}++ unless $easy_allnumber ;
	$label = join('',"(", &translate_commands('\theequation'), ")" ) ;
    }
    
    $_ = &process_undefined_environment($env,$id,$_),

    my $label_left  = " " ;
    my $label_right = " " ;
    if ( $easyeqn_label_hpos eq "l" ) {
	$label_left = $label ;
    } else {
	$label_right = $label ;
    }
 
    join('',
         "\n<A NAME=\"", $label_name,"\">",
	 "\n  <table WIDTH=\"100%\">",
	 "\n  <tr",$easyeqn_align{$easyeqn_label_vpos},">",
	 "\n    <td WIDTH=\"10%\" ALIGN=\"LEFT\">", $label_left, "</td>",
	 "\n    <td WIDTH=\"90%\"",$easyeqn_align{$easyeqn_lc},">",
	 $_,
	 "</td>",
	 "\n    <td WIDTH=\"10%\" ALIGN=\"RIGHT\">", $label_right, "</td>",
	 "\n  </tr>",
	 "\n  </table>",
	 "\n</A>") ;
}

###############################################################################

sub do_env_EQA {
    local($_) = @_ ;
    
    my $local_id = $id ;

    s/^\s+//g ;
    s/^\n+/\n/g ;

    $latex_body .= join('',
                        "\n\\setcounter{equation}{",
                        $global{'eqn_number'}, "}\n");
    
    # get alignment
    s/^\s*\[([^\]]+)\]// ;
    my $align = $1 ;
    
    $align =~ s/(.)/\1\,/g ;
    
    my $ncol = 0 ;
    my @acol ;
    foreach my $char (split(',',$align)) {
	$acol[$ncol] = $easyeqn_align{$char} ;
	$ncol++ ;
    }
    
    # delete \\ spacing
    s/\\\\\s*\[([^\]]+)\]/\\\\/g ;
    
    my $letter = 'a' ;
    my $nr = 0 ;
    my $outeqn = "<BR>\n<table WIDTH=\"100%\">" ;
    
    # split rows
    
    foreach $_ ( split('\\\\\\\\',$_) ) {
	# get label
	
	my $label = " " ;
	my $label_name = "";
	
	if ( $easy_allnumber ) { $global{'eqn_number'}++ ; }
	
	if ( /\\label\s*\[([^\]]+)\]\s*(<<\d+>>)(.+)\2/ || 
	     /\\label\s*(\([^\)]+\))\s*(<<\d+>>)(.+)\2/ ) { 
	    # \label[..]{..} 
	    # \label(..){...}
	    $_ = $`. $' ;
	    $label_name = $3 ;
	    my $buffer = $1 ;
	    $buffer =~ s/~/$global{'eqn_number'}/i ;
	    $label = join('', &translate_commands($buffer) ) ;
	}
	elsif ( /\\label\s*\[([^\]]+)\]/ ||
	        /\\label\s*(\([^\)]+\))/ ) { 
	    # \label[..]
	    # \label(..)
	    $_ = $`. $' ;
	    my $buffer = $1 ;	
	    $buffer =~ s/~/$global{'eqn_number'}/i ;
	    $label = join('', &translate_commands($buffer) ) ;
	}
	elsif ( /\\label\s*(<<\d+>>)(.+)\1/ ) { 
	    # \label{...}
	    $_ = $`. $' ;
	    $label_name = $2 ;
	    $global{'eqn_number'}++ unless $easy_allnumber ;
	    $label = join('',"(", &translate_commands('\theequation'), ")" ) ;
	}
	elsif ( /\\yesnumber/ || $easyeqn_allnumber ) {
	    $_ = $`. $' ;
	    $global{'eqn_number'}++ unless $easy_allnumber ;
	    $label = join('',"(", &translate_commands('\theequation'), ")" ) ;
	}

	my $label_left  = " " ;
	my $label_right = " " ;
	if ( $easyeqn_label_hpos eq "l" ) {
	    $label_left = $label ;
	} else {
	    $label_right = $label ;
	}

	my $fill_left  = "\n  <td WIDTH=\"1000*\"> </td>" ;
	my $fill_right = "\n  <td WIDTH=\"1000*\"> </td>" ;
	
	$fill_left = "\n  <td WIDTH=\"0*\"> </td>" if ($easyeqn_lc eq "l") ;

	$outeqn = join('',
	               $outeqn,
		       "\n<tr>",
		       "\n  <td WIDTH=\"10%\" VALIGN=CENTER ALIGN=\"LEFT\">",
		       $label_left,
		       "</td>",
		       $fill_left,
		       "\n  <A NAME = \"", $label_name, "\"></A>") ;
	
	my $nc = 0 ;
	# split columns
        foreach ( split('\;SPMamp\;',$_) ) {
	    $id = $letter . $local_id ;
	    $_ = &process_undefined_environment("displaymath", $id, $_) ;
	    $outeqn = join('',
	                   $outeqn,
	                   "\n  <td WIDTH=\"0*\" VALIGN=CENTER ", $acol[$nc],">",
			   $_,
			   "</td>") ;
	    $nc++ ;
	    $letter++ ;
	}

	$outeqn = join('',
	               $outeqn,
		       $fill_right,
	               "\n  <td WIDTH=\"10%\" VALIGN=CENTER ALIGN=\"RIGHT\">",
		       $label_right,
		       "</td>",
		       "\n</tr>") ;
	$nr++ ;
    }
    join('',$outeqn, "\n</table>\n<BR CLEAR=\"ALL\">") ;
}

&ignore_commands( <<_IGNORED_CMDS_);
_IGNORED_CMDS_

&process_commands_in_tex (<<_RAW_ARG_CMDS_);
_RAW_ARG_CMDS_

&process_commands_inline_in_tex (<<_RAW_ARG_CMDS_);
eqspacing # {}
eqleftmargin # {} 
eqcolumnsep # {}
eqrowsep # {}
_RAW_ARG_CMDS_

&process_commands_nowrap_in_tex (<<_RAW_ARG_NOWRAP_CMDS_);
_RAW_ARG_NOWRAP_CMDS_

&process_commands_wrap_deferred (<<_RAW_ARG_DEFERRED_CMDS_);
eqlabeltop # &do_cmd_eqlabeltop
eqlabelbot # &do_cmd_eqlabelbot
eqlabelcenter # &do_cmd_eqlabelcenter
equationcenter # &do_cmd_eqnationcenter
equationleft # &do_cmd_eqnationleft
numberleft # &do_cmd_numberleft
numberright # &do_cmd_numberright
_RAW_ARG_DEFERRED_CMDS_


1;                              # This must be the last line
