/* Kevin Vo
   CSC-11 (48982)
   11/17/15
   Assignment: Local Array Fibonacci
*/

.data
.balign 4
prompt: .asciz "Enter term for Fibonacci: "
.balign 4
disResult: .asciz "\nInput -> %d, Output -> %d\n"
.balign 4
scan: .asciz "%d"
.balign 4
highMes: .asciz "Input term too high. Returned 0.\n"

.text

checkFib:
	STR LR, [SP,#-4]! //Push LR onto top of stack
	STR R9, [SP,#-4]! //Push R0 onto top of stack



	//Checks if input == 1
	CMP R9, #1
		BNE not_first //If != branch to not_first to cal
	MOV R9, #1 //If == 1 for output
	b _exit

not_first:
	SUB R9, R9, #1 //Input -= 1 sof r counter
	bl checkFib

	//Fibonacci Calculation
	ADD R9, R3, R4
	MOV R3, R4
	MOV R4, R9

//Exits back to main
_exit:
	ADD SP, SP, #+4
	LDR LR, [SP], #+4
	BX LR



	.global main
main:
	STR LR, [SP, #-4]! //Push LR onto top of stack
	SUB SP, SP, #4	//Push R0 onto top of stack

	LDR R0, address_of_prompt //Asks for input of term
	bl printf

	LDR R0, address_of_scan
	MOV R1, SP
	bl scanf

	LDR R9, [SP] //Loads input into R9

	//Checks if R9 > 45, if so return 0
	CMP R9, #45
		BGT tooHigh
	ADD R9, R9, #1
	bl checkFib //Goes to check input == 1 or not for fib. calculation

	MOV R2, R9	//Moves value of R9 Fibonacci value into R2
	LDR R1, [SP] //Loads the input into R1

	//Displays input and output with R1 and R2
	LDR R0, address_of_disResult
	bl printf

//Ends program
end:
	ADD SP, SP, #+4
	LDR LR, [SP], #+4
	BX LR

//Returns 0 if input > 45, then branches back to end to stop program
tooHigh:
	MOV R2, #0
	LDR R1, [SP]
	LDR R0, address_of_disResult
	bl printf

	LDR R0, address_of_highMes
	bl printf

	b end

address_of_prompt: .word prompt
address_of_disResult: .word disResult
address_of_scan: .word scan
address_of_highMes: .word highMes
