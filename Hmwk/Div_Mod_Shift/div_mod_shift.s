	.global _start
_start:
	MOV R1, #122	@Num
	MOV R2, #5	@Denom
	MOV R3, #0	@Scale
	MOV R4, R2	@Denom's resetter
	MOV R0, #0	@Use to display remainder

_numChecker:
	CMP R2, R1	 @Compares Denum & Num
	BGT _exit        @Branches to _exit if >
	BLT _shiftLeft   @Branches to _shiftLeft if <
	BAL _numChecker  @Loops upon itself

_shiftLeft:
	CMP R2, R1		@Compares Denum and Num
	BGT _shiftRight         @Branch to_shiftRight if >
	MOV R2, R4, LSL R3	@Resets Denom and shifts by R3
	ADD R3, R3, #1      	@# of times _shiftLeft been looped
	BAL _shiftLeft          @If it hasn't branched

_shiftRight:
	MOV R2, R2, LSR #1      @Shift RIGHT by 1
	SUB R1, R1, R2          @R1 = R1 - R2, eventually = mod
	MOV R3, #0		@Sets counter back to 0
	MOV R2, R4		@Sets Denom back to original value
	BAL _numChecker		@Calls up _numChecker to check Denom

_exit:
	MOV R0, R1	@Displays the Mod
	MOV R7, #1
	SWI 0

