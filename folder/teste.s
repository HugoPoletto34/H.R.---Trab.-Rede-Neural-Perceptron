	.data
N1:	.asciiz "\nDigite o numero 1 numero: \n"
N2:	.asciiz "\nDigite o numero 2 numero: \n"
N3:	.asciiz "\nDigite o numero 3 numero: \n"
N4:	.asciiz "\nDigite o numero 4 numero: \n"
N5:	.asciiz "\nDigite o numero 5 numero: \n"
MED:	.asciiz "\nA media dos numeros é: \n"
	.text

main:   addi $v0, $zero, 4
	la $a0, N1
	syscall
	addi $v0, $zero, 5
	syscall
	sw $s0, $v0

	addi $v0, $zero, 4
	la $a0, N2
	syscall
	addi $v0, $zero, 5
	syscall
	add $s1, $zero, $v0 #n1

	addi $v0, $zero, 4
	la $a0, N3
	syscall
	addi $v0, $zero, 5
	syscall
	add $s2, $zero, $v0 #n1

	addi $v0, $zero, 4
	la $a0, N4
	syscall
	addi $v0, $zero, 5
	syscall
	add $s3, $zero, $v0 #n1

	addi $v0, $zero, 4
	la $a0, N5
	syscall
	addi $v0, $zero, 5
	syscall
	add $s4, $zero, $v0 #n1

	addi $v0, $zero, 4
	la $a0, MED
	syscall

	add $s5, $s0, $s1
	add $s5, $s5, $s2
	add $s5, $s5, $s3
	add $s5, $s5, $s4

	div $t0, $s5, 5
	addi $v0, $zero, 1
	add $a0, $zero, $t0
	syscall

	jr $ra