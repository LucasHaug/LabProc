@ Programa para realizar a multiplicação por 32
@ gcc item-3-10-3.s
@ gdb a.out
@ b 13
@ r
@ q

	.text
	.globl main
main:
	LDR	r0, =0x3
	BL	mult_by_32
	SWI	0x123456
mult_by_32:
	MOV r1, r0, LSL #5
	MOV	 pc, lr
