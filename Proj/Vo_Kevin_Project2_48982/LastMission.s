.data
.balign 4
mWin: .asciz "\nCongrats you have guessed a match and have found some antidote and managed to save yourself.\n"
.balign 4
pLast1: .asciz "\nAfter defeating the beast you have realized that its porous skin released a compound"
.balign 4
pLast2: .asciz " that is toxic to you. However it seems that you have found a box belonging to a nearby corpse"
.balign 4
pLast3: .asciz " labeled antidote.\nBefore your last dying breathe solve the puzzle"
.balign 4
pLast4: .asciz "by guessing the matching sets to obtain the antidote.\n You have 3 turns to do so.\n"

euler: .float 2.7181281
r: .float 0.318309
one: .float 1.000000
pi: .float 3.14159
a: .float 2.6879

.balign 4
globArr: .skip 12

.text

	.global main
main:
	STR LR [SP, #-4]!
	SUB SP, SP, #4

	MOV R4, #0 //Counter

	//Vector loads the single precision values
	LDR R1, addr_a
	VLDR S9, [R1]

	LDR R1, addr_euler
	VLDR S10, [R1]

	LDR R1, addr_r
	VLDR S11, [R1]

	LDR R1, addr_one
	VLDR S12, [R1]

	LDR R1, addr_pi
	VLDR S13, [R1]

	VADD.F32 S10, S11, S12 //euler = euler + rate + pi = new rate


loopAssign:
	CMP R4, #3
		BGE memGame
	VMUL.F32 S10, S10, S10 //r^n

	VSUB.F32 S10, S12, S10 //(1-r^n)

	VMUL.F32 S10, S9, S10 //a * (1 - r^n)

	VSUB.F32 S8, S12, S11 //S8 = 1 - r

	VDIV.F32 S8, S10, S8 //S8 = a(1-r^n)/(1-r)

	


exit:
	ADD SP, SP, #+4
	LDR LR, [SP], #+4
	BX LR

addr_mWin: .word mWin
addr_pLast1: .word pLast1
addr_pLast2: .word pLast2
addr_pLast3: .word pLast3
addr_pLast4: .word pLast4
