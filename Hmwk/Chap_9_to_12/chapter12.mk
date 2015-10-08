# Makefile
all: chapter12

chapter12: chapter12.o
              gcc -o $@ $+

chapter12.o: chapter12.s
              as -o $@ $<

clean:
        rm -vf *.o


