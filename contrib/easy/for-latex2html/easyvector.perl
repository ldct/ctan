############################################################################
#                                                                          #
#  Extension to LaTeX2HTML to load further features from                   #
#  the EASYVECTOR package.                                                 #
#                                                                          #
#  date         : 1999, Sept. 12                                           #
#  release      : 1.0 (beta)                                               #
#  file         : easyvector.perl                                          #
#  author       : Enrico Bertolazzi                                        #
#  email        : enrico.bertolazzi@ing.unitn.it,                          #
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

sub do_easyvector_boldcm {}
sub do_easyvector_boldcc {}
sub do_easyvector_definevectors {}

&ignore_commands( <<_IGNORED_CMDS_);
newvector # [] # {}
newvectora # {} # {}
newcustomvector # [] # {} # {}
_IGNORED_CMDS_

&process_commands_in_tex (<<_RAW_ARG_CMDS_);
_RAW_ARG_CMDS_

&process_commands_inline_in_tex (<<_RAW_ARG_CMDS_);
_RAW_ARG_CMDS_

&process_commands_nowrap_in_tex (<<_RAW_ARG_NOWRAP_CMDS_);
_RAW_ARG_NOWRAP_CMDS_

&process_commands_wrap_deferred (<<_RAW_ARG_DEFERRED_CMDS_);
_RAW_ARG_DEFERRED_CMDS_

1;                              # This must be the last line
