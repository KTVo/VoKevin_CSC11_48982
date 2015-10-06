	.global _start
_start:
	MOV R0, #0 @Display
	MOV R1, #2 @Input

_if:
	CMP R1, #1
	BEQ _CSC11
	CMP R1, #3
	BEQ _CSC11
	BAL _if_else1
	_CSC11:
		MOV R0, #11

_if_else1:
	CMP R1, #2
	BEQ _CSC5
	CMP R1, #4
	BEQ _CSC5
	BAL _if_else2
	_CSC5:
		MOV R0, #5


_if_else2:
	CMP R1, #5
	BEQ _CSC1
	BAL _else
	_CSC1:
		MOV R0, #1	


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
