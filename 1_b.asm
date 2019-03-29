main:
	addi $sp,$sp,-16
	sw   $s0,12($sp)
	sw   $s1,8($sp)
	sw   $s2,4($sp)
	sw   $s3,0($sp)
	li   $s0,-1
	li   $s1,1
	mult $s0,$s1
	mfhi $s2
	mflo $s3
	lw   $s3,0($sp)
	lw   $s2,4($sp)
	lw   $s1,8($sp)
	lw   $s0,12($sp)
	addi $sp,$sp,16
j $31
