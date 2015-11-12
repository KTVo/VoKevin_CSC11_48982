/* Kevin Vo
   CSC-11 (48982)
   11/11/2015
   Assignment: Array - Fibonacci
*/
.data
.balign 4
askTerm: .asciz "Enter term for Fibonacci: "
.balign 4
result: .asciz "\nInput -> %d Output -> %d\n"
.balign 4
scan: .asciz "%d"
.balign 4
read: .word 0
.balign 4
return: .word 0

.balign 4
array: .skip 180 //45 int elements * 4 bytes = 176

.text
	.global main
main:

	LDR R1, address_of_return
	STR LR, [R1]

	MOV R9, #0//Counter +4 for array[R9+4]

	LDR R0, address_of_askTerm //Asks user for input
	bl printf

	LDR R0, address_of_scan
	LDR R1, address_of_read //Takes in input value
	bl scanf

	LDR R1, address_of_read //Loads the address and set the value to R1
	LDR R1, [R1]

	MOV R2, #1 //counter
	MOV R4, #1 //first
	MOV R5, #0 //second

	LDR R7, address_of_array //Loads the address of the array into R7

AssignArray:
	//Returns 0 if input term > 46
	CMP R1, #45
		BGT tooLarge

	CMP R2, R1 //compares counter with input term
		BEQ disResult
	//Fibonacci calculation
	ADD R6, R5, R4
	MOV R5, R4
	MOV R4, R6

	//Store into array R3 = R7 -> address_of_array + (R2++*4)
	ADD R3, R7, R2, LSL#2
	STR R4, [R3]//Stores R4(changing term of fib) -> [R3]

	ADD R2, R2, #1 //R2 increment for loop
	bl AssignArray
//Sets up the right conditions for the upcoming loop
Setup:
	MOV R3, R1 //R3 holds original R1 since R1 will be changing
	MOV R1, R1, LSL#2 //R1 *= 4 for bytes of int

calArrFib:
	ADD R9, R9, #4 //R9 += 4 counter for loop and to set array
	LDR R4, [R7, +R9] //Loops through the array until CMP R9 > R1
	CMP R9, R1
		BLE calArrFib
	bl disResult

//Returns 0 if term > 46
tooLarge:
	MOV R2, #0

	LDR R0, address_of_result
        bl printf

	bl _exit

disResult:
	MOV R2, R4 //Sets R2 to R4

	LDR R0, address_of_result
	bl printf

_exit:
	LDR LR, address_of_return
	LDR LR, [LR]

	BX LR

address_of_askTerm: .word askTerm
address_of_result: .word result
address_of_scan: .word scan
address_of_read: .word read
address_of_array: .word array
address_of_return: .word return

.global printf
.global scanf
