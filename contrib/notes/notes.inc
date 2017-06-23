# define the environment lyxcode
Preamble
\usepackage{notes}
EndPreamble

Style Note
  Margin		Dynamic
  LatexType		Environment
  LatexName	 	note
  NextNoIndent		0
  LeftMargin    MMM
  RightMargin   MMM
  ParIndent		MM
  LabelSep		:x
  ItemSep		0
  TopSep		0.5
  BottomSep		0.5
  ParSep		0
  Align			Block
  AlignPossible		Block, Left, Right, Center
  LabelType		Static
  LabelString		"Note:"

  LabelFont
#	Shape		SmallCaps
	Shape		Italic
	Series		Bold
	Color		black
  EndFont

  TextFont
	Color		Blue
	Shape		Italic
  EndFont

End

Style Information_Note
  CopyStyle		Note
  LatexName	 	informationnote
  LabelString		"Information: "
End

Style Important_Note
  CopyStyle		Note
  LatexName	 	importantnote
  LabelString		"Important: "
End

Style Warning_Note
  CopyStyle		Note
  LatexName	 	warningnote
  LabelString		"Warning: "
End
