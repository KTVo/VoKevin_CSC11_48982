/* Kevin Vo
   CSC-11 (48982)
   12/7/15
   Assignment: Terminal Velocity - Scaled Integer Assembly (Part 5)
*/

.data
.balign 4
disResult: .asciz "Terminal Velocity = %d\n"

.balign 4
disPres: .asciz "Dynamic Pressure = %d\n"

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

	MOV R4, R4, LSR#16

	MUL R8, R4, R8

	MOV R8, R8, LSR#12

	MOV R1, #0	//Counter for divmod = V


divmod:
        SUB R7, R7, R8
        ADD R1, R1, #1

	CMP R7, R8
		BGE divmod


dynPressure:
	MUL R2, R1, R6
	MOV R2, R2, LSR#25
	MOV R9, R1
	MOV R1, R2
	LDR R0, address_of_disPres
	bl printf
	MOV R1, R9
	MOV R4, R1 //R4 = R1 = VtoSQRT

sqrtBabylonian:
	MOV R1, R1, LSR#1	//R1 = v/2
	MOV R3, #0	//Counter for while_x_NEQ_y
	MOV R7, R1	//R7 = x.n = v/2

while_x_NEQ_y:
	CMP R1, R3	//x = y?
		BEQ display
	MOV R8, R1	

	MOV R2, R7 	//R2 = x.n
	MOV R4, R9 	//
	MOV R3, #0	//Counter for s/x.n
	b dCheck

div_s_over_xn:
	SUB R4, R4, R1	//Cal. for s/x.n
	ADD R3, R3, #1

dCheck:
	CMP R4, R1
		BGE div_s_over_xn

	ADD R1, R1, R3 //x = (x+B)
	MOV R1, R1, LSR#1 // x/2
	MOV R7, R1
	BAL while_x_NEQ_y

display:
	LDR R0, address_of_disResult
	bl printf

exit:
	LDR LR, address_of_return
	LDR LR, [LR]
	bx LR

address_of_disResult: .word disResult
address_of_return: .word return
address_of_disPres: .word disPres

//global
.global printf
