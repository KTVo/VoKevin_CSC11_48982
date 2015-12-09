/* Printing two floating point numbers */
	
	.global	main
	.func main
main:
	SUB SP, SP, #16		@ Make space on stack

	//Finding (Terminal Velocity)^2
	LDR R1, addr_pi	//Loads PI into R1
	VLDR S14, [R1]	//Vector Load R1 into S14
	//VCVT.F64.F32 D0, S14

	LDR R1, addr_e
	VLDR S15, [R1]	//VLoads DENSITY OF AIR into S15

	VMUL.F32 S2, S14, S15	//Denom = PI * DENSITY OF AIR

	LDR R1, addr_dSQ
	VLDR S15, [R1]

	VMUL.F32 S2, S2, S15	//Denom *= DIAMETER^2

	LDR R1, addr_drag
	VLDR S15, [R1]

	VMUL.F32 S2, S2, S15	//Denom *= COEFFICIENT OF DRAG

	LDR R1, addr_w
	VLDR S15, [R1]

	VDIV.F32 S2, S15, S2	//V^2 = WEIGHT = WEIGHT/Denom

	//Finding Dynamic Pressure
	LDR R1, addr_e
	VLDR S14, [R1]

	VMUL.F32 S14, S2, S14	//DYN PRESSURE = V^2 * e

	LDR R1, addr_drag //Reusing value of drag b/c it's also = 0.5
	VLDR S13, [R1]

	VMUL.F32 S14, S13, S14	//DYN PRESSURE *= 0.5

	VCVT.F64.F32 D0, S14	//Converts B32 to B64 for display of DYN PRESSURE

	//Calculates V = sqrt(S2)
	VSQRT.F32 S14, S2

	VCVT.F64.F32 D1, S14	//Converts B32 to B64 for display of TERMINAL VELOCITY

	LDR R0, =string		@ point R0 to string
	VMOV R2, R3, D0		@ first value
	VSTR D1, [SP]		@ second on stack
	BL printf		
	ADD SP, SP, #16		@ restore stack

	MOV R7, #1		@ Exit Syscall
	SWI 0	


addr_pi: .word pi
addr_w: .word w
addr_drag: .word drag
addr_e: .word e
addr_dSQ: .word dSQ


.data
pi:.float 3.14159
w: .float 0.81 //w * 8
drag: .float 0.5
e: .float 0.0023679
dSQ: .float 0.0196
string:	.asciz "Dynamic Pressure = %f \nTerminal Velocity = %f\n"


