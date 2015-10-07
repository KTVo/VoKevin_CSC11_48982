/* Kevin Vo
   Oct. 5, 2015
   CSC-11 (48982)
   Assignment: Constructs
   Problem: While
*/

	.global _start
_start:
	MOV R0, #0
	MOV R1, #1
	MOV R2, #0

//Checks for if the conditions are meant before entering loop
_check:
	CMP R1, #10
	BLE _while
	BGT _exit

_while:

	ADD R0, R0, R1
	ADD R1, R1, #1
	BAL _check	@returns to check if conditions have been meant to end

_exit:
	@MOV R0, R0 @displays R0
	MOV R7, #1
	SWI 0
