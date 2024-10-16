.data
	array: .space 20
	#nNumeri: .byte 10
	
.text
.globl main
main:
	li $t0, 0 #index
	li $t1, 10 #lunghezza array
caricaVettore:
	li $v0, 5
	syscall
	
	mul $t2, $t0, 2 #t2 serve per capire di quando devo sommare all indirizzo
	
	sh $v0, array($t2)

	add $t0, $t0, 1
	bne $t1, $t0 caricaVettore
	
	move $a0, $t1
	jal scambiaNumeri
	
	li $t0, 0
stampa:
	mul $t2, $t0, 2
	lh $a0, array($t2)
	li $v0, 1
	syscall
	
	add $t0, $t0, 1
	bne $t1, $t0 stampa
	
	li $v0, 10
	syscall


scambiaNumeri:
	li $t0, 0 #index inizio
	move $t1, $a0 #lunghezza array
	li $t3, 9 #index massimo - 1
	li $a1,2
cicloSwitch:
	mul $t6, $t0, 2
	mul $t7, $t3, 2

	lh $t4, array($t6) #numeri a sinistra
	lh $t5, array($t7) #numeri a destra
	
	div $t4, $a1
	mfhi $t2
	bnez $t2, if
	
	div $t5, $a1
	mfhi $t2
	bnez $t2, if
	
	sh $t5, array($t6) #scrivo il numero a destra al posto del numero a sinistra
	sh $t4, array($t7) #scrivo il numero a sinistra al posto di quello a destra
if:
	sub $t3, $t3, 1
	add $t0, $t0, 1
	
	bgt $t3, $t0, cicloSwitch #esce se il numero a sinistra e' piu grande o uguale al numero a destra
	
	jr $ra
