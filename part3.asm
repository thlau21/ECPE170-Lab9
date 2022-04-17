# A Stub to develop assembly code using QtSPIM

	# Declare main as a global function
	.globl main 

	# All program code is placed after the
	# .text assembler directive
	.text 		

# The label 'main' represents the starting point
main:
	lw $t0, Z #loads word Z
	lw $t1, i #loads word i

	li $t2, 20 #load 20 into t2 for if statement in first loop
	li $t3, 100 #load 100 into t3 for 2nd loop
	li $t4, 1 # load 1 into t4 for inverse logic of 3rd loop
	#first loop
firstloop: 
	bgt $t1, $t2, doWhile #if i > 20 then jump to the next while loop
	addi $t0, $t0, 1 #add 1 to Z
	addi $t1, $t1, 2 #add 2 to i
	j firstloop
doWhile:
	addi $t0, $t0, 1 #add 1 to Z
	blt $t0, $t3, doWhile #Z < 100 jump to doWhile


lastWhile:
	blt $t1, $t4, done #if i < 1 so 0 or less, jump to done/exit loop
	addi $t0, $t0, -1 #subtract 1 from Z
	addi $t1, $t1, -1 #subtract 1 from i
	j lastWhile #jump back to lastWhile

done:
	#save result of Z into register
	sw $t0, Z #save Z into t0
	sw $t1, i #save i into t1
	# Exit the program by means of a syscall.
	# There are many syscalls - pick the desired one
	# by placing its code in $v0. The code for exit is "10"
	li $v0, 10 # Sets $v0 to "10" to select exit syscall
	syscall # Exit

	# All memory structures are placed after the
	# .data assembler directive
	.data
Z: .word 2
i: .word 0



	# The .word assembler directive reserves space
	# in memory for a single 4-byte word (or multiple 4-byte words)
	# and assigns that memory location an initial value
	# (or a comma separated list of initial values)
	#For example:
	#value:	.word 12
