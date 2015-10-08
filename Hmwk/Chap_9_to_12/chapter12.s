/* Kevin Vo
   Oct. 7th, 2015
   CSC-11 (48982)
   Assignment: Chap 9 to 12
*/

@Chapter 12 Book Example "Smarter Simple Multiplication"

	.global _start
_start:
	MOV R0, #9

_SmartMult:
	ADD R0, R0, R0, LSL #1 
	MOV R0, R0, LSL #1     
_exit:
	MOV R7, #1
	SWI 0
