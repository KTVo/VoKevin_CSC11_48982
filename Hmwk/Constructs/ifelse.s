/* Kevin Vo
   Oct. 5, 2015
   CSC-11 (48982)
   Assignment: Constructs
   Problem: If-else
   Instructions:
        M,T,W,Thu,Fri -> Days of week represented by 1,2,3,4,5 which are utiliz$
        Assembly = CSC 11, Intro Programming = CSC 5, Intro Concepts = CIS 1a,
        Output 11 for M,W
        Output 5  for T,Thur
        Output 1 for Friday
        Output 0 for any other number.
*/

	.global _start
_start:
	MOV R0, #0 @Display
	MOV R1, #2 @Input

_if:
	CMP R1, #1
	BEQ _CSC11
	CMP R1, #3
	BEQ _CSC11
	BNE _if_else1
	_CSC11:
		MOV R0, #11
		BAL _exit
_if_else1:
	CMP R1, #2
	BEQ _CSC5
	CMP R1, #4
	BEQ _CSC5
	BNE _if_else2
	_CSC5:
		MOV R0, #5
		BAL _exit

_if_else2:
	CMP R1, #5
	BEQ _CSC1
	BNE _else
	_CSC1:
		MOV R0, #1	
		BAL _exit

_else:
	CMP R1, #1
	BLT _void
	CMP R1, #5
	BGT _void
	BAL _exit
	_void:
		MOV R0, #0


_exit:
	MOV R7, #1
	SWI 0
