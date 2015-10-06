/* Kevin Vo
   Oct. 5, 2015
   CSC-11 (48982)
   Assignment: Constructs
   Problem: Switch
   Instructions:
	M,T,W,Thu,Fri -> Days of week represented by 1,2,3,4,5 which are utilized as inputs.
	Assembly = CSC 11, Intro Programming = CSC 5, Intro Concepts = CIS 1a, 
	Output 11 for M,W
	Output 5  for T,Thur
	Output 1 for Friday
	Output 0 for any other number.
*/

	.global _start
_start:
	MOV R0, #0 @Output
	MOV R1, #1 @Input

@Checks which case to brach with with BEQ, BTL, BGT
_checker:
	CMP R1, #1 
	BEQ _case1
	BLT _default
	
	CMP R1, #2
	BEQ _case2
	
	CMP R1, #3
	BEQ _case1
	
	CMP R1, #4
	BEQ _case2
	
	CMP R1, #5
	BEQ _case3
	BGT _default
	
	BAL _checker

_case1:	
	MOV R0, #11
	BAL _exit

_case2:
	MOV R0, #5
	BAL _exit

_case3:
	MOV R0, #1
	BAL _exit

_default:		@Branchs to _default: if R1 is <1 or >5
	MOV R0, #0
	BAL _exit

_exit:
	MOV R7, #1
	SWI 0
