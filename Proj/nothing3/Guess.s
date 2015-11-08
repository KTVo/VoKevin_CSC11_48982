//Data
.data
.balign 4
Prompt1: .asciz "\nObj: Guess a number 0 and 23. The game will let you know if your INPUT is too HIGH or LOW. You'll get 5 TRIES to get it right.\n"
.balign 4
disTries: .asciz "		%d/5 TRIES\n"
.balign 4
askGuess: .asciz "Enter a number: "
.balign 4
disGrt: .asciz "%d is too High.\n"
.balign 4
disLes: .asciz "%d is too Low.\n"
.balign 4
cInput: .asciz "\nYou've guessed correctly!\n You now have 10 TURNS instead of 7 TURNS to kill the monster.\n"

.balign 4
return: .word 0
.balign 4
input: .word 0
.balign 4
scanG: .asciz "%d"

.balign 4
returnG: .word 0

.balign 4
displayNum: .asciz "\nRandom Number: %d\n"

.text

	.global guessBonus
guessBonus:
	LDR R1, address_of_returnG
	STR LR, [R1]


	MOV R8, #78 //Preset, throws lose code
	MOV R7, #1 //Counts loops for display disTries
	MOV R5, #0
	LDR R0, address_of_Prompt1
	bl printf

	bl ranNum //Randomizes the number again to make it different from objective 1
//Loops back to this
gamble:
	CMP R5, #5
		BEQ _exitGamble
	LDR R0, address_of_askGuess
	bl printf

	MOV R1, R7
	LDR R0, address_of_disTries
	bl printf

	//scan
	LDR R0, address_of_scanG
	LDR R1, address_of_input
	bl scanf

	ADD R7, R7, #1


	LDR R0, address_of_input
	LDR R0, [R0]
	MOV R9, R0

	MOV R1, R10
	LDR R0, address_of_displayNum
	bl printf

	CMP R9, R10
		BEQ correct
		BLT lesser
		BGT greater

_exitGamble:
	LDR LR, address_of_returnG
	LDR LR, [LR]
	BX LR

correct:
	LDR R0, address_of_cInput
	bl printf
	MOV R8, #169 //Win code
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
address_of_disTries: .word disTries
address_of_askGuess: .word askGuess
address_of_returnG: .word returnG
address_of_scanG: .word scanG
address_of_input: .word input
address_of_disGrt: .word disGrt
address_of_disLes: .word disLes
address_of_cInput: .word cInput
address_of_displayNum: .word displayNum

//External
.global printf
.global scanf
.global time
.global srand
.global rand
