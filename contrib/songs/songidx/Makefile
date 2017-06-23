srcdir = .
CC = cc
CFLAGS = -I$(srcdir)
LDFLAGS =

all: songidx

.SUFFIXES:
.SUFFIXES: .c .o

songidx: *.h $(patsubst %.c,%.o,$(wildcard *.c))
	$(CC) $(CFLAGS) $(LDFLAGS) $(filter %.o,$^) -o $@

clean:
	-rm $(DESTDIR)*.o $(DESTDIR)songidx

