# Makefile
all: chapter11

chapter11: chapter11.o
              gcc -o $@ $+

chapter11.o: chapter11.s
              as -o $@ $<

clean:
        rm -vf *.o

