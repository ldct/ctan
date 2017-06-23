\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{CollegeNotice}[2012/04/19 CollegeNotice]
% Declare some variables to hold text fields
\newcommand{\collegename}[1]{\gdef\NoticeField@collegename{#1}}
\newcommand{\deptname}[1]{\gdef\NoticeField@deptname{#1}}
\newcommand{\issuedate}[1]{\gdef\NoticeField@issuedate{#1}}
\newcommand{\subject}[1]{\gdef\NoticeField@subject{#1}}
\newcommand{\name}[1]{\gdef\NoticeField@name{#1}}
\newcommand{\designation}[1]{\gdef\NoticeField@designation{#1}}
\newcommand{\content}[1]{\gdef\NoticeField@content{#1}}

% Initialize variables to their default values
\collegename{Finolex Academy of Management and Technology}
\deptname{Department of Information Technology}
\issuedate{\today}
\subject{}
\name{S. V. Jadhav}
\designation{Head of Department}
\content{}

% Define layout for Notice
\newcommand{\makenotice}{
	\thispagestyle{empty}
	\centering
	\Large{\NoticeField@collegename} \linebreak
	\large{\NoticeField@deptname} \\[\baselineskip] \normalsize
	\flushright{\NoticeField@issuedate} \\[\baselineskip] 
	\centering
	\textbf{\Large{NOTICE}} \\[\baselineskip] \normalsize
	\NoticeField@subject \\[\baselineskip]
	\flushleft{\NoticeField@content} \\[\baselineskip]
	\vspace{0.5cm}
	\flushright{\NoticeField@name} \linebreak
	\NoticeField@designation \\[\baselineskip]

}
\LoadClass[a4paper,12pt]{article}

\usepackage{xifthen}
% College name is other than Finolex Academy of Management and Technology
\newcommand{\College}[1]{\ifthenelse{\isempty{#1}}{}{\collegename{#1}}}
% Department name is other than Information Technology
\newcommand{\Department}[1]{\ifthenelse{\isempty{#1}}{}{\deptname{#1}}}
% Name is other than S.V.Jadhav
\newcommand{\Name}[1]{\ifthenelse{\isempty{#1}}{}{\name{#1}}}
% Designation is other than Head of Department
\newcommand{\Designation}[1]{\ifthenelse{\isempty{#1}}{}{\designation{#1}}}
% Issued Date is other than Today's date
\newcommand{\Issuedate}[1]{\ifthenelse{\isempty{#1}}{}{\issuedate{#1}}}