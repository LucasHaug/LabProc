@ Algoritmo de multiplicação por 18
@ Para rodar, fazer o seguinte:
@ gcc item-3.2.c.s
@ gdb a.out
@ b 18
@ r
@ q

	.text
	.globl main
main:
	LDR	r4, =0x3 @ Multiplicando

	@ a x 18 = a x (2^4 + 2^1)
	MOV r0, r4, LSL #1
	ADD r0, r0, r4, LSL #4

	SWI	0x123456
