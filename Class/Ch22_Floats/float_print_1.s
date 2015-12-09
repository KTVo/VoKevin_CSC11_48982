.data
vaue1: .float 1.54321
string: .asciz "Floating point value is: %f\n"

.text
	.global main
	.func main
main:
	LDR R1, address_of_value1
	VLDR S14, [R1]
	VCVT .F64.F32 D5, S14

	LDR R0, =string
	VMOV R2, R3, D5
	bl printf

	MOV R7, #1
	SWI 0


address_of_value1: .word value1
address_of_string: .word string
