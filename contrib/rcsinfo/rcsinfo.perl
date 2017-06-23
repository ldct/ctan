
###############################################################################
# RCSINFO.PERL
# Copyright 1995, Dr. Juergen Vollmer <Juergen.Vollmer@informatik-vollmer.de>
#
# Extension to LaTeX2HTML to translate LaTeX commands of the
#               rcsinfo
# package to equivalent HTML commands.
#
# This is file `rcsinfo.perl',
# generated with the docstrip utility.
#
# The original source files were:
#
# rcsinfo.dtx  (with options: `perl')
#
# IMPORTANT NOTICE:
#
# For the copyright see the source file.
#
# Any modified versions of this file must be renamed
# with new filenames distinct from rcsinfo.perl.
#
# For distribution of the original source see the terms
# for copying and modification in the file rcsinfo.dtx.
#
# This generated file may be distributed as long as the
# original source files, as listed above, are part of the
# same distribution. (The sources need not necessarily be
# in the same archive or directory.)
#
# $Id: rcsinfo.dtx,v 1.7 2005/02/25 08:37:03 vollmer draft vollmer $
#
###############################################################################

package rcsinfo;

($Dummy1,$PackageVersionDate,$PackageVersionTime,$Dummy2) =
        split (/ /,'$Date: 2005/02/25 08:37:03 $');

print "\n\t rcsinfo style interface for LaTeX2HTML, $PackageVersionDate\n";

# set defaults options
$OptionFancy = 1;
$OptionToday = 1;
$OptionLong  = 1;

# set default values
$Date     = `date '+%Y/%m/%d'`;
$Time     = `date '+%H:%M:%S'`;
$File     = "--sourcefile--";
$Revision = "--revision--";
$Owner    = "--owner--";
$Status   = "--status--";
$Locker   = "--locker--";
$Year     = `date '+%Y'`;
$Month    = `date '+%m'`;
$Day      = `date '+%d'`;
$LongDate = $Date;

sub SetAddress
{
    $main::address_data[1] = "Revision: $rcsinfo::Revision, $rcsinfo::LongDate";
    # Supply your own string if you don't like the default <Name> <Date>
    $main::ADDRESS = "<I>$main::address_data[0] <BR>\n$main::address_data[1]</I>";
}
if ($SetAddressProc == "") {
  $SetAddressProc = \&rcsinfo::SetAddress;
}
sub make_cmds
{
  my $cmd;
  foreach $cmd (File,Revision,Date,Time,Owner,Status,Locker,Year,Month,Day,LongDate) {
        eval "sub main::do_cmd_rcsInfo$cmd { "
            . 'my $val = $rcsinfo::' . "$cmd; "
#           . 'printf STDERR "\ndo_cmd_rcsInfo%s=%s\n", ' . $cmd .', $val;'
            . "join('',\$val,\$_[0]);"
            . "}";
  }
}

@GermanMonthName  = ('','Januar','Februar','M&auml;rz','April','Mai','Juni','Juli',
                    'August','September','Oktober','November','Dezember');
@EnglishMonthName = ('','January','February','March','April','May','June','July',
                    'August','September','October','November','December');
@FrenchMonthName  = ('','Janvier','F&eacute;vrier','Mars','Avril','Mai','Juin',
                     'Juillet','Ao&ucirc;t','Septembre','Octobre','Novembre',
                     'D&eacute;cembre');

###############################################################################

package main;

# handling package options
sub do_rcsinfo_fancyhdr   { $rcsinfo::OptionFancy       = 1; }
sub do_rcsinfo_fancy      { $rcsinfo::OptionFancy       = 1; }
sub do_rcsinfo_nofancy    { $rcsinfo::OptionFancy       = 0; }
sub do_rcsinfo_today      { $rcsinfo::OptionToday       = 1; }
sub do_rcsinfo_notoday    { $rcsinfo::OptionToday       = 0; }
sub do_rcsinfo_short      { $rcsinfo::OptionLong        = 0; }
sub do_rcsinfo_long       { $rcsinfo::OptionLong        = 1; }
sub do_rcsinfo_datehyphen { }  # nothing just ignore it

