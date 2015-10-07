/* Kevin Vo
   Oct. 5, 2015
   CSC-11 (48982)
   Assignment: Constructs
   Problem: For Loop
*/


	.global _start
_start:
	MOV R0, #0 	@n, adds itself with inc and stores it
	MOV R1, #1 	@i, increments to be summed
	MOV R2, #0 	@Keeps track of iteration, counter

_for:
        ADD R0, R0, R1  @R0 += R1
        ADD R1, R1, #1  @R1++
        ADD R2, R2, #1  @R2++
        CMP R2, #10
        BLT _for



_exit:
	MOV R7, #1
	SWI 0
