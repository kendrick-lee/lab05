.data

krabby: .word 1 2 3 4 5 6 7 8 9 10

carray: .word 0:10

marray: .word 0:10

comma:  .asciiz ", "

prompt1:  .asciiz "Encrypted: "

prompt2:  .asciiz "Decrypted: "

newline:    .asciiz "\n"

.text
main:
	la $s0,krabby	
	la $s1,carray
	la $s2,marray	

	li $t6 1
	li $t7 10
	move $t8 $s0
    loopA:
	bgt $t6 $t7 loopexitA
	li $a0 3
	li $a1 11
	lw $a2 0($t8)
	
	jal secret_formula_apply
	
	sw $v0 0($t8)
	
	addiu $t8 4
	addi $t6 1
	
	j loopA

    loopexitA:
	addiu $t8 -40
	move $t1 $t8
	move $s1 $t8
	li $t6 1
	li $t7 10
	
	li $v0 4
	la $a0 prompt1
	syscall

	j printA


    loopBstart:
	li $t6 1
	li $t7 10
	move $t8 $s1
	
    loopB:
	bgt $t6 $t7 loopexitB
	li $a0 3
	li $a1 11
	lw $a2 0($t8)
	
	jal secret_formula_remove
	
	sw $v0 0($t8)
	
	addiu $t8 4
	addi $t6 1
	
	j loopB

    loopexitB:
	addiu $t8 -40
	move $t1 $t8
	li $t6 1
	li $t7 10
	
	li $v0 4
	la $a0 newline
	syscall
	
	li $v0 4
	la $a0 prompt2
	syscall

	j printB
	


    printA:
	bgt $t6 $t7 loopBstart
	
	li $v0 1
	lw $a0 0($t1)
	syscall
	
	beq $t6 $t7 loopBstart
	li $v0, 4
        la $a0, comma
        syscall
	
	addiu $t1 4
	addiu $t6 1
	
	j printA
	
     printB:
	bgt $t6 $t7 exit
	
	li $v0 1
	lw $a0 0($t1)
	syscall
	
	beq $t6 $t7 exit
	li $v0, 4
        la $a0, comma
        syscall
	
	addiu $t1 4
	addiu $t6 1
	
	j printB


	
	j exit


secret_formula_apply:
#fill stuff here thanksi
	li $t0 7
	mult $a0 $a1
	mflo $t1 
	
	move $t3 $a2
	
	li $t4 0
	li $t2 1
    loop:
	beq $t0 $t2 mod
	mult $t3 $a2
	mflo $t3
	addi $t2 1
	j loop
	
   
    mod:
	div $t3 $t1
	mfhi $t5
	
	move $v0 $t5
	
	jr $ra



secret_formula_remove:
#fill more stuff here thanksi
	li $t0 3
	mult $a0 $a1
	mflo $t1 
	
	move $t3 $a2
	
	li $t4 0
	li $t2 1
    loopR:
	beq $t0 $t2 modR
	mult $t3 $a2
	mflo $t3
	addi $t2 1
	j loopR
	
   
    modR:
	div $t3 $t1
	mfhi $t5
	
	move $v0 $t5
	
	jr $ra





exit:
	li $v0, 10
	syscall
	
