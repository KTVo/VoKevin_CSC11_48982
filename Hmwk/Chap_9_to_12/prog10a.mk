# Makefile
all: prog10a
 
prog10a: prog10a.o
	   gcc -o $@ $+
 
prog10a.o: prog10a.s
	      as -o $@ $<

clean:
	rm -vf *.o
