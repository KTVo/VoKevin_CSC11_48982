	.global _start
_start:
	MOV R0, #0 @x, 
	MOV R1, #0 @i,
	MOV R2, #0

_for:
	ADD R1, R1, R2
	ADD R2, R2, #1
	CMP R2, #10
	BLE _for
	BGT _exit

_exit:
	MOV R0, R1
	MOV R7, #1
	SWI 0
