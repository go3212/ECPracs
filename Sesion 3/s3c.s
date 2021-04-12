	# Sessio 3

	.data 
mat:	.word 0,0,2,0,0,0
	.word 0,0,4,0,0,0
	.word 0,0,6,0,0,0
	.word 0,0,8,0,0,0
resultat: .space 4
	.text 
	.globl main
main:
# Escriu aqui el teu codi del main
	addiu $sp, $sp, -4
	sw $ra, 0($sp)
	
	la $s0, resultat
	la $a0, mat
	
	jal suma_col
	
	sw $v0, 0($s0)
	
	lw $ra, 0($sp)
	addiu $sp, $sp, 4
	jr $ra

suma_col:
	li $v0, 0
	addiu $t0, $a0, 8
	addiu $t7, $a0, 80
while:
	lw $t1, 0($t0)
	addu $v0, $v0, $t1
	addiu $t0, $t0, 24
	ble $t0, $t7, while
	jr $ra
	




