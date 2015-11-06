//Data
.data
.balign 4
promptPat: .asciz "Guess which number goes next to win a weapon.\n"
.balign 4
chestTop: .asciz "\n*******************\n*------[ o ]------*\n*"
.balign 4
chestPat: .asciz "%d,"
.balign 4
blank: .asciz "_?_\n"
.balign 4
chestBot: .asciz "\n*******************\n"
.balign 4
returnPat: .word 0
.balign 4
scanPat: .asciz "%d"
.balign 4
inChest: .word 0
.balign 4
askPat: .asciz "Input the next value: "
.balign 4
patCorM: .asciz "\nThe input was correct. You've earned a LUPARA +10 Damage.\n"
.balign 4
patWro: .asciz "\nSorry, but input should = %d. The prize will NOT be given.\n"
.text
	.global main
main:
	LDR R1, address_of_returnPat
	STR LR, [R1]

	LDR R0, address_of_promptPat
	bl printf
	LDR R0, address_of_chestTop
	bl printf

	MOV R1, #14
	LDR R0, address_of_chestPat
	bl printf
	//Pattern sequence
	//R1 = 2+(R4 + 3)*4
	//R4++

	//R5 = R4 + 3
	//R5 *= 4
	//R1 = R5 + 2
	MOV R4, #0
for_loop_pat:
	ADD R5, R4, #4
	MOV R5, R5, LSL#2
	ADD R5, R5, #2

	MOV R1, R5
	CMP R4, #4
		BLT printPat
check:
	ADD R4, R4, #1
	CMP R4, #4
		BLE for_loop_pat
		BGT inputPat
printPat:
	LDR R0, address_of_chestPat
	bl printf
	bl check
inputPat:
	LDR R0, address_of_blank
	bl printf
	LDR R0, address_of_chestBot
	bl printf

	LDR R0, address_of_askPat
	bl printf

	LDR R0, address_of_scanPat
	LDR R1, address_of_inChest
	bl scanf

	LDR R0, address_of_inChest
	LDR R0, [R0]

checkInput:
	CMP R0, R5
		BEQ corPat
		BNE wroPat
corPat:
	MOV R9, #123 //Correct code
	LDR R0, address_of_patCorM
	bl printf
	BAL _exitPat

wroPat:
	MOV R9, #111//Incorrect code
	MOV R1, R5
	LDR R0, address_of_patWro
	bl printf
	BAL _exitPat

_exitPat:
	LDR LR, address_of_returnPat
	LDR LR, [LR]
	BX LR

address_of_patWro: .word patWro
address_of_patCorM: .word patCorM
address_of_askPat: .word askPat
address_of_blank: .word blank
address_of_promptPat: .word promptPat
address_of_chestTop: .word chestTop
address_of_chestPat: .word chestPat
address_of_chestBot: .word chestBot
address_of_returnPat: .word returnPat
address_of_scanPat: .word scanPat
address_of_inChest: .word inChest
//External
.global printf
.global scanf
