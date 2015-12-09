.data
pi:.float 3.14
w: .float 0.81
C: .float 0.5
e: .float 0.0023679
disResult: .asciz "Terminal Velocity = %f\n"


.text

	.global main
	.func main
main:
	LDR R1, addr_pi
	VLDR S8, [R1]

	LDR R1, addr_e
	VLDR S10, [R1]

	VMUL .F32 S2, S8, S10

	VCVT .F64 .F32 D1, S2

	LDR R0, =disResult
	VMOV R2, R3, D5
	bl printf

	MOV R7, #1
	SWI 0





addr_pi: .word pi
addr_w: .word w
addr_C: .word C
addr_e: .word e
addr_disResult: .word disResult
