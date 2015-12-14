.data
euler: .float 2.7181281
r: .float 1.318309
one: .float 1.000000
pi: .float 3.14159
st: .float 2.6879

test: .asciz "Float = %f\n"
.balign 4
testd: .asciz"R44 = %d\n"
.balign 4
disVal: .asciz "\nThis Input is equal to value: %d\n"

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
	//PUSH {R4, LR}
	STR LR, [SP, #-12]!
	SUB SP, SP, #12

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


	//LDR R1, addr_globArr //R1 <- &globArr

CalAssign:
	//CMP R4, #24
		//BGE memGame
	VMUL.F32 S10, S10, S10 //r^n

	VSUB.F32 S10, S12, S10 //(1-r^n)

	VMUL.F32 S10, S9, S10 //a * (1 - r^n)
	VPUSH {S10}
	//VSTR S10, [SP, #4]

	VSUB.F32 S8, S12, S11 //S8 = 1 - r

	//VSTR S8, [SP, #8]

	VDIV.F32 S8, S10, S8 //S8 = a(1-r^n)/(1-r)

	VABS.F32 S8, S8

	VSQRT.F32 S8, S8

	//VSTR S8, [SP, #12]

	VCVT.F64.F32 D15, S8

	VMOV R2, R3, D15
	LDR R0, =test
	bl printf

	//ADD R4, R4, #1
	//b loopCalAssign

memGame:
	MOV R10, #4
	//MOV R4, #0
	LDR R0, addr_testd
	bl printf
	VPOP {S10}
	VMOV S8, S10
	VLDR S8, [SP,#4]
	VCVT.F64.F32 D15, S8
 	LDR R0, =test
	VMOV R2, R3, D15
	bl printf
stopread:
exit:
	ADD SP, SP, #+12
	LDR LR, [SP], #+12
	//BX LR
	POP {R4, LR}
	BX LR
	//MOV R7, #1
	//SWI 0
addr_mWin: .word mWin
addr_pLast1: .word pLast1
addr_pLast2: .word pLast2
addr_pLast3: .word pLast3
addr_pLast4: .word pLast4
addr_disVal: .word disVal

addr_testd: .word testd
addr_euler: .word euler
addr_r: .word r
addr_one: .word one
addr_pi: .word pi
addr_st: .word st
addr_globArr: .word globArr
