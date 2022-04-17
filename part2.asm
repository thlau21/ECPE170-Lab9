# A Stub to develop assembly code using QtSPIM

	# Declare main as a global function
	.globl main 

	# All program code is placed after the
	# .text assembler directive
	.text 		

# The label 'main' represents the starting point
main:
	#load variables
	lw $t0, A #loads A into t0
	lw $t1, B #loads B into t1
	lw $t2, C #loads C into t2
	lw $t3, Z #loads Z in t3

	#if(A > B or C < 5)
	bgt $t0, $t1, if #this line does the A > B comaprison
	li $t4, 5 #loads 5 into t4 so i can use it to do the C < 5 comparison
	blt $t2, $t4, if #checks C < 5

	#else if ((A>B) && (C+1) == 7))
	blt $t1, $t0, else #inverse by checking B < A and if so, jump to else
	addi $t2, $t2, 1 #put C+1 into $t2 since we won't need C anymore
	li $t4, 7 #loads 7 into t4
	bne  $t5, $t4, else #check if the C + 1 != 7 and if so go to else 
	addi $t3, $t3, 2 #since Z is 0 and I want to set Z = 2, I add 2 to Z here
	j endif #jump to done
if:
	addi $t3, $t3, 1 #since Z is 0 and I want to set Z = 1, I add 1
	#li $t3, 1 #load 1 into Z
	j endif #jump to done label after branch execution
else:
	addi $t3, $t3, 3 #since Z is 0 and I want to set Z = 3, I add 3 to Z here
endif:
	#switch statements
	li $t4, 1 #load 1 into t4 to use for switch case where Z is 1
	beq $t3, $t4, caseOne #if Z == 1

	#case 2 where Z = 2
	li $t4, 2
	bne $t3, $t4, default #if Z != 2 go default case
	addi $t3, $t3, -4 #add -4 to 2 to set Z = -2

caseOne:
	addi $t3, $t3, -2 #since Z is 1 and I want to set Z to -1 then I add -2 to subtract 2
	j done

default:
	#from the if else statements, Z can only be 1, 2. or 3
	#therefore, if we reach default case, Z = 3
	#so we subtract 3 from Z to set Z = 0
	addi $t3, $t3, -3 # add -3 to Z to  set Z = 0

done:
	sw $t3, Z #save whatever number is in t3 into Z
	# Exit the program by means of a syscall.
	# There are many syscalls - pick the desired one
	# by placing its code in $v0. The code for exit is "10"
	li $v0, 10 # Sets $v0 to "10" to select exit syscall
	syscall # Exit

	# All memory structures are placed after the
	# .data assembler directive
	.data
	A: .word 10
	B: .word 15
	C: .word 6
	Z: .word 0



	# The .word assembler directive reserves space
	# in memory for a single 4-byte word (or multiple 4-byte words)
	# and assigns that memory location an initial value
	# (or a comma separated list of initial values)
	#For example:
	#value:	.word 12
