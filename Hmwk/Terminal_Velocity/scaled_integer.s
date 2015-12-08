/* Kevin Vo
   CSC-11 (48982)
   12/7/15
   Assignment: Scaled Integer Assembly (Part 5)
*/

.data
.balign 4
disResult: .asciz "Terminal Velocity = %d Dynamic Pressure = %d\n"
.balign 4
return: .word 0
.text
	.global main
main:
	LDR R1, address_of_return
	STR LR, [R1]

	LDR R3, =0x3243F6A9	//PI
	LDR R4, =0x504816F0	//diaSQ
	LDR R5, =0x19Eb851E	//w
	LDR R6, =0x9B2EC51	//e

	//R1 = TERMINAL VELOCITY
	//R2 = DYNAMIC PRESSURE

	MOV R7, R5	//R7 = TOP

	MOV R3, R3, LSR#16
	MOV R6, R6, LSR#12
	MUL R8, R3, R6	//R8 = BOT

	MOV R8, R8, LSR#16	//BOT>>=16

	MUL R8, R4, R8

	MOV R8, R8, LSR#12

	MOV R1, #0	//Counter for divmod = V


while_top_GE_bot:
	CMP R7, R8
		BLT dynPressure
	bl _exit

divmod:
	SUB R7, R7, R8
	ADD R1, R1, #1
	BAL while_top_GE_bot


dynPressure:
	MUL R2, R1, R6
	MOV R2, R2, LSR#25

	MOV R4, R1 //R4 = R1 = VtoSQRT

sqrtBabylonian:
	MOV R1, R1, LSR#1	//R1 = v/2
	MOV R3, #0	//Counter for sqrtBabylonian

	CMP R1, #1
		BLT while_R1_GE_one
	MOV R1, R3 //R1 = count++
	MOV R5, #0
	bl while_R1_NEQ_R6

while_R1_GE_one:
	SUB R1, R1, #2
	ADD R3, R3, #1
	bl sqrtBabylonian

while_R1_NEQ_R6:
	MOV R6, R1 //y = x.(n+1)
	ADD R1, R1, R4 //x = (x + VtoSQRT/x)
	MOV R1, R1, LSR#1
		CMP R3, R1
			BEQ display
VtoSQRT_over_x:
		SUB R4, R4, R1
		ADD R5, R5, #1
		CMP R4, R1
			BLT VtoSQRT_over_x
			bl while_R1_NEQ_R6
display:
	LDR R0, address_of_disResult
	bl printf

exit:
	LDR LR, address_of_return
	LDR LR, [LR]
	bx LR

address_of_disResult: .word disResult
address_of_return: .word return

//global
.global printf
