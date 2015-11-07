//Data
.data
.balign 4
PromptBoss: .asciz "\nAs expected the monster is sleeping as you approached it.\nKill it before it wakes up and slaughters you.\n"
.balign 4
bossTurn: .asciz "                     %d/%d TURN\n"
.balign 4
scanBoss: .asciz "%d"
.balign 4
disbossHealth: .asciz "Boss' Health: %d"


.balign 4
bWinMess: .asciz "\nCongratulations, you have beaten the boss and have won the game!\n"
.balign 4
bLossMess: .asciz "\nUnfortunately you have not beaten the boss. Better luck next time.\n"


.balign 4
inputBoss: .word 0
.balign 4
returnBoss: .word 0


.text
	.global main
main:
	LDR R1, address_of_returnBoss
	STR LR, [R1]

	LDR R0, address_of_PromptBoss
	bl printf

	MOV R8, #0 //#setting number of rounds

	//LDR R7, address_of_numOfRounds
	//LDR R7, [R7]

	MOV R9, #100 //Bosses Health
for_loop_boss:
	MOV R2, #7
	MOV R7, #7
	ADD R8, R8, #1
	MOV R1, R8

	LDR R0, address_of_bossTurn
	bl printf

	MOV R1, R9
	LDR R0, address_of_disbossHealth
	bl printf

	LDR R0, address_of_scanBoss
	LDR R1, address_of_inputBoss
	bl scanf

	SUB R9, R9, #13
	CMP R9, #0
		BLE checkWinBoss

	CMP R7, R8
		BEQ checkWinBoss
		bl for_loop_boss


checkWinBoss:
	CMP R9, #0
		BLE bossWIN
		BGT bossLOSS

bossWIN:
	LDR R0, address_of_bWinMess
	bl printf
	bl _exitBoss

bossLOSS:
	LDR R0, address_of_bLossMess
	bl printf
	bl _exitBoss

_exitBoss:
	LDR LR, address_of_returnBoss
	LDR LR, [LR]
	BX LR


address_of_PromptBoss: .word PromptBoss
address_of_bossTurn: .word bossTurn
address_of_disbossHealth: .word disbossHealth
address_of_scanBoss: .word scanBoss
address_of_bWinMess: .word bWinMess
address_of_bLossMess: .word bLossMess
address_of_inputBoss: .word inputBoss
address_of_returnBoss: .word returnBoss


//External
.global printf
.global scanf
