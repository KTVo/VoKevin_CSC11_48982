.global main
.func main
main:
	LDR R1, addr_value1
	VLDR S14, [R1]

	MOV R7, #1
	SWI 0
addr_value1: .word value1
addr_m1: .word m1
.data

value1: .float 1.3244
.balign 4
m1: .asciz "\nHello"
