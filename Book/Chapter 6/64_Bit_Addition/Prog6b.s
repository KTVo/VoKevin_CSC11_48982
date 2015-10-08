	.global _start
_start: 
	MOV R2, #0xFFFFFFFF  @lower half first #
	MOV R3, #0x1	     @higher half first #
	MOV R4, #0xFFFFFFFF  @lower half second #
	MOV R5, #0xFFFFFFFF  @higher half second #
	ADDS R0, R2, R4      @sum of lower halves (set flag)
	ADCS R1, R3, R5     @sum of higher halves (with carry)

	//From now on, use ADCS until all words have been added
	//1 word = 4 bytes (32 bits)
	//Only needed ADDS for 1st WORD so carry condition can be set 
	//for first instant

	MOV R7, #1
	SWI 0
