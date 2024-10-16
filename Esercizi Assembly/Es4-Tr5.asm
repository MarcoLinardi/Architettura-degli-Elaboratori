.data

input: .asciiz "Inserisci un numero intero: "
output: .asciiz "Il numero di bit impostati è: "

.text
.globl main

main:
	li $v0,4
	la $a0,input
	syscall
	li $v0,5
	syscall
	move $t0,$v0
	li $t1,0		#Inizializzo il contatore
	li $t2,1
	
Loop:
	and $t3,$t0,$t2
	bnez $t3, Incremento
	srl $t0,$t0,1
	bnez $t0, Loop
	j Fine
	
Incremento:
	addi $t1,$t1,1
	srl $t0,$t0,1
	j Loop
	
Fine:
	li $v0,4
	la $a0,output
	syscall
	li $v0,1
	move $a0,$t1
	syscall
	li $v0,10
	syscall
