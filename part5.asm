# A Stub to develop assembly code using QtSPIM

	# Declare main as a global function
	.globl main 

	# All program code is placed after the
	# .text assembler directive
	.text 		

# The label 'main' represents the starting point
main:
	la $s0, string #load address of string buffer

	li $v0, 8 #sets $v0 to 8 to select read string
	la $a0, string #prepares argument for where to store what syscall reads
	li $a1, 256 #max character argument will take
	syscall

while: 
	lb $t0, 0($s0)#t0 = string[i]
	beq $t0, 0, notFound #e not found in whole string
	beq $t0, 101, found #string[i] == 'e'
	addi $s0, $s0, 1 #address + 1
	j while

notFound:
	li $v0, 4 #sets v0 to 4 to print string
	la $a0, eNotFound #load address of message
	syscall #print eNotFound

	j end
found:
	li $v0, 4 #sets v0 to 4 to print string
	la $a0, eFound #load address of message
	syscall #print eFound

	li $v0, 1 #sets v1 to 1 for print integer
	add $a0, $zero, $s0 #load integer to print
	syscall #print the integer

	li $v0, 4 #sets v0 to 4 to print string
	la $a0, eFound2 #load address of message
	syscall #print eFound2

end:
	# Exit the program by means of a syscall.
	# There are many syscalls - pick the desired one
	# by placing its code in $v0. The code for exit is "10"
	li $v0, 10 # Sets $v0 to "10" to select exit syscall
	syscall # Exit

	# All memory structures are placed after the
	# .data assembler directive
	.data
string: .space 256
eNotFound: .asciiz "No match found\n"
eFound: .asciiz "First match found at address "
eFound2: .asciiz "\nThe matching character is e\n"

	# The .word assembler directive reserves space
	# in memory for a single 4-byte word (or multiple 4-byte words)
	# and assigns that memory location an initial value
	# (or a comma separated list of initial values)
	#For example:
	#value:	.word 12
