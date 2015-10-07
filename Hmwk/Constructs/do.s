/* Kevin Vo
   Oct. 5, 2015
   CSC-11 (48982)
   Assignment: Constructs
   Problem: Do-While
*/
	.global _start
_start:
	MOV R0, #0
	MOV R1, #1

//Unlike while loop, do goes ahead and loop
_doWhile:
	ADD R0, R0, R1
	ADD R1, R1, #1
	CMP R1, #10
	BLE _doWhile @As long as R1 <= #10 is true, do-while loop runs
	BGT _exit    @As soon as R1 becomes bigger than #10 loop ends	

_exit:
	MOV R7, #1
	SWI 0
