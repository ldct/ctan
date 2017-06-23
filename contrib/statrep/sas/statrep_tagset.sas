proc template;
   define style styles.StatRep;
      parent = styles.statistical;
      class colors /
         'link2' = cx0000FF
         'link1' = cx800080
         'docbg' = cxFFFFFF
         'contentbg' = cxFFFFFF
         'systitlebg' = cxFFFFFF
         'titlebg' = cxFFFFFF
         'proctitlebg' = cxFFFFFF
         'headerbg' = cxFFFFFF
         'captionbg' = cxFFFFFF
         'captionfg' = cx000000
         'bylinebg' = cxFFFFFF
         'notebg' = cxFFFFFF
         'tablebg' = cxFFFFFF
         'batchbg' = cxFFFFFF
         'systitlefg' = cx000000
         'titlefg' = cx000000
         'proctitlefg' = cx000000
         'bylinefg' = cx000000
         'notefg' = cx000000;
      class Header /
         color = cx000000
         backgroundcolor = cxFFFFFF
         bordercolor = cxB0B7BB
         bordercollapse = collapse;
      class RowHeader /
         color = cx000000
         backgroundcolor = cxFFFFFF
         bordercolor = cxB0B7BB
         bordercollapse = collapse;
      class Footer /
         color = cx000000
         backgroundcolor = cxFFFFFF
         bordercolor = cxB0B7BB
         bordercollapse = collapse;
      class RowFooter /
         color = cx000000
         backgroundcolor = cxFFFFFF
         bordercolor = cxB0B7BB
         bordercollapse = collapse;
      class batch /
         borderwidth = 0px;
      class Data /
         font = fonts('DocFont')
         backgroundcolor = _undef_
         bordercolor = cx919191
         bordercollapse = collapse;
      class DataEmphasis /
         font = fonts('DocFont')
         backgroundcolor = _undef_
         bordercolor = cx919191
         bordercollapse = collapse;
   end;
run;

