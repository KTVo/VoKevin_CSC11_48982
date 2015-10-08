/* Kevin Vo
   Oct. 7th, 2015
   CSC-11 (48982)
   Assignment: Chap 9 to 12
*/

@Chapter 9 example -> GE: Greater or Equal (Signed)
	.global _start
_start:
	MOV R0, #2
	MOV R1, #1
	
	CMP  R1, R0
	ADDGE R0, R0, #4 @Only adds if R1 >= R2
_exit:
	MOV R7, #1
	SWI 0
