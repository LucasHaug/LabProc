@ Cálculo do valor absoluto de um número
@ Para rodar, fazer o seguinte:
@ gcc item-3.10.6.s
@ gdb a.out
@ b 16
@ r
@ q

	.text
	.globl main
main:
	LDR	r0, =0xFFFFFFF4 @ Valor inicial
	LDR	r1, =0x0 @ Resultado
	CMP r0, #0
	RSBLT r1, r0, #0
	SWI	0x123456
