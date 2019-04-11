.data
	signQuotient: .word 1
	signDivisor: .word 0
	signRemainder: .word 0
	quotient: 	.word 50  
	remainder: 	.word 0
	divisor: 	.word 10
	n: 	.word 32
.text

main:
	lw $t0,quotient	
	lw $t1,divisor
	lw $t2,remainder
	lw $t3,n	
	lw $t6,signQuotient
	lw $t7,signDivisor
	addi $s0,$s0,0   
	addi $s1,$s1,1   
	sll $t5,$s1,31
L1:
	slt $s2,$0,$t3
	beq $s2,$0,E1
        and $s3,$t5,$t0
	srl $s3,$s3,31
	sll $t2,$t2,1
	add $t2,$t2,$s3
	sll $t0,$t0,1
	sub $t2,$t2,$t1
	and $s4,$t2,$t5
	srl $s4,$s4,31
	beq $s4,$s0,L2
	beq $s4,$s1,L3

L2:
	add $t0,$t0,$s1
	sub $t3,$t3,$s1
	j L4
  
L3:
	add $t2,$t2,$t1
	sub $t3,$t3,$s1
	j L4
  
L4:
	beq $t3,$s0,E1
	j L1
  
E1:
        beq $t6,$s0,L5
	beq $t6,$s1,L6
  
L5:
	beq $t7,$s0,L7
	beq $t7,$s1,L8
  
L6:
	beq $t7,$s0,L8
	beq $t7,$s1,L7
  
L7:
	sw $s0,signRemainder
	j E2
  
L8:
	sw $s1,signRemainder
	j E2

E2:
	sw $t0,quotient
	sw $t2,remainder
	j $ra
