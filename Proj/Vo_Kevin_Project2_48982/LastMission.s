.data
euler: .float 2.7181281
r: .float 1.318309
one: .float 1.000000
pi: .float 3.14159
st: .float 2.6879

input1e: .asciz "Input 1 = %f\n"
input2e: .asciz "Input 2 = %f\n"

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
.balign 4
mIn1: .asciz "\nEnter your first guess (Valid Inputs = 1,2,3): "
.balign 4
mIn2: .asciz "\nEnter your second guess (Valid Inputs = 4,5,6): "
.balign 4
in1: .word 0
.balign 4
in2: .word 0
.balign 4
scanL: "%d"

.balign 4
mInvalid1: .asciz "\nYour first input is out of range.\n"

.text

	.global main
main:
	//PUSH {R4, LR}
	//STR LR, [SP, #-12]!
	//SUB SP, SP, #12

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
	VMUL.F32 S10, S10, S10 //r^n

	VSUB.F32 S10, S12, S10 //(1-r^n)

	VMUL.F32 S10, S9, S10 //a * (1 - r^n)

	VSTR S10, [SP, #4]

	VSUB.F32 S8, S12, S11 //S8 = 1 - r

	VSTR S8, [SP, #8]

	VDIV.F32 S8, S10, S8 //S8 = a(1-r^n)/(1-r)

	VABS.F32 S8, S8

	VSQRT.F32 S8, S8

	VSTR S8, [SP, #12]

	//VCVT.F64.F32 D15, S8

	//ADD R4, R4, #1
	//b loopCalAssign

memGame:
	MOV R10, #4
	//MOV R4, #0


	VLDR S8, [SP,#12]
	VCVT.F64.F32 D15, S8
	VMOV R2, R3, D15
 	LDR R0, =test
	bl printf

askIn1:
	LDR R0, addr_mIn1
	bl printf

	LDR R0, addr_scanL
	LDR R1, addr_in1
	bl scanf

	LDR R1, addr_in1
	LDR R1, [R1]

checkIn1:
	CMP R1, #1
		BLT disInvalid
		BEQ disVal1
	CMP R1, #2
		BEQ disVal2
	CMP R1, #3
		BGT disInvalid
		BEQ disVal3

disVal1:
	VLDR S8, [SP, #12]
	VCVT.F64.F32 D15, S8
	VMOV R2, R3, D15
	LDR R0 =input1e
	bl printf

	b askIn2

disVal2:
        VLDR S8, [SP, #4]
        VCVT.F64.F32 D15, S8
        VMOV R2, R3, D15
        LDR R0 =input1e
	bl printf
	b askIn2
disVal3:
        VLDR S8, [SP, #8]
        VCVT.F64.F32 D15, S8
        VMOV R2, R3, D15
        LDR R0 =input1e
	bl printf
	b askIn2

disInvalid1:

	b askIn1
askIn2:
        LDR R0, addr_mIn2
        bl printf

        LDR R0, addr_scanL
        LDR R2, addr_in2
        bl scanf

        LDR R2, addr_in2
        LDR R2, [R2]

checkIn2:
        CMP R2, #4
                BLT disInvalid2
                BEQ dis2Val1
        CMP R2, #5
                BEQ disVal2
        CMP R2, #6
                BGT dis2Invalid
                BEQ disVal3




dis2Val1:
        VLDR S8, [SP, #8]
        VCVT.F64.F32 D15, S8
        VMOV R2, R3, D15
        LDR R0 =input1e
	bl printf

dis2Val2:
dis2Val3:

disInvalid2:

exit:
	//ADD SP, SP, #+12
	//LDR LR, [SP], #+12
	//BX LR
	//POP {R4, LR}
	//BX LR
	MOV R7, #1
	SWI 0
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
addr_in1: .word in1
addr_in2: .word in2
mIn1: .word mIn1
mIn2: .word mIn2

input1e: .word input1e
input2e: .word input2e
