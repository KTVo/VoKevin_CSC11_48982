	.global _start
_start:
	MOV R1, #3
	MOV R2, #1
	SUBS R0, R1, R2
	MOV R7, #1
	SWI 0	
