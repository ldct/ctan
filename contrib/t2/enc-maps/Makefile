ENCODINGS = T2A T2B T2C X2
ENC2UNI = $(ENCODINGS:=uni.map)

all:
	./mkencs.sh

show_glyphs_absent_in_unicode: $(ENC2UNI)
	@grep ';;' $^ | sed 's,^[^;]*;;,,' | sort -u

clean:
	rm -f encfiles/*.enc
