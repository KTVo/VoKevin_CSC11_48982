/*
	Kevin Vo
	Sept 27, 2015
	CSC-11 (48982)
	Assignment: Div/Mod 1
	Prob: Division
*/

	.global _start
_start:
	MOV R1, #1000
	MOV R2, #25
    
_subtract:
	SUBS R1, R1, R2     @R1 = R1 - R2
	ADD  R0, R0, #1     @Keeps track of iteration (R1 = R1 + 1)
	CMP  R1, #1         @Compares to see when (R1-R2) < 1
	BGE  _subtract      @Will call upon itself until (R1-R2) < 1
_exit:
	MOV R3, R0          @Displays R0 (# of iterations rep. as division)
	MOV R7, #1
	SWI 0
