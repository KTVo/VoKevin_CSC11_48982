	.global _start
_start:
	MOV R0, #0
	MOV R1, #1
	MOV R2, #0

_check:
	CMP R1, #10
	BLE _while
	BGT _exit

_while:

	ADD R0, R0, R1
	ADD R1, R1, #1
	BAL _check

_exit:
	MOV R0, R0
	MOV R7, #1
	SWI 0
