@ Algoritmo de multiplicação por 255
@ Para rodar, fazer o seguinte:
@ gcc item-3.2.b.s
@ gdb a.out
@ b 16
@ r
@ q

	.text
	.globl main
main:
	LDR	r4, =0x3 @ Multiplicando

	@ a x 255 = a x 2^8
	RSB r0, r4, r4, LSL #8

	SWI	0x123456
