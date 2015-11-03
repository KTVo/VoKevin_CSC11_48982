/* Kevin Vo
   10/31/15
   Assignment: Midterm
   Part: Menu
   Class: CSC-11 (48982)
*/

.data
// Data for Menu
.balign 4
mTitle: .asciz "\n--- Midterm  Menu ---\n"
.balign 4
mOp1: .asciz "Enter 1 for Problem 1\n"
.balign 4
mOp2: .asciz "Enter 2 for Problem 2\n"


//Data for Input
.balign 4
input: .asciz "%d"
.balign 4
number_read: .word 0
.balign 4
return: .word 0

.text
	.global main
main:
	BAL _menu

_menu:
	LDR R1, address_of_return
	STR LR, [R1]

	//Displays menu title 
	LDR R0, address_of_mTitle
	bl printf

	//Displays menu options
	LDR R0, address_of_mOp1
	bl printf
	LDR R0, address_of_mOp2
	bl printf

	//Requests menu input
	LDR R0, address_of_input
	LDR R1, address_of_number_read
	bl scanf

	LDR R0, address_of_number_read
	LDR R0, [R0]


	LDR LR, address_of_return
        LDR LR, [LR]

	//Checks input mChoice
	CMP R0, #1
		BLT _exit
		BEQ _case1
	CMP R0, #2
		BEQ _case2
		BGT _exit


_case1:
	@BAL Prob1
_case2:
	@BAL Prob2
_case3:
	@BAL Prob3


_exit:
	LDR LR, address_of_return
        LDR LR, [LR]

	BX LR


/*Menu's Addresses*/
address_of_mTitle: .word mTitle
address_of_mOp1: .word mOp1
address_of_mOp2: .word mOp2
address_of_return: .word return
address_of_input: .word input
address_of_number_read: .word number_read


/*External*/
.global printf
.global scanf
