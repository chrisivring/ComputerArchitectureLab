    addi x2,x2,1
	nop
	nop
	nop
	nop
beqloop:
    addi x1,x1,1
	nop
	nop
	nop
	nop
    beq x1,x2,beqloop
	nop
	nop
	nop
	nop

    addi x1,x1,1
	nop
	nop
	nop
	nop
bneloop:
    addi x2,x2,1
	nop
	nop
	nop
	nop
	bne x1,x2,bneloop
	nop
	nop
	nop
	nop

	addi x2,x2,-4
	nop
	nop
	nop
	nop
bltloop:
	addi x1,x1,-2
	nop
	nop
	nop
	nop
	blt x2,x1,bltloop
	nop
	nop
	nop
	nop

	addi x1,x1,2
	nop
	nop
	nop
	nop
	addi x2,x2,-1
	nop
	nop
	nop
	nop
bltuloop:
	addi x2,x2,1
	nop
	nop
	nop
	nop
	bltu x1,x2,bltuloop
	nop
	nop
	nop
	nop

	addi x1,x1,1
	nop
	nop
	nop
	nop
bgeloop:
	addi x2,x2,1
	nop
	nop
	nop
	nop
	bge x1,x2,bgeloop
	nop
	nop
	nop
	nop

	addi x2,x2,-6
	nop
	nop
	nop
	nop
bgeuloop:
	addi x2,x2,1
	nop
	nop
	nop
	nop
	bgeu x2,x1,bgeuloop
	nop
	nop
	nop
	nop

	addi x1,x1,-6
	nop
	nop
	nop
	nop
	slli x1,x1,8
	nop
	nop
	nop
	nop
	addi x1,x1,1
	nop
	nop
	nop
	nop
	slli x1,x1,7
	nop
	nop
	nop
	nop
	addi x1,x1,1
	nop
	nop
	nop
	nop

	lui x5,1
	nop
	nop
	nop
	nop
	sw x1,0(x5)
	nop
	nop
	nop
	nop
	sh x1,10(x5)
	nop
	nop
	nop
	nop
	sb x1,19(x5)
	nop
	nop
	nop
	nop

	lw x2,0(x5)
	nop
	nop
	nop
	nop
	lh x2,10(x5)
	nop
	nop
	nop
	nop
	lb x2,19(x5)
	nop
	nop
	nop
	nop
	lhu x2,0(x5)
	nop
	nop
	nop
	nop
	lbu x2,0(x5)
	nop
	nop
	nop
	nop

	xor x1,x1,x1
	nop
	nop
	nop
	nop
	jal x3,notadd
	nop
	nop
	nop
	nop
	addi x1,x1,1
	nop
	nop
	nop
	nop
notadd:
	jalr x4,x5,4
	nop
	nop
	nop
	nop