# handling of LaTeX commands
sub do_cmd_rcsInfo
{

    local ($_) = @_;

    # printf STDERR "\ndo_cmd_rcsInfo\n";

    # see latex2html, procedure: substitute_meta_cmds, process_body_newcommand
    # the format of the variable $new_command{cmd} is:
    #   $new_command{$cmd} = join(':!:',$argn,$body,$opt);
    # note: opt = "}" means:  Flag for no optional arg
    # printf STDERR "xxxxxxxxxxx `%s'\n", $new_command{rcsInfoFILE};
    # printf STDERR "xxxxxxxxxxx `%s'\n", $new_command{rcsInfoREVISION};
    # printf STDERR "xxxxxxxxxxx `%s'\n", $new_command{rcsInfoYEAR};
    # printf STDERR "xxxxxxxxxxx `%s'\n", $new_command{rcsInfoMONTH};
    # printf STDERR "xxxxxxxxxxx `%s'\n", $new_command{rcsInfoDAY};
    # printf STDERR "xxxxxxxxxxx `%s'\n", $new_command{rcsInfoTIME};
    # printf STDERR "xxxxxxxxxxx `%s'\n", $new_command{rcsInfoOWNER};
    # printf STDERR "xxxxxxxxxxx `%s'\n", $new_command{rcsInfoSTATUS};
    # printf STDERR "xxxxxxxxxxx `%s'\n", $new_command{rcsInfoLOCKER};

    # the following assumes: LaTeX2HTML Version 99.1 release (March 30, 1999)
    # may be later
    my ($argn, $opt);
    if (exists $new_command{rcsInfoFILE}) {
        ($argn, $rcsinfo::File, $opt) = split(/:!:/, $new_command{rcsInfoFILE});
    } else {
         $rcsinfo::File = $File
    }
    if (exists $new_command{rcsInfoREVISION}) {
        ($argn, $rcsinfo::Revision, $opt) = split(/:!:/, $new_command{rcsInfoREVISION});
    } else {
         $rcsinfo::Revision = $Revision
    }
    if (exists $new_command{rcsInfoYEAR}) {
        ($argn, $rcsinfo::Year, $opt) = split(/:!:/, $new_command{rcsInfoYEAR});
    } else {
         $rcsinfo::Year = $Year
    }
    if (exists $new_command{rcsInfoMONTH}) {
        ($argn, $rcsinfo::Month, $opt) = split(/:!:/, $new_command{rcsInfoMONTH});
    } else {
         $rcsinfo::Month = $Month
    }
    if (exists $new_command{rcsInfoDAY}) {
        ($argn, $rcsinfo::Day, $opt) = split(/:!:/, $new_command{rcsInfoDAY});
    } else {
         $rcsinfo::Day = $Day
    }
    if (exists $new_command{rcsInfoTIME}) {
        ($argn, $rcsinfo::Time, $opt) = split(/:!:/, $new_command{rcsInfoTIME});
    } else {
         $rcsinfo::Time = $Time
    }
    if (exists $new_command{rcsInfoOWNER}) {
        ($argn, $rcsinfo::Owner, $opt) = split(/:!:/, $new_command{rcsInfoOWNER});
    } else {
         $rcsinfo::Owner = $Owner
    }
    if (exists $new_command{rcsInfoSTATUS}) {
        ($argn, $rcsinfo::Status, $opt) = split(/:!:/, $new_command{rcsInfoSTATUS});
    } else {
         $rcsinfo::Status = $Status
    }
    if (exists $new_command{rcsInfoLOCKER}) {
        ($argn, $rcsinfo::Locker, $opt) = split(/:!:/, $new_command{rcsInfoLOCKER});
    } else {
         $rcsinfo::Locker = $Locker
    }

    # printf STDERR "yyyyyyyyyyy `%s'\n",  $rcsinfo::File;
    # printf STDERR "yyyyyyyyyyy `%s'\n",  $rcsinfo::Revision;
    # printf STDERR "yyyyyyyyyyy `%s'\n",  $rcsinfo::Year;
    # printf STDERR "yyyyyyyyyyy `%s'\n",  $rcsinfo::Month;
    # printf STDERR "yyyyyyyyyyy `%s'\n",  $rcsinfo::Day;
    # printf STDERR "yyyyyyyyyyy `%s'\n",  $rcsinfo::Time;
    # printf STDERR "yyyyyyyyyyy `%s'\n",  $rcsinfo::Owner;
    # printf STDERR "yyyyyyyyyyy `%s'\n",  $rcsinfo::Status;
    # printf STDERR "yyyyyyyyyyy `%s'\n",  $rcsinfo::Locker;

    # the following code is for oldfashioned latex2hmtl, not anymore supported
    # format of $_:
    #                  vvvvvv that's text following the RCS-Id-string
    # <#nr#>.....<#nr>......
    #       ^ ^ ^  that's the RCS-Id-string
#    my ($Nr,$IdString,$Rest) = /(<#\d+#>)(.*)\1(.*)/s ;

    # The Id-String  may contain various tags, remove them
#    $IdString =~ s/<[^>]*>//g;

     # The Id-String  may contain various tags, remove them
#    $IdString =~ s/<[^>]*>//g;

    # split the Id-string
#    my ($id,$file,$revision,$date,$time,$owner,$status,$locker) = split(/\s/,$IdString);

    # remove trailing ,v
#    $file =~ s/,v$//;

    # split date
#    ($rcsinfo::Year,$rcsinfo::Month,$rcsinfo::Day) = split (/[\-]//,$date);

#    $rcsinfo::Revision = $revision;
#    $rcsinfo::File     = $file;
#    $rcsinfo::Date     = $date;
#    $rcsinfo::Time     = $time;
#    $rcsinfo::Owner    = $owner;
#    $rcsinfo::Status   = $status;
#    $rcsinfo::Locker   = $locker;

    if ($default_language eq 'german' || $default_language eq 'austrian') {
        $rcsinfo::LongDate = $rcsinfo::Day . '.&nbsp;' .
                 $rcsinfo::GermanMonthName[$rcsinfo::Month] . '&nbsp;' .
                 $rcsinfo::Year;
        $rcsInfo::Date = $rcsinfo::Day . '.&nbsp;' . $rcsinfo::Month . '.&nbsp;' . $rcsinfo::Year;
    } elsif ($default_language eq 'french') {
        $rcsinfo::LongDate = $rcsinfo::Day . '.&nbsp;' .
                 $rcsinfo::FrenchMonthName[$rcsinfo::Month] . '&nbsp;' .
                 $rcsinfo::Year;
        $rcsInfo::Date = $rcsinfo::Day . '.&nbsp;' .$rcsinfo::Month . '.&nbsp;' . $rcsinfo::Year;
    } else { # english is the default
        $rcsinfo::LongDate = $rcsinfo::EnglishMonthName[$rcsinfo::Month] . '&nbsp;' .
                 $rcsinfo::Day . ',&nbsp;' .
                 $rcsinfo::Year;
        $rcsInfo::Date = $rcsinfo::Year . '/' .$rcsinfo::Month . '/' . $rcsinfo::Day;
    }

    if ($rcsinfo::OptionFancy == 1) {
       &$rcsinfo::SetAddressProc;
    }
    rcsinfo::make_cmds();

    # printf STDERR "xxx $HTML_VERSION, $HTML_OPTIONS\n";
    # remove stuff generated for the $Id: rcsinfo.dtx,v 1.7 2005/02/25 08:37:03 vollmer draft vollmer $-string
    # we assume that noting follows the "\rcsInfo $Id....$"
    if ($HTML_VERSION >= 3.2) {
        /^<tex2html_verbatim_mark>[^\n]*/;
        return $';
    } elsif ($HTML_VERSION == 3.1 || $HTML_VERSION == 2.1) {
        /^<tex2html_image_mark>[^\n]*/;
        return $';
    } else {
        if ($HTML_OPTIONS =~ /math/) {
            /^<tex2html_verbatim_mark>[^\n]*/;
            return $';
        } else {
            /^<tex2html_image_mark>[^\n]*/;
            return $';
        }
    }
}

# Replace do_cmd_today (\today) using the RCS date.
sub do_cmd_today {
    local($today);
    if ($rcsinfo::OptionToday == 1) {
        $today = $rcsinfo::LongDate;
    } else {
        if ($default_language eq 'german' || $default_language eq 'austrian') {
            $today = (`date "+%m:%d, 20%y"`);
            $today =~ s/(\d{1,2}):0?(\d{1,2}),/$2. $rcsinfo::GermanMonthName[$1]/o;
            $today =~ s/20([7|8|9]\d{1})/19$1/o;
        } elsif ($default_language eq 'french') {
            $today = (`date "+%m:%d, 20%y"`);
            $today =~ s/(\d{1,2}):0?(\d{1,2}),/$2 $rcsinfo::FrenchMonthName[$1]/o;
            $today =~ s/20([7|8|9]\d{1})/19$1/o;
        } else { # english is the default
            $today = (`date "+%m:%d, 20%y"`);
            $today =~ s/(\d{1,2}):0?/$rcsinfo::EnglishMonthName[$1] /o;
            $today =~ s/20([7|8|9]\d{1})/19$1/o;
        }
    }
    join('',$today,$_[0]);
}

1;

###############################################################################
