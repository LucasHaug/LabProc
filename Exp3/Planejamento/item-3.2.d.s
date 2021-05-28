@ Algoritmo de multiplicação por 16384
@ Para rodar, fazer o seguinte:
@ gcc item-3.2.d.s
@ gdb a.out
@ b 17
@ r
@ q

	.text
	.globl main
main:
	LDR	r4, =0x3 @ Multiplicando

	@ a x 16384 = a x 2^14
	MOV r0, r4, LSL #14

	SWI	0x123456
