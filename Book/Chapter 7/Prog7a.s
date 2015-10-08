@Prog7a - Using Syscall 4 to write a string to the screen

	.global _start
_start:
	MOV R7, #4	 @Using Syscall 4 to WRITE STRINGS 
	MOV R0, #1	 @Sets the stand output to monitor
	MOV R2, #19	 @The amount of characters for the string to be displayed
	LDR R1, =string  @Loads the string to R1 (R1 is now the address of the string)
	SWI 0		 @SoftWare Intterupt (can be SVR "Supervisor")

_exit:
	MOV R7, #1       @Syscall 1 - getting ready to exit program
	SWI 0		 @SOFTWARE INTERRUPTS back to Raspbian

//The string that will be printed out
.data
string:
.ascii "Hello World String\n"     @"American Stand Code for Information Exchange"
