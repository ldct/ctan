"""
Converts ASCII text to Grade 1 Braille as described in
    braille.sty, summary.tex
Essentially, it marks up 
    {Letter}, {Number}, 
    {``}...{''} for double quotation which must be typed as ``...'',
    {.`}...{'.} for single quotation which must be typed as .`...'., 
    {percent}
so that the text is acceptable as input to \braille{}.  The output is
striped and returned all in one line.

Usage:
>>> grade1.convert("I like computer")
"I like computer"
>>> grade1.convert("April 1999")
"April {Number}1999"
>>> grade1.convert("I said ``hello'', and she said ``goodbye''.")
"I said {``}hello{''}, and she said {``}goodbye{''}."

Usage:
    python grade1.py < text > tags
"""
import string

Number = '0123456789'

def convert(line):
    line = string.replace(line, "``", "{``}")	# ``...''
    line = string.replace(line, "''", "{''}")
    line = string.replace(line, ".`", "{.`}")	# .`...'.
    line = string.replace(line, "'.", "{'.}")
    line = string.replace(line, '%', '{percent}')	# %
    s, oldi, oldii, skipchars = '', ' ', ' ', 0
    for i in line:
	if i == '{':
	    skipchars = 1
	elif i == '}':
	    skipchars = 0
	elif skipchars:		# skip anything inside {...}
	    pass
	elif oldi in Number and i in 'abcdefghij':
	    s = s + '{Letter}'
	elif i in Number:
	    if (oldii in Number and oldi in '.-') or (oldi in Number):
		pass
	    else:
		s = s + '{Number}'
	s, oldi, oldii = s + i, i, oldi
    return string.join(string.split(s))		# return all in one line


if __name__ == '__main__':
    import sys
    line = sys.stdin.read()	# swallow the whole thing 
    print convert(line)		# may produce extra \n
