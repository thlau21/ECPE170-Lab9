# A Stub to develop assembly code using QtSPIM

	# Declare main as a global function
	.globl main 

	# All program code is placed after the
	# .text assembler directive
	.text 		

# The label 'main' represents the starting point
main:
	#loads all the variable
	li $t0, 15 #A = 15
	li $t1, 10 #B = 10
	li $t2, 7 #C = 7
	li $t3, 2 #D = 2
	li $t4, 18 #E = 18
	li $t5, -3 #F = -3

	#do the arithmetic operations in paranthesis
	add $t6, $t0, $t1 # A + B to t6
	sub $t1, $t2, $t3 #C-D by replacing B
	add $t4, $t4, $t5 #E+F by replacing E
	sub $t3, $t0, $t2 #A-C by replacing D

	#combine the results from previous block of arithmetic operations
	add $t0, $t6, $t1 #(A+B) + (C-D) by replacing A
	sub $t1, $t4, $t3 #(E+F) - (A-C) by replacing C-D

	#combine the result from the last block of code to get the answer of Z
	add $t0, $t0, $t1 #answer of Z

	#store the answer of Z in $t0 into Z data
	sw $t0, Z #store answer of Z into Z

	# Exit the program by means of a syscall.
	# There are many syscalls - pick the desired one
	# by placing its code in $v0. The code for exit is "10"
	li $v0, 10 # Sets $v0 to "10" to select exit syscall
	syscall # Exit

	# All memory structures are placed after the
	# .data assembler directive
	.data
	Z: .word 0



	# The .word assembler directive reserves space
	# in memory for a single 4-byte word (or multiple 4-byte words)
	# and assigns that memory location an initial value
	# (or a comma separated list of initial values)
	#For example:
	#value:	.word 12
