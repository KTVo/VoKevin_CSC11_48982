/*
	Kevin Vo
	Sept 27, 2015
	CSC-11 (48982)
	Assignment: Div/Mod 1
	Prob: Mod
*/

	.global _start
_start:
	MOV R1, #3
	MOV R2, #2

_subtract:
	SUBS R1, R1, R2     @R1 = R1 - R2
	CMP  R1, #1         @Checks if R1 < 1
	BGT  _subtract      @Branch back to _subtract if R1 > 1 

_exit:
	MOV R0, R1          @Displays R1 since it's the remainder = mod
	MOV R7, #1
	SWI 0
