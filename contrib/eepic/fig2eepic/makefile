#	Fig2epic : FIG to EPIC translator
#
#	Conrad Kwok
#	Modified from fig2pic which was modified from f2ps
#

SRCDIR = ../src
SRCLIB = $(SRCDIR)/lib.a

LIBS =	-lm
#
#  Use of gcc is recommended whenever available. 
#	-Inlcude DNoVPRINTF in CFLAGS if vprintf is not included in the library
#	Include	-DNoConfigFile and remove config.* if no configuration
#		file is desired.
#
CFLAGS = -O $(CROSS)
CC =	gcc $(CFLAGS) -I$(SRCDIR) 

fig2epic : fig2epic.o config.o $(SRCLIB)
	$(CC) fig2epic.o config.o $(SRCLIB) -lm -o fig2epic

#    Include:
#	-DINT32BIT when int is 32 bits long
#	-DOldFashion when compiled using cc on Ultrix and BSD 4.x
config.o : config.c
	$(CC) -DINT32BIT -c config.c

$(SRCLIB):
	(cd ../src; make)

#########
clean : 
	rm -f *.o fig2epic core

