@ Programa para verificar o funcionamento de soma, atribuição e branches
@ gcc item-2-4-1.s
@ gdb a.out
@ b 15
@ b 18
@ r
@ s
@ q

	.text
	.globl main
main:
	MOV	r0, #15
	MOV	r1, #20
	BL	firstfunc
	MOV	r0, #0x18
	LDR	r1, =0x20026
	SWI	0x123456
firstfunc:
	ADD	r0, r0, r1
	MOV	pc, lr
