@creating a Carry Bit

	.global _start
_start:
	MOV R1, #1
	LDR R2, =0xFFFFFFFF @8 * 4 = 32 Bit (largest value)
	ADCS R0, R1, R2     @Carrys Over
			   /*Status Flag looks like this:
			     NZCV
			     0110
			   */
	MOV R7, #1
	SWI 0
