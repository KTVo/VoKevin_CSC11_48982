/* Kevin Vo
   12/11/2015
   CSC-11 (48982)
   Assignment: Example Homework
*/

.data
.balign 4
 stEnd: .asciz "\nEnter the START then END for the range of temperature.\n"
.balign 4
 choice1: .asciz "Enter 1 for CENTIGRADE to FAHRENHEIT"
.balign 4
 choice2: .asciz "\nEnter 2 for FAHRENHEIT to CENTIGRADE\n"
.balign 4
celOutput: .asciz "Centigrade = %d ---> Fahrenheit = %d\n"
.balign 4
fahOutput: .asciz "Fahrenheit = %d ---> Centigrade = %d\n"
.balign 4
mRetry: .asciz "\nError: Please enter only 1 or 2 for the choices below.\n\n"
scan1: .asciz "%d %d"
scan2: .asciz "%d"
inStart: .word 0
inEnd: .word 0
inChoice: .word 0

.text
	.global main
main:
	//Askes for the range and loads it to register R5 and R6
	LDR R0, addr_stEnd
	bl printf
	LDR R0, addr_scan1
	LDR R1, addr_inStart
	LDR R2, addr_inEnd
	bl scanf
        LDR R5, addr_inStart
        LDR R5, [R5]
        LDR R6, addr_inEnd
        LDR R6, [R6]
ask:

	//Askes for fah -> cel or cel to fah
        LDR R0, addr_choice1
        bl printf
        LDR R0, addr_choice2
        bl printf
        LDR R0, addr_scan2
        LDR R1, addr_inChoice
        bl scanf
	LDR R4, addr_inChoice
	LDR R4, [R4]

	//Checks input inChoice
	CMP R4, #1
		BLT retry
		BEQ celtofah
	CMP R4, #2
		BGT retry
		BEQ fahtocel
fahtocel:
	LDR R7, =0x8E38F //BP -20 WD -20, = 5/9 = 0.5555

//Converts C to F
forloopC2F:
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
		BLE forloopC2F
		b exit

celtofah:
	LDR R7, =0x1CCD //BP-12 WD-20, = 9/5

//Converts C to F
forloopF2C:
	MUL R8, R5, R7
	MOV R8, R8, LSR#12
	ADD R8, R8, #32
	MOV R1, R5
	MOV R2, R8
	LDR R0, addr_celOutput
	bl printf
	ADD R5, R5, #1
	CMP R5, R6
		BLE forloopF2C
		b exit
exit:
	MOV R7, #1
	SWI 0
retry:
	LDR R0, addr_mRetry
	bl printf
	b ask

addr_stEnd: .word stEnd
addr_choice1: .word choice1
addr_choice2: .word choice2
addr_scan1: .word scan1
addr_scan2: .word scan2
addr_inStart: .word inStart
addr_inEnd: .word inEnd
addr_inChoice: .word inChoice
addr_fahOutput: .word fahOutput
addr_celOutput: .word celOutput
addr_mRetry: .word mRetry

//External
.global printf
.global scanf
