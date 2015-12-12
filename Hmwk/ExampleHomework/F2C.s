.data
.balign 4
fahOutput: .asciz "Fahrenheit = %d ---> Centigrade = %d\n"

.text
	.global fahtocel

fahtocel:
	LDR R7, =0x8E38F //BP -20 WD -20, = 5/9 = 0.5555

//Converts F to C
forloopF2C:
	SUB R8, R5, #32; //(i-32)
	MUL R9, R8, R7
	MOV R9, R9, ASR#20 //ASR for suspected negative value
	ADD R9, R9, #1 //Adjustment for correct output
	ADD R2, R9
	MOV R1, R5
	LDR R0, addr_fahOutput
	bl printf
	ADD R5, R5, #1
	CMP R5, R6 //inStart <= inEnd
		BLE forloopF2C
		b main

addr_fahOutput: .word fahOutput
