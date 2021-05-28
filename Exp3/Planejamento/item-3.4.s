@ Deslocamento de um valor de 64-bits para direita
@ Para rodar, fazer o seguinte:
@ gcc item-3.4.s
@ gdb a.out
@ b 19
@ r
@ q

	.text
	.globl main
main:
	LDR	r0, =0x11 @ Bits mais significativos do valor para deslocar
	LDR	r1, =0x4 @ Bits menos significativos do valor para deslocar

	MOVS r1, r1, LSR #1
	MOVS r0, r0, LSR #1
	ADDCS r1, r1, #0x80000000 @ Soma 1 no bit mais significativo de r1 se houver carry out

	SWI	0x123456
