#!/usr/bin/ruby

#
# This script generates a data file using data from freedb.org.
#
# Typical usage:
#
#  wget -O- http://www.freedb.org/freedb/jazz/380a0a05 | ./parsecd.rb
#

track = []

class String
	def tex
		return sub(/&/, "\\\\&").sub(/%/, "\\\\%").sub(/#/, "\\\\#")
	end
end

$stdin.each_line do |line|
	name, content = line.split("=")
	name.strip! if name
	content.strip! if content

	if name == "DTITLE" then
		author, title = content.split("/")
		author = "" if ! author
		title = "" if ! title
		author.strip!
		title.strip!
		author_cap = []
		author.each(" ") { |word| author_cap << word.strip.capitalize.tex }
		print "\\covertext{\n", author_cap.join(" "), "\\\\\n", "\\bfseries ", title.strip.tex, "\n}\n\n"

		print "\\leftspine{", author.upcase.tex, "}\n\n"
		print "\\centerspine{", title.upcase.tex, "}\n\n"

	end
	
	if name.strip =~ /TTITLE.*/ then
		track << content
	end
end

print "\\lefttracklist{\n"

if track.size < 16 then track.each { |x| print "\\track ", x.tex, "\n" }
else
	track[0,(track.size/2)+1].each { |x| print "\\track ", x.tex, "\n" }
	print "}\n\n\\righttracklist{\n"
	track[(track.size/2)+1,track.size].each { |x| print "\\track ", x.tex, "\n" }
end


print "}\n"
