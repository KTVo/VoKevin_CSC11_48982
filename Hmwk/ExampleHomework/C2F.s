.data
.balign 4
celOutput: .asciz "Centigrade = %d ---> Fahrenheit = %d\n"

.text
	.global celtofah
celtofah:
	LDR R7, =0x1CCD //BP-12 WD-20, = 9/5

//Converts C to F
forloopC2F:
	MUL R8, R5, R7
	MOV R8, R8, LSR#12
	ADD R8, R8, #32
	MOV R1, R5
	MOV R2, R8
	LDR R0, addr_celOutput
	bl printf
	ADD R5, R5, #1
	CMP R5, R6
		BLE forloopC2F
		b main

addr_celOutput: .word celOutput
