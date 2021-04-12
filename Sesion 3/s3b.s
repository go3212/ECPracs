	# Sessio 3

	.data 
# Declara aqui les variables mat1, mat4 i col
mat1: 	.space 120
mat4: 	.word 2,3,1,2,4,3
col:  	.word 2


	.text 
	.globl main
main:
# Escriu aqui el programa principal
	addiu $sp, $sp, -4
	sw $ra, 0($sp)

	la $s0, mat1
	
	la $a0, mat4
	lw $a1, 8($a0)
	la $a2, col
	lw $a2, 0($a2)

	jal subr
	
	sw $v0, 108($s0)
	
	la $a0, mat4
	li $a1, 1
	li $a2, 1
	
	jal subr
	
	sw $v0, 0($s0)

	lw $ra, 0($sp)
	addiu $sp, $sp, 4
	jr $ra

subr:
	la $t0, mat1
	# Calc @mat[j][5]
	# j*6*4 + 5*4
	sll $t1, $a2, 4
	sll $t2, $a2, 3
	addu $t1, $t1, $t2
	addiu $t1, $t1, 20
	# $t0 = @mat1[j][5]
	addu $t0, $t0, $t1
	# Calc @x[i][j]
	# i*8 + 4*(i+j)
	sll $t1, $a1, 3
	addu $t2, $a1, $a2
	sll $t2, $t2, 2
	addu $t1, $t1, $t2 # i*8 + 4*(i+j)
	# $t1 = @x[i][j]
	addu $t1, $t1, $a0
	# Calc mat[j][5] = x[i][j]
	lw $t1, 0($t1)
	sw $t1, 0($t0)
	move $v0, $a1
	jr $ra
	
	
	
	


