/* Kevin Vo
   Oct. 5, 2015
   CSC-11 (48982)
   Assignment: Constructs
   Problem: If
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
	MOV R0, #0 @output
	MOV R1, #1 @input

_if:
	CMP R1,#1       @Compares input (R1) with #1
	BEQ _CSC11	@If R1=#1, condition under _CSC11 happens
	
	CMP R1, #3      @|| if R1=#3, still branches to _CSC11
	BEQ _CSC11
	BLT _void
	_CSC11:
		MOV R0, #11
		BAL _exit

	CMP R1, #2	 @Checks if input R1=#2 or #4 if so, _CSC5
	BEQ _CSC5
	CMP R1, #4
	BEQ _CSC5
	_CSC5:
		MOV R0, #5
		BAL _exit

	CMP R1, #5
	BEQ _CSC1
	BGT _void	@if input is invalid, branches to void

	_CSC1:
		MOV R0, #11
		BAL _exit


	_void:
		MOV R0, #0
		BAL _exit

_exit:
	MOV R7, #1
	SWI 0
