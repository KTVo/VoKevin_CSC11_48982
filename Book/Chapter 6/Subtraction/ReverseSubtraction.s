	.global _start
_start:
	MOV R1, #23
	MOV R2, #2
	RSBS R0, R1, R2
	MOV R7, #1
	SWI 0
