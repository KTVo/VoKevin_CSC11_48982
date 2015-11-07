//Data
.data
.balign 4
PromptBoss: .asciz "\nAs expected the monster is sleeping as you approached it.\nKill him in %d turns or it shall awaken and slaughter you.\n"
.balign 4
bossTurn: .asciz "%d/%d TURN\n"



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
	MOV R7, #7
for_loop_boss:
	ADD R8, R8, #1

	LDR R0, address_of_bossTurn
	bl printf

	CMP R7, R8
		BEQ checkWinBoss
		BLT for_loop_boss


checkWinBoss:

_exit:
	LDR LR, address_of_returnBoss
	LDR LR, [LR]
	BX LR


address_of_PromptBoss: .word PromptBoss
address_of_returnBoss: .word returnBoss
address_of_bossBoss: .word bossTurn

//External
.global printf
.global scanf