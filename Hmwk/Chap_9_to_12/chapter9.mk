# Makefile
all: chapter9

chapter9: chapter9.o
              gcc -o $@ $+

chapter9.o: chapter9.s
              as -o $@ $<

clean:
        rm -vf *.o

