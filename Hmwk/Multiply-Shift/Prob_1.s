/*
	Kevin Vo
	Sept 22, 2015
	1) Conversion Months to Years
	R1 -> Number of months
	R2 -> Conversion of months to years 1/12
	R0 -> Number of years
*/

	.global _start
_start:
	MOV R1, #88       @BP  0 WD 8
	LDR R2, =0x155556 @BP-24 WD24
	MUL R0, R2, R1    @BP-24 WD32
	LSR R0, #24       @BP  0 WD 8
	MOV R7, #1
	SWI 0
 
