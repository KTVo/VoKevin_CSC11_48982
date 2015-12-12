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
mRetry: .asciz "Enter in any other # to exit.\n"

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

	LDR R0, addr_mRetry
	bl printf

        LDR R0, addr_scan2
        LDR R1, addr_inChoice
        bl scanf
	LDR R4, addr_inChoice
	LDR R4, [R4]

	//Checks input inChoice
	CMP R4, #1
		BLT exit
		BEQ celtofah
	CMP R4, #2
		BGT exit
		BEQ fahtocel

exit:
	MOV R7, #1
	SWI 0

addr_stEnd: .word stEnd
addr_choice1: .word choice1
addr_choice2: .word choice2
addr_scan1: .word scan1
addr_scan2: .word scan2
addr_inStart: .word inStart
addr_inEnd: .word inEnd
addr_inChoice: .word inChoice
addr_mRetry: .word mRetry

//External
.global printf
.global scanf
