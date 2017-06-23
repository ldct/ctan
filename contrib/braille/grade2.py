"""
Converts ASCII text to Grade 2 Braille tags as described in 
    braille.sty, summary.tex
Grade 2 has 189 multi-character contractions and rules where they can
be used.  It uses grade1.py for final markup.

Usage:
>>> grade2.convert("I like computer")
"I {like} {com}put{er}"
>>> grade2.convert("April 1999")
"April {Number}1999"
>>> grade2.convert("I said ``hello'', and she said ``goodbye''.")
"I {said} {``}hello{''}, {and} {sh}e {said} {``}goodbye{''}."

Usage:
    python grade2.py < text > tags
"""
import string, re, grade1

part_of_word = [
    'and', 'for', 'of', 'the', 'with',

    'ch', 'sh', 'th', 'wh', 'ou', 'st',

    'ar', 'er', 'ed', 'gh', 'ow',

    'en', 'in',
]
beginning_of_word = [
    'be', 'com', 'con', 'dis',
]
middle_of_word = [
    'bb', 'ble', 'cc', 'dd', 'ea', 'ff', 'gg', 'ing',
]
end_of_word = [
    'ble', 'ing',
]
final_letter_contraction = [		# middle or end of word
    'ound', 'ance', 'sion', 'less', 'ount',

    'ence', 'ong', 'ful', 'tion', 'ness', 'ment', 'ity',

    'ation', 'ally',
]
initial_letter_contraction = [		# whole or part of word
    'these', 'those', 'upon', 'whose', 'word', 

    'cannot', 'had', 'many', 'spirit', 'their', 'world',

    'character', 'day', 'ever', 'father', 'here', 'know', 'lord',
    'mother', 'name', 'one', 'ought', 'part', 'question', 'right',
    'some', 'there', 'through', 'time', 'under', 'where', 'work',
    'young',
]
whole_word = [
    'and', 'for', 'of', 'the', 'with',

    'child', 'shall', 'this', 'which', 'out', 'still',

    'but', 'can', 'do', 'every', 'from', 'go', 'have', 'just',
    'knowledge', 'like', 'more', 'not', 'people', 'quite', 'rather',
    'so', 'that', 'us', 'very', 'will', 'it', 'you', 'as',

    'be', 'by', 'enough', 'his', 'in', 'into', 'to', 'was', 'were',

    'about', 'above', 'according', 'across', 'after', 'afternoon',
    'afterward', 'again', 'against', 'almost', 'already', 'also',
    'although', 'altogether', 'always', 'because', 'before', 'behind',
    'below', 'beneath', 'beside', 'between', 'beyond', 'blind',
    'braille', 'children', 'conceive', 'conceiving', 'could',
    'deceive', 'deceiving', 'declare', 'declaring', 'either', 'first',
    'friend', 'good', 'great', 'herself', 'him', 'himself',
    'immediate', 'its', 'itself', 'letter', 'little', 'much', 'must',
    'myself', 'necessary', 'neither', "o'clock", 'oneself',
    'ourselves', 'paid', 'perceive', 'perceiving', 'perhaps', 'quick',
    'receive', 'receiving', 'rejoice', 'rejoicing', 'said', 'should',
    'such', 'themselves', 'thyself', 'today', 'together', 'tomorrow',
    'tonight', 'would', 'your', 'yourself', 'yourselves',
]


def begintag(tag, word):
    return re.sub('^%s(.)' % tag, r'{%s}\1' % tag, word)

def middletag(tag, word):
    return re.sub('(.)%s(.)' % tag, r'\1{%s}\2' % tag, word)

def endtag(tag, word):
    return re.sub('(.)%s$' % tag, r'\1{%s}' % tag, word)

def parttag(tag, word):
    return string.replace(word, tag, '{' + tag + '}')


# Check if word or part of word can be replaced by Grade 2
# contractions.  Returns string with Braille tags.
#
def replace(word):
    if word in whole_word + initial_letter_contraction:		# whole word
	return '{' + word + '}'
	
    for tag in initial_letter_contraction:	# whole or part of word
	word = parttag(tag, word)
    for tag in final_letter_contraction:	# middle or end of word
	word = middletag(tag, word)
	word = endtag(tag, word)
    for tag in beginning_of_word: 	word = begintag(tag, word)
    for tag in end_of_word:		word = endtag(tag, word)
    for tag in middle_of_word: 		word = middletag(tag, word)
    for tag in part_of_word:		word = parttag(tag, word)

    s, braces = '', 0
    for i in word:		# remove nested braces
	if i == '{':
	    braces = braces + 1
	    if braces == 1:  s = s + i
	elif i == '}':
	    braces = braces - 1
	    if braces == 0:  s = s + i
	else:
	    s = s + i
    return s


# Check if word, containing [a-zA-Z] only, is all UPPER case.
#
def alluppercase(word):		# ^[A-Z]+$
    if len(word) == 0:  return 0
    for i in word:
	if i not in string.uppercase:  return 0
    return 1


# Check if word, containing [a-zA-Z] only, is all lower case.
#
def alllowercase(word):		# ^[a-z]+$
    if len(word) == 0:  return 0
    for i in word:
	if i not in string.lowercase:  return 0
    return 1


# Check if word, containing [a-zA-Z] only, is Capitalized.
#
def capitalized(word):		# ^[A-Z][a-z]*$
    if len(word) == 0:
	return 0
    elif len(word) == 1:
	return alluppercase(word[0])
    else:
	return alluppercase(word[0]) and alllowercase(word[1:])


def convert(line):
    s = ''
    for word in re.split('([a-zA-Z]+)', line):
	if len(word) <= 1 or word[0] not in string.letters:
	    s = s + word	# no work if not 2 or more letters
	elif alluppercase(word):
    	    s = s + '{Upper}' + replace(string.lower(word))
	elif capitalized(word):
	    w = replace(string.lower(word))
	    if w[0] in string.lowercase:
		s = s + word[0] + w[1:]	# preserve Capital letter
	    else:
		s = s + '{Capital}' + w
	else:
	    s = s + replace(word)
    
    # manually handle whole word {o'clock}
    s = re.sub(r"\bo'clock\b", "{o'clock}", s)

    # whole words {in}, {be}, {enough}, {his}, {was}, {were}
    # cannot touch punctuations
    s = nopunctuations('{in}', 'in', s)
    s = nopunctuations('{be}', 'be', s)
    s = nopunctuations('{enough}', '{en}{ou}{gh}', s)
    s = nopunctuations('{his}', 'his', s)
    s = nopunctuations('{was}', 'was', s)
    s = nopunctuations('{were}', 'w{er}e', s)

    # no space after whole words {by}, {into}, {to}
    s = re.sub(r'{(by|into|to)}\s+', r'{\1}', s)

    return grade1.convert(s)


# Change whole word '{tag}' to 'tag' when touching punctuations
#
def nopunctuations(tag, newtag, s):
    s = re.sub(r'(\s|\A)%s([^\s\w{}])' % tag, r'\1%s\2' % newtag, s)
    s = re.sub(r'([^\s\w{}])%s(\s|\Z)' % tag, r'\1%s\2' % newtag, s)
    s = re.sub(r'([^\s\w{}])%s([^\s\w{}])' % tag, r'\1%s\2' % newtag, s)
    return s


if __name__ == '__main__':
    import sys
    line = sys.stdin.read()	# swallow the whole thing 
    print convert(line)		# may produce extra \n
