/*
	Kevin Vo
	Sept 11th, 2015
	Assignment 1
	Prob: prog3a.s
	Course: CSC11(48982)
*/

	.global _start
_start:
	MOV R0, #65 @ moves value 65 to Register 0
	MOV R7, #1 @ moves value 1 to Register 7
	SWI 0 @ Calls for operating system
