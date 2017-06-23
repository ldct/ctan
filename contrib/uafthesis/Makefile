example.pdf:
	@echo "-> building example.pdf..."
	@cd example && ./build.sh > /dev/null
	@mv example/example.pdf ./

clean:
	@echo "-> cleaning..."
	@git clean -xdf > /dev/null
	@rm example.pdf

test: clean example.pdf
	@# Feel free to make this smarter.
	@echo "-> Opening example.pdf in evince. Does it look okay?"
	@`evince example.pdf &2> /dev/null`

publish: example.pdf clean
	@echo "-> creating tarball..."
	@tar -czf /tmp/uafthesis.tgz --exclude=.git ../uafthesis > /dev/null
	curl --form "contribution=uafthesis" \
	     --form "name=Joshua Holbrook" \
	     --form "email=josh.holbrook@gmail.com" \
	     --form "summary=Document class for theses at University of Alaska Fairbanks." \
	     --form "version=12.12" \
	     --form "directory=/macros/latex/contrib/uafthesis" \
	     --form "license=free" \
	     --form "freeversion=lppl" \
	     --form "file=@/tmp/uafthesis.tgz" \
	     http://www.tex.ac.uk/cgi-bin/ctan-upload.cgi
