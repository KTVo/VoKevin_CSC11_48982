	.global _start
_start:
	MOV R0, #0 @output
	MOV R1, #1 @input

_if:
	CMP R1,#1 
	BEQ _CSC11
	
	CMP R1, #3
	BEQ _CSC11
	BLT _void
	_CSC11:
		MOV R0, #11


	CMP R1, #2 
	BEQ _CSC5
	CMP R1, #4
	BEQ _CSC5
	_CSC5:
		MOV R0, #5


	CMP R1, #5
	BEQ _CSC1
	_CSC1:
		MOV R0, #11
	BGT _void
	BAL _exit

_void:
	MOV R0, #0
	BAL _exit

_exit:
	MOV R7, #1
	SWI 0
