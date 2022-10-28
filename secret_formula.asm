.data

krabby:
.word 1 2 3 4 5 6 7 8 9 10

carray:
.word 0:10

marray:
.word 0:10

.text
main:
	la $a0,krabby
	li $a1,10
	
	la $a2,carray
	la $a3,marray
	
	move $t6 $v0
	
	li $v0 1
	move $a0 $t6
	syscall

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





exit:
	li $v0, 10
	syscall
	
