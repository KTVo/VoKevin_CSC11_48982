	.text
	.global main
main:
	MOV R1, #2    
	MOV R2, #2
	CMP R1, R2
	BEQ case_equal		@If R1 & R2 are equal than branch to case_equal

case_different:			@This is called if BEQ is false
	MOV R0, #2		@Sets #2 to R0
	b end			@branches to end

case_equal:			@This is called if BEQ is true
	MOV R0, #1		@Sets #1 to R0

end:
	bx lr
