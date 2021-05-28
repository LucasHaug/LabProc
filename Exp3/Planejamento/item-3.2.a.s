@ Algoritmo de multiplicação por 132
@ Para rodar, fazer o seguinte:
@ gcc item-3.2.a.s
@ gdb a.out
@ b 18
@ r
@ q

	.text
	.globl main
main:
	LDR	r4, =0x3 @ Multiplicando

	@ a x 132 = a x (2^2 + 2^7)
	MOV r0, r4, LSL #2
	ADD r0, r0, r4, LSL #7

	SWI	0x123456
