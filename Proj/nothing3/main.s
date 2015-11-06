//Data Main
.data
//Challenges
.balign 4
Prompt1: .asciz "Objective: Solve the challenges to obtain weapon and kill the beast.\n"
.balign 4
chest1: .asciz "\n*******************\n*------[ o ]------*\n*     %dMOD%d =?    *\n*******************\n"

//Market
.balign 4
disBalance: .asciz "Balance = $%d"
.balign 4
disStore1: .asciz "\n--- Town Store ---\n*------[ o ]------*\n*------[ o ]------*\n*     %d/%d =?    \n*******************\n"
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
.balign 4
check: .asciz "Answer = %d"
//End Game
.balign 4
disWin: .asciz "Cangratulations, you have killed the monster before he has woken from his slumbers.\n"
.balign 4
disLos: .asciz "Them monster has not been killed in time. He woken up and killed you.\n"
.balign 4
return: .word 0
.balign 4
storeit: .word 0
.balign 4
scan: .asciz "%d"
.balign 4
cInput: .asciz "Input = %d"
.text
	.global main
main:
	LDR R1, address_of_return
	STR LR, [R1]

	LDR R0, address_of_Prompt1
	bl printf

	MOV R5, #0; //Setting starting balance
	MOV R6, #3; //Setting starting damage

	bl ranNum
	MOV R8, R1//For Displaying original value
calChal1:
	SUBS R1, R1, #2//Answer
        CMP R1, #1
		BGT calChal1
Challenge1:
	MOV R9, R1//Stores answer aftermath
        LDR R0, address_of_check
        bl printf

	MOV R2, #2 //Bottom
	MOV R1, R8//R1 Top
	LDR R0, address_of_chest1
	bl printf

	LDR R0, address_of_scan
	LDR R1, address_of_storeit
	bl scanf

	LDR R0, address_of_storeit
	LDR R0, [R0]

	CMP R9, R0
		BEQ correct
		BNE incorrect
correct:
	ADD R5, R5, #50
	bl Challenge1Con
incorrect:
	ADD R5, R5, #66
	bl Challenge1Con
Challenge1Con:
	MOV R1, R0
	LDR R0, address_of_cInput
	bl printf
	MOV R1, R9
	LDR R0, address_of_check
	bl printf
	MOV R1, R5
	LDR R0, address_of_disBalance
	bl printf

Challenge2:
	//bl pattern

_exit:
	LDR LR, address_of_return
	LDR LR, [LR]

	BX LR

address_of_cInput: .word cInput
address_of_check: .word check
address_of_storeit: .word storeit
address_of_Prompt1: .word Prompt1
address_of_chest1: .word chest1
address_of_return: .word return
address_of_scan: .word scan

address_of_disBalance: .word disBalance
address_of_disStore1: .word disStore1
address_of_Error1: .word Error1
address_of_NoMoneyM: .word NoMoneyM

address_of_BTitle: .word BTitle
address_of_BHealth: .word BHealth
address_of_PDamage: .word PDamage
address_of_PInstru: .word PInstru
address_of_disNumTurn: .word disNumTurn

address_of_disWin: .word disWin
address_of_disLos: .word disLos
//External
.global printf
.global scanf
