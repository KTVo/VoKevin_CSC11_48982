/*
	Kevin Vo
	Sept 22, 2015
	2) Conversion Area to Radius^2
	R1 -> area = 110
	R2 -> Conversion of Area to Radius^2
	R0 -> Result
*/

	.global _start
_start:
	MOV R1, #110      @BP  0 WD7 
	LDR R2, =0x517CC1 @BP-24 WD24
	MUL R0, R2, R1    @BP-24 WD31
	LSR R0, #24       @BP  0 WD7
	MOV R7, #1
	SWI 0
