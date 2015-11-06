//Data Main
.data
//Challenges
.balign 4
Prompt1: .asciz "Objective: Solve the challenges to obtain weapon and kill the beast.\n"
.balign 4
chest1: .asciz "\n*******************\n*------[ o ]------*\n*     %dMOD%d =?    *\n*******************\n"

.balign 4
return: .word 0
.balign 4
storeit: .word 0
.balign 4
scan: .asciz "%d"
.balign 4
pDamage: .word 0 //Stores player's damage to memory
.balign 4
askBonus: .asciz "\nEnter 'a' if you'd like to do the Bonus round. If you win, you'll get a total of 10 TURNS to kill the monster instead of just 7.\n"
.balign 4
scanString: .asciz "%s"
.balign 4
inA: .asciz "a"
.balign 4
holdString: .word 0

.balign 4
dispDamage: .asciz "Player's Damage: %d\n"

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
	MOV R5, #3
	ADD R5, R5, #3
	LDR R1, address_of_pDamage
	STR R5, [R1]

	LDR R2, address_of_pDamage
	LDR R2, [R2]

	MOV R1, R2
	LDR R0, address_of_dispDamage
	bl printf

	bl Challenge1Con
incorrect:
	ADD R5, R5, #66
	bl Challenge1Con
Challenge1Con:


Challenge2:
	bl Pattern
	//calls address_of_pDamage
	//and loads pDamage R1 <- *R1
	LDR R5, address_of_pDamage
	LDR R5, [R5]

	CMP R9, #123			//Checks is WIN code is thrown from Pattern
		ADDEQ R5, R5, #10	//Adds 10 extra damage only and if only WIN code #123 is thrown

	LDR R1, address_of_pDamage	//Loads the address_of_pDamage again to store the "maybe" changed value of pDamage
	STR R5, [R1]                    //Stores R5 -> [R1](*R1)

	LDR R1, address_of_pDamage	//Calls address_of_pDamage again to display it
	LDR R1, [R1]                    //Sets [R1](*R1) -> R1 for ouput

	LDR R0, address_of_dispDamage	//Outputs player's damage
	bl printf

askGuessBonus:
	LDR R0, address_of_askBonus
	bl printf
	LDR R0, address_of_scanString
	LDR R1, address_of_holdString
	bl scanf

	//Checks if R2(has input) == 'a'
	LDR R1, address_of_holdString
	LDR R2, [R1]		//Loads *R1 into R2

	LDR R4, address_of_inA //Loads address_of_inA, to check if input(R2) == 'a'
	LDR R4, [R4]           //Puts [R4](*R4) -> R4 for comparison

	CMP R2, R4
		BEQ _GuessBonus //If player enters 'a' then GuessBonus will start
		BNE _boss       // If player enters != 'a' then it'll just banch to the boss

_GuessBonus:
	bl guessBonus //Win this and get 3 extras turn to kill the Boss, a total of 10 turns

_boss:
	@bl bossFight
_exit:
	LDR LR, address_of_return
	LDR LR, [LR]

	BX LR

address_of_pDamage: .word pDamage
address_of_storeit: .word storeit
address_of_Prompt1: .word Prompt1
address_of_chest1: .word chest1
address_of_return: .word return
address_of_scan: .word scan

address_of_askBonus: .word askBonus

address_of_holdString: .word holdString
address_of_inA: .word inA
address_of_scanString: .word scanString

address_of_dispDamage: .word dispDamage
//External
.global printf
.global scanf