proc template;
define tagset Tagsets.StatRep;
   notes "This is the StatRep LaTeX definition";

   define event initialize;
      trigger set_options;
   end;

   define event set_options;
      set $options["junk" ] "junk" /if ^$options;
      unset $cell_align;

      do /if cmp( $options["CELL_ALIGN"], "yes");
         set $cell_align "True";
      done;

   end;

   define event title_format_section;
      put value;
   end;

   define event cell_is_empty;
      put " ";
   end;

   define event list;
      start:
         put "\begin{itemize}" NL;

      finish:
         put "\end{itemize}" NL;
   end;

   define event list_item;
      put "\item ";
   end;

   define event list_entry;
      put "\item ";
   end;

   define event image;
      put "\sasgraph{";
      put BASENAME /if ^exists( NOBASE);
      put URL;
      put "}" NL;
   end;

   define event line;
      put "\rule{\linewidth}{" colwidth;
      put "pt}" NL;
   end;

   define event text;
      start:
         put "\par " NL;
   end;

   define event paragraph;
      start:
         put VALUE;
      put NL;
      put NL;
   end;

   define event preformat;
      start:
         put "\verb?" NL;

      finish:
         put "?" NL;
   end;

   define event center;
      start:
         put "\begin{center}" NL;

      finish:
         put "\end{center}" NL;
   end;

   define event styles;
      start:
         put NL;
         put "\RequirePackage[T1]{fontenc}" NL;
         put "\RequirePackage{times}" NL;
         put "\RequirePackage{fancyvrb}" NL;
         put "\RequirePackage{array}" NL;
         put "\RequirePackage{graphicx}" NL;
         put NL;
         put "\newbox\sas@fig" NL;
         put "\newlength\sas@figwidth" NL;
         put NL;
         put "\newif\ifsas@color" NL;
         put "\sas@colorfalse" NL;
         put NL;
         put "\DeclareOption{color}{\sas@colortrue}" NL;
         put "\ProcessOptions" NL;
         put NL;

      finish:
         put %nrstr("%% Set cell padding") NL;
         put "\renewcommand{\arraystretch}{1.3}" NL NL;
         put %nrstr("%% Headings") NL;
         put %nrstr("\newcommand{\sasheading}[3][c]{{%%") NL;
         put %nrstr("   \if#1r\flushright\else\if#1l\flushleft\else\centering\fi\fi%%") NL;
         put %nrstr("   {\csname sasS#2\endcsname #3}\mbox{}\\[0.1\baselineskip]%%") NL;
         put %nrstr("   \if#1r\endflushright\else\if#1l\endflushleft\else\fi\fi%%") NL;
         put "}}" NL;
         put NL;
         put "\newcommand{\sasbyline}[2][c]{\sasheading[#1]{byline}{#2}}" NL;
         put "\newcommand{\sassystemtitle}[2][c]{\sasheading[#1]{systemtitle}{#2}}" NL;
         put "\newcommand{\sassystemfooter}[2][c]{\sasheading[#1]{systemfooter}{#2}}" NL;
         put "\newcommand{\sasproctitle}[2][c]{\sasheading[#1]{proctitle}{#2}}" NL;
         put "\newcommand{\sascaption}[2][l]{\marginpar[#1]{\fbox{\parbox{0.7in}{\sasScaption{#2}}}}}" NL;
         put NL;
         put %nrstr("%% Declare new verbatim type") NL;
         put %nrstr("\DefineVerbatimEnvironment{sasverbatim}{BVerbatim}%%") NL;
         put "                          {fontsize=\footnotesize," NL;
         put "                           commandchars=\\\{\}," NL;
         put "                           formatcom=\sasSbatch}" NL;
         put NL;
         put %nrstr("%% Declare new column types") NL;
         put "\newcolumntype{S}[2]{>{\csname sasS#1\endcsname}#2}" NL;
         put "\newcolumntype{d}{r}" NL;
         put NL;
         put %nrstr("%% Set warning box style") NL;
         put "\newlength\notewidth" NL;
         put "\setlength\notewidth{4in}" NL;
         put "\newcommand*{\saswarn}[2][c]{\sasmsg{warn}{#1}{#2}}" NL;
         put "\newcommand*{\saserror}[2][c]{\sasmsg{error}{#1}{#2}}" NL;
         put "\newcommand*{\sasnote}[2][c]{\sasmsg{note}{#1}{#2}}" NL;
         put "\newcommand*{\sasfatal}[2][c]{\sasmsg{fatal}{#1}{#2}}" NL;
         put %nrstr("\newcommand*{\sasmsg}[3]{%%") NL;
         put %nrstr("   \ifsas@color\let\columncolor\undefined\fi%%") NL;
         put %nrstr("   \begin{center}%%") NL;
         put %nrstr("   \begin{tabular}{ll}\hline%%") NL;
         put %nrstr("   \multicolumn{1}{|S{#1banner}{p{0.7in}}|}{#1} & %%") NL;
         put %nrstr("   \multicolumn{1}{|S{#1content}{p{\notewidth}}|}{#3{\newline}}\\\hline%%") NL;
         put %nrstr("   \end{tabular}%%") NL;
         put %nrstr("   \end{center}%%") NL;
         put %nrstr("   \ifsas@color\let\columncolor\sascolumncolor\fi%%") NL;
         put "}" NL;
         put NL;
         put "\ifsas@color\RequirePackage{colortbl}\fi" NL;
         put NL;
         put %nrstr("%% Hack colortbl to allow \columncolor in macros") NL;
         put "\let\CT@extract@org\CT@extract" NL;
         put "\def\CT@extract{\futurelet\CT@NEXT\CT@extract@next}" NL;
         put %nrstr("\def\CT@extract@next{%%") NL;
         put "  \ifx\CT@NEXT\csname" NL;
         put %nrstr("    \@ReturnAfterFi{%%") NL;
         put "      \expandafter\expandafter\expandafter" NL;
         put %nrstr("    }%%") NL;
         put "  \fi" NL;
         put "  \CT@extract@org" NL;
         put "}" NL;
         put "\long\def\@ReturnAfterFi#1\fi{\fi#1}" NL;
         put "" NL;
         put "\ifsas@color" NL;
         put "" NL;
         put "   \newcommand{\foreground}[1]{\color[rgb]{#1}}" NL;
         put "   \newcommand{\sascolumncolor}[2][]{}" NL;
         put "   \let\columncolor\sascolumncolor" NL;
         put "   \newcommand{\documentforeground}[1]{\AtBeginDocument{\color[rgb]{#1}}}" NL;
         put "   \newcommand{\documentbackground}[1]{\AtBeginDocument{\pagecolor[rgb]{#1}}}" NL;
         put "   \def\sastable{\let\columncolor\undefined\tabular}" NL;
         put "   \def\endsastable{\endtabular\let\columncolor\sascolumncolor}" NL;
         put "   \def\stackedcell{\bgroup\renewcommand{\arraystretch}{1}\tabular}" NL;
         put "   \def\endstackedcell{\endtabular\egroup}" NL;
         put NL;
         put "\else" NL;
         put NL;
         put "   \providecommand{\foreground}[1]{}" NL;
         put "   \providecommand{\color}[2][]{}" NL;
         put "   \newcommand{\sascolumncolor}[2][]{}" NL;
         put "   \let\columncolor\sascolumncolor" NL;
         put "   \newcommand{\documentforeground}[1]{}" NL;
         put "   \newcommand{\documentbackground}[1]{}" NL;
         put "   \def\sastable{\tabular}" NL;
         put "   \def\endsastable{\endtabular}" NL;
         put "   \def\stackedcell{\bgroup\renewcommand{\arraystretch}{1}\tabular}" NL;
         put "   \def\endstackedcell{\endtabular\egroup}" NL;
         put "" NL;
         put "\fi" NL;
         put NL;
         put %nrstr("%%\let\sasgraph\includegraphics") NL;
         put %nrstr("%% Scale graphics so they always fit on the page") NL;
         put %nrstr("\newcommand\sasgraph[2][]{%%") NL;
         put %nrstr("   \savebox{\sas@fig}{\includegraphics[#1]{#2}}%%") NL;
         put %nrstr("   \settowidth{\sas@figwidth}{\usebox{\sas@fig}}%%") NL;
         put %nrstr("   \ifthenelse{\lengthtest{\sas@figwidth > \textwidth}}{%%") NL;
         put %nrstr("      \resizebox{0.95\textwidth}{!}{\usebox{\sas@fig}}}{%%") NL;
         put "      \usebox{\sas@fig}}" NL;
         put "}" NL;
         put NL;
   end;

   define event style_class;
      start:
         put "\def\sasS" lowcase(HTMLCLASS) %nrstr("{%%") NL;
         put "   " FONT_SIZE %nrstr("%%") NL /if exists( FONT_SIZE);
         put "   " FONT_WEIGHT %nrstr("%%") NL /if exists( FONT_WEIGHT);
         put "   " FONT_STYLE %nrstr("%%") NL /if exists( FONT_STYLE);
         put "   " FONT_FACE %nrstr("%%") NL /if exists( FONT_FACE);
         put "   \color[rgb]{" FOREGROUND %nrstr("}%%") NL /if exists( foreground);
         put "   \columncolor[rgb]{" BACKGROUND %nrstr("}%%") NL /if exists( background);
         set $foreground foreground /if cmp( htmlclass, "body");
         set $background background /if cmp( htmlclass, "body");

      finish:
         put "}" NL;
   end;

   define event caption;
      start:
         set $sascaption "true";
         block table;
         block row;
         block colspecs;
         block colspec_entry;
         put "\sascaption[";
         put "l" /if cmp( TYPE, "L");
         put "r" /if cmp( TYPE, "R");
         put "b" /if cmp( TYPE, "B");
         put "t" /if cmp( TYPE, "T");
         put "]{";

      finish:
         put "}" NL;
         unblock table;
         unblock row;
         unblock colspecs;
         unblock colspec_entry;
         set $sascaption "false";
   end;

   define event table;
      start:
         put NL;
         put NL;
         put "\begin{sastable}";

         trigger alignment;

      finish:
         put "\end{sastable}" NL;
         put NL;
   end;

   define event verbatim_text;
      put VALUE;
      put NL;
   end;

   define event verbatim_container;
      start:
         put NL;
         put NL;
         put "\begin{center}" NL /if cmp( just, "c");
         put "\begin{sasverbatim}" NL;

      finish:
         put "\end{sasverbatim}" NL;
         put "\end{center}" NL /if cmp( just, "c");
         put NL;
   end;

   define event alignment;
      start:
         put "[c]" /if cmp( just, "c");
      put "[c]" /if cmp( just, "d");
      put "[r]" /if cmp( just, "r");
      put "[l]" /if cmp( just, "l");
      flush;
   end;

   define event colspecs;
      start:
         put "{";

      finish:
         put "}\hline" NL;
   end;

   define event colspec_entry;
      put just /if ^cmp( just, "d");
      put "r" /if cmp( just, "d");
   end;

   define event row;

      finish:
         put NL "\\\hline" NL;
   end;

   define event rowspanfillsep;
      put %nrstr(" & ") NL;
   end;

   define event rowspancolspanfill;
      put "   ";
      put "\multicolumn{";
      put colspan;
      put "1" /if ^exists( colspan);
      put "}";
      put "{|S{";
      put lowcase(HTMLCLASS);
      put "data" /if ^htmlclass;
      put "}{";
      put just;
      put "}|}{~}";
   end;

   define event header;
      start:

         trigger data;

      finish:

         trigger data;
   end;

   define event data;
      start:
         put VALUE /if cmp( $sascaption, "true");
         break /if cmp( $sascaption, "true");
         put %nrstr(" & ") NL /if ^cmp( COLSTART, "1");
         put "   ";
         put "\multicolumn{";
         put colspan;
         put "1" /if ^colspan;
         put "}";
         put "{";
         put "|" /if ^$instacked;
         put "S{";
         put lowcase(HTMLCLASS);
         put "}{";
         put just;
         put "}";
         put "|" /if ^$instacked;
         put "}";
         put "{";
         put tranwrd(VALUE,"-","$-$") /if contains( lowcase(HTMLCLASS), "data");
         put VALUE /if ^contains( lowcase(HTMLCLASS), "data");

      finish:
         break /if cmp( $sascaption, "true");
         put "}";
   end;

   define event data_note;
      start:

         trigger data;

      finish:

         trigger data;
   end;

   define event stacked_cell;
      start:
         put NL;
         put "\begin{stackedcell}";

         trigger alignment;

      finish:
         put "\end{stackedcell}" NL;
   end;

   define event stacked_value;
      start:
         unset $instacked;
         set $instacked "true";

         trigger data;

      finish:

         trigger data;
         unset $instacked;
   end;

   define event stacked_value_header;
      start:

         trigger stacked_value;

      finish:

         trigger stacked_value;
   end;

   define event stacked_cell_colspecs;
      start:
         put "{";

      finish:
         put "}" NL;
   end;

   define event stacked_cell_colspec_entry;
      put just /if ^cmp( just, "d");
      put "r" /if cmp( just, "d");
   end;

   define event stacked_cell_row;

      finish:
         put NL "\\" NL;
   end;

   define event put_value;
      put VALUE;
   end;

   define event put_value_cr;
      put VALUE NL;
   end;

   define event byline;
      put NL;
      put "\sasbyline";

      trigger alignment;
      put "{";
      put VALUE;
      put "}" NL;
   end;

   define event proc_title;
      put "\sasproctitle";

      trigger alignment;
      put "{";
      put VALUE;
      put "}" NL;
   end;

   define event note;
      put "\sasnote";

      trigger alignment;
      put "{";
      put VALUE;
      put "}" NL;
   end;

   define event Error;
      put "\saserror";

      trigger alignment;
      put "{";
      put VALUE;
      put "}" NL;
   end;

   define event Warn;
      put "\saswarn";

      trigger alignment;
      put "{";
      put VALUE;
      put "}" NL;
   end;

   define event Fatal;
      put "\sasfatal";

      trigger alignment;
      put "{";
      put VALUE;
      put "}" NL;
   end;

   define event system_title;
      put "\sassystemtitle";

      trigger alignment;
      put "{";
      put VALUE;
      put "}" NL;
   end;

   define event system_footer;
      put "\sassystemfooter";

      trigger alignment;
      put "{";
      put VALUE;
      put "}" NL;
   end;

   image_formats = "png,pdf";
   split = " {\newline} ";
   nobreakspace = "~";
   mapsub = %nrstr("/\%%/\$/\&/\{/\}/\~/\^/\#/{\textunderscore}/{\textbackslash}/");
   map = %nrstr("%%$&{}~^#_\");
   output_type = "latex";
   stacked_columns = OFF;
   embedded_stylesheet;
   private;
end;
run;
