/*
	Kevin Vo
	Sept 23, 2015
	CSC-11 48982
	3) Convert area to radius^2
	R1 -> area = 113.4
	R2 -> Value of PI to get area
	R0 -> Result of Radius^2
*/

	.global _start
_start:
	LDR R1, =0x7166 @BP -8 WD16 
	LDR R2, =0x517C @BP-16 WD16
	MUL R0, R2, R1  @BP-24 WD32
	LSR R0, #24     @BP  0 WD8
	MOV R7, #1
	SWI 0

