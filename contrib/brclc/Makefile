# Linux Makefile for brclc

SHELL=bash

OUT= brclc
CC= gcc
LIBS= -lm
OPTIONS= -v -O2 -finline-functions -ffast-math +e0  -m486 -Wall

$(OUT): $(OUT).o
	$(CC) $(OUT).o -o $(OUT)  $(LIBS)

$(OUT).o: $(OUT).c
	$(CC) $(OPTIONS) -c $(OUT).c -o $(OUT).o


clean:
	rm $(OUT).o
	rm $(OUT)



