	.global _start
_start:
	MOV R0, #0
	MOV R1, #0
	MOV R2, #0

_doWhile:
	ADD R1, R1, R2
	ADD R2, R2, #1
	CMP R2, #10
	BLT
	BG
