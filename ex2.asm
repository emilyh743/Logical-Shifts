#Lab 9: ex2.asm: Pseudo-random number generator

.data 0x0   #what type of commands come next. 0x0 = where to put it. "this segment of data to be in 0x0"
newline: .asciiz "\n"
.text 0x3000    #0x3000 all data-memory

main:

	ori $v0, $0, 5		#scan input (starting value - seed)
	syscall
	move $a3, $v0		#set $a3 as original
	
	move $t0, $v0
	
	li $v0, 1		#print integer
	add $a0, $t0, $0
	syscall
	
	
	#ori $v0, $0, 4		#print newline here
	#la $a0 newline
	#syscall
	jal rnGen		#go to rnGen
	
rnGen:

	LOOP:   		#registers need to be consistent
	move $v0, $a3
	
	srl $a0, $v0, 4
	andi $a1, $a0, 0x01 	#R4
	srl $a2, $v0, 2
	andi $a2, $a2, 0x01 	#R2
	xor $a2, $a2, $a1	#final B value in here
	
	
	andi $a3, $v0, 0x0F
	sll $a3, $a3, 1
	or $a3, $a3, $a2 
	
	beq $t0, $a3, exit	#go to exit: if number generated is same as starting value
	
	
	ori $v0, $0, 4		#print newline here
	la $a0 newline
	syscall
	
	li $v0, 1
	move $a0, $a3           #moves final answer to $a0, which the computer reads
	syscall
	
	
	#li $v0, 1
	#move $a0, $a3           #moves final answer to $a0, which the computer reads
	#syscall
	
	#beq $t0, $a3, exit	#go to exit: if number generated is same as starting value
	
	j	LOOP

	exit:			#to terminate program
	li $v0, 10
	syscall
