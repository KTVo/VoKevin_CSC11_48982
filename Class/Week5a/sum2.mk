# Makefile
all: sum2
 
sum2: sum2.o
	gcc -o $@ $+
 
sum2.o : sum2.s
	as -o $@ $<

clean:
	rm -vf *.o
