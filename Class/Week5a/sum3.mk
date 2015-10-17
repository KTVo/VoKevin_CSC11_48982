# Makefile
all: sum3
 
sum3: sum3.o
	gcc -o $@ $+
 
sum3.o : sum3.s
	as -o $@ $<

clean:
	rm -vf *.o
