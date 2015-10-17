# Makefile
all: sum1
 
sum1: sum1.o
	gcc -o $@ $+
 
sum1.o : sum1.s
	as -o $@ $<

clean:
	rm -vf *.o
