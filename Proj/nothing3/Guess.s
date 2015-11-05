//Data
.data
.balign 4
Prompt1: .asciz "Unpon coming to the casino you have been unknowingly ingesting poison.\n" 
.balign 4
Prompt2: .asciz "You now have 6 turns to guess the dealer's number, if you haven't guessed it by 6 turns, the poison will have reached your heart.\n\n"
.balign 4
askGuess: .asciz "Enter a number: "
.balign 4
disGrt: .asciz "%d is too High.\n"
.balign 4
disLes: .asciz "%d is too Low.\n"
.balign 4
cInput: .asciz "You've guessed correctly!\n You now have $400 extra.\n"

.balign 4
return: .word 0
.balign 4
input: .word 0
.balign 4
scanG: .asciz "%d"

.balign 4
return2: .word 0

.text

	.global main
main:
	MOV R7, #100 @Call back
	MOV R5, #0
	LDR R1, address_of_return
	STR LR, [R1]

	LDR R0, address_of_Prompt1
	bl printf
	LDR R0, address_of_Prompt2
	bl printf

gamble:
	CMP R5, #5
		BEQ _exitGamble
	LDR R0, address_of_askGuess
	bl printf

	//scan
	LDR R0, address_of_scanG
	LDR R1, address_of_input
	bl scanf

	LDR R0, address_of_input
	LDR R0, [R0]
	MOV R9, R0
	bl ranNum
	CMP R9, R8
		BEQ correct
		BLT lesser
		BGT greater

_exitGamble:
	LDR LR, address_of_return
	LDR LR, [LR]
	BX LR

correct:
	LDR R0, address_of_cInput
	bl printf
	ADD R4, R4, #400
	bl _exitGamble

lesser:
	LDR R1, address_of_input
	LDR R1, [R1]
	LDR R0, address_of_disLes
	bl printf
	ADD R5, R5, #1
	bl gamble

greater:
	LDR R1, address_of_input
	LDR R1, [R1]
	LDR R0, address_of_disGrt
	bl printf
	ADD R5, R5, #1
	bl gamble

address_of_Prompt1: .word Prompt1
address_of_Prompt2: .word Prompt2
address_of_askGuess: .word askGuess
address_of_return: .word return
address_of_scanG: .word scanG
address_of_input: .word input
address_of_disGrt: .word disGrt
address_of_disLes: .word disLes
address_of_cInput: .word cInput





//External
.global printf
.global scanf
.global time
.global srand
.global rand
