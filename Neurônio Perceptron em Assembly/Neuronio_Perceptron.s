		.data                    

peso1: 		.float 1.3
peso2: 		.float 2.2
zero:		.float 0.0
one:		.float 1.0
three:		.float 3.0
taxaApre: 	.float 0.0005
vet:            .space 600

soma:		.asciiz " + "
igual:		.asciiz " = "
pula:		.asciiz "\n"
		.text                    
		main:	
		
		
		lwc1 $f0, zero
		lwc1 $f1, one
		lwc1 $f12, three

		add.s $f2, $f0, $f1 		# cont = 1;
		addi $s1, $0, 0  		# i = 0;
		
		# Criando o Vetor de entradas
		FOR1: SLTI $t1, $s1, 150
		BEQ $t1, $zero, FIM1
		
		mul $t2, $s1, 4
		addi $t3, $t2, 0
		
		swc1 $f12, vet($t3)
		
		addi $t4, $t3, 4
		
		swc1 $f12, vet($t4)
		
		lwc1 $f3, vet($t3) 
		lwc1 $f4, vet($t4)
		
		add.s $f5, $f3, $f4

		
		addi $t5, $t4, 4
		
		swc1 $f5, vet($t5)

		add.s $f12, $f12, $f1
		addi $s1, $s1, 3
		j FOR1
		FIM1:

		lwc1 $f2, peso1 		# peso 1 
		lwc1 $f3, peso2 		# peso 2
		lwc1 $f4, taxaApre 		# taxa de aprendizado
		
		
		# processo de treinamento do neurônio
		lw $t2, zero,($zero)
		addi $s1, $0, 0			# i = 0;
		FOR2: SLTI $t1, $s1, 150
		BEQ $t1, $zero, FIM2
		
		# Erro INICIO
		
		mul $t2, $s1, 4
		addi $t3, $t2, 0
		
		
		lwc1 $f5, vet($t3)
		
		mul.s $f6, $f2, $f5
		
		addi $t3, $t3, 4

		lwc1 $f7, vet($t3)
		
		mul.s $f8, $f3, $f7
		
		add.s $f9, $f6, $f8
		
		addi $t3, $t3, 4
		lwc1 $f10, vet($t3)
		

		sub.s $f11, $f10, $f9 		# erro

			
		# Erro FIM

		# Atualiza peso 1 INICIO
		
		mul $t2, $s1, 4
		addi $t3, $t2, 0
		
		lwc1 $f5, vet($t3)
		
		mul.s $f6, $f5, $f4
		mul.s $f7, $f11, $f6
		add.s $f2, $f2, $f7
		
		# Atualiza peso 1 FIM
		
		# Atualiza peso 2 INICIO
		
		addi $t3, $t3, 4
		
		lwc1 $f5, vet($t3)
		
		mul.s $f6, $f5, $f4
		mul.s $f7, $f11, $f6
		add.s $f3, $f3, $f7
		
		# Atualiza peso 2 FIM
		
		addi $s1, $s1, 3
		
		j FOR2
		FIM2:
		
		# Impressão - testando o neurônio 
		add.s $f4, $f0, $f1 		# cont = 1;
		addi $s1, $0, 0			# i = 0;
		FOR3: SLTI $t1, $s1, 100
		BEQ $t1, $zero, FIM3
		
		
		mul.s $f5, $f2, $f4
		mul.s $f6, $f3, $f4
		
		add.s $f7, $f5, $f6
		
		li $v0, 2
		add.s $f12, $f0, $f4
		syscall
		
		addi $v0, $zero, 4 
		la $a0, soma
		syscall
		
		li $v0, 2
		add.s $f12, $f0, $f4 
		syscall
		
		addi $v0, $zero, 4 
		la $a0, igual
		syscall
		
		li $v0, 2
		add.s $f12, $f0, $f7 
		syscall
		
		addi $v0, $zero, 4 
		la $a0, pula
		syscall
		
		
		add.s $f4, $f4, $f1
		addi $s1, $s1, 1
		j FOR3
		FIM3:
		jr $ra
