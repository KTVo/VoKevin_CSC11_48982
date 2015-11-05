//Data Main
.data
//Challenges
.balign 4
Prompt1: .asciz "Objective: Solve the challenges to obtain weapon and kill the beast.\n"
.balign 4
chest1: .asciz "\n*******************\n"
.balign 4
chest2: .asciz "*------[ o ]------*\n"
.balign 4
chest3: .asciz "*     %d/%d =?    *\n"
.balign 4
chest4: .asciz "*******************\n"

//Market
.balign 4
disBalance: .asciz "Balance = $%d"
.balign 4
disStore1: .asciz "\n--- Town Store ---\n*------[ o ]------*\n*------[ o ]------*\n*     %d/%d =?    *\n*******************\n"
.balign 4
Error1: .asciz "\nInsufficient Funds or Invalid Selection.\n"
.balign 4
NoMoneyM:.asciz "You cannot afford anything else. Now leaving store.\n"

//Boss
.balign 4
BTitle: .asciz "\n--- The Sleeping Giant ---\n"
.balign 4
BHealth: .asciz "\nBoss' HP: %d\n"
.balign 4
PDamage: .asciz "Player's Damage: %d\n"
.balign 4
PInstru: .asciz "Enter '1' to attack: "
.balign 4
disNumTurn: .asciz "%d/7 Turns\n"

//End Game
.balign 4
disWin: .asciz "Cangratulations, you have killed the monster before he has woken from his slumbers.\n"
.balign 4
disLos: .asciz "Them monster has not been killed in time. He woken up and killed you.\n"
.balign 4
return: .word 0

.text
	.global main
main:
	LDR R1, address_of_return
	STR LR, [R1]

	LDR R0, address_of_Prompt1
	bl printf



	LDR LR, address_of_return
	LDR LR, [LR]

	BX LR


address_of_Prompt1: .word Prompt1
address_of_chest1: .word chest1
address_of_chest2: .word chest2
address_of_chest3: .word chest3
address_of_chest4: .word chest4
address_of_return: .word return

address_of_
//External
.global printf
.global scanf
