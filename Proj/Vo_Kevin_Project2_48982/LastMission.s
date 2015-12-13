.data
euler: .float 2.7181281
r: .float 0.318309
one: .float 1.000000
pi: .float 3.14159
st: .float 2.6879

disVal: .asciz "\nThis Input is equal to value: %f\n"

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


.balign 4
globArr: .skip 12

.text

	.global main
main:
	//STR LR, [SP, #-4]!
	//SUB SP, SP, #4

	MOV R4, #0 //Counter


	//Vector loads the single precision values
	LDR R1, addr_st
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


	LDR R1, addr_globArr //R1 <- &globArr

loopCalAssign:
	CMP R4, #3
		BGE memGame
	VMUL.F32 S10, S10, S10 //r^n

	VSUB.F32 S10, S12, S10 //(1-r^n)

	VMUL.F32 S10, S9, S10 //a * (1 - r^n)

	VSUB.F32 S8, S12, S11 //S8 = 1 - r

	VDIV.F32 S8, S10, S8 //S8 = a(1-r^n)/(1-r)

	//Stores Float into Array
	ADD R3, R1, R4, LSL#2
	VSTR S14, [R3]
	ADD R4, R4, #1
	b loopCalAssign

memGame:
	//VCVT.F64.F32 D14, S14

	//VMOV R2, R3, D14
	//bl printf

exit:
	//ADD SP, SP, #+4
	//LDR LR, [SP], #+4
	//BX LR
	MOV R7, #1
	SWI 0

addr_mWin: .word mWin
addr_pLast1: .word pLast1
addr_pLast2: .word pLast2
addr_pLast3: .word pLast3
addr_pLast4: .word pLast4

addr_euler: .word euler
addr_r: .word r
addr_one: .word one
addr_pi: .word pi
addr_st: .word st
addr_globArr: .word globArr
