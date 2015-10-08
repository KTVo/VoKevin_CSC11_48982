/* Kevin Vo
   Oct. 7th, 2015
   CSC-11 (48982)
   Assignment: Chap 9 to 12
*/
@Chapter 11 Example, Immediate Constant Range
	.global _start
_start:
	MOV R1, #78
	MOV R0, R1, ROR #24 @R0 = 78 after being rotated right 24 places

_exit:
	MOV R7, #1
	SWI 0
