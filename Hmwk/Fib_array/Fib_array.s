.data
.balign 4
askTerm: .asciz "Enter term for Fibonacci: "
.balign 4
result: .asciz "Input -> %d Output -> %d"
.balign 4
scan: .asciz "%d"
.balign 4
read: .word 0
.balign 4
return: .word 0

.balign 4
array: .skip 176 //44 int elements * 4 bytes = 176

.text
	.global main
main:

	LDR R1, address_of_return
	STR LR, [R1]

	LDR R0, address_of_askTerm
	bl printf

	LDR R0, address_of_scan
	LDR R1, address_of_read
	bl scanf

	LDR R1, address_of_read
	LDR R1, [R1]

	MOV R2, #0 @counter
	MOV R4, #1 @first
	MOV R5, #0 @second

	LDR R7, address_of_array

AssignArray:
	CMP R2, R1 //compares counter with input term
		BEQ _disResult
	ADD R6, R5, R4
	MOV R5, R4
	MOV R4, R6

	ADD R3, R7, R2, LSL#2
	STR R4, [R3]

	ADD R2, R2, #1
	b AssignArray

disResult:
	MOV R2, R1

	MOV R1, R4

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

.global printf
.global scanf
