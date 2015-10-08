@Add a 2 Three Words Value
@1 word = 4 bytes (32 bits)

	.global _start
_start:
	MOV R4, #0x1          @   Lower Part #1
	MOV R5, #0xFFFFFFFF   @  Middle Part #1
	MOV R6, #0xFFFFFFFF   @  Higher Part #1
	MOV R0, #0xFF         @   Lower Part #2
	MOV R8, #0xFFFFFFFF   @  Middle Part #2
	MOV R9, #0xFFFFFFFF   @  Higher Part #2

	ADDS R1, R4, R0    @Add lower words and check for carry
	ADCS R2, R5, R8    @Add middle words with carry
  	ADCS R3, R6, R9    @Add higher words with carry

	MOV R7, #1
	SWI 0
