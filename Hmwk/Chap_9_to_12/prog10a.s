/* Kevin Vo
   Oct. 7th, 2015
   CSC-11 (48982)
   Assignment: Chap 9 to 12
   Problem: prog10a
*/
@ Convert to binary for printing
	.global _start
_start:
	MOV R6, #15
	MOV R10, #1
	MOV R9, R10, LSL #31
	LDR R1, =string

_bits:
	TST R6, R9
	MOVEQ R0, #48
	MOVNE R0, #49
	STR R0, [R1]
	MOV R8, R6
	BL _write
	MOV R6, R8

	MOVS R9, R9, LSR #1
	BNE _bits

_exit:
	MOV R7, #1
	SWI 0

_write:
	MOV R0, #1
	MOV R2, #1
	MOV R7, #4
	SWI 0
	BX LR

	 .data
	string:      .ascii " "	
