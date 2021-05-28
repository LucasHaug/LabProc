@ Deslocamento de um valor de 64-bits para esquerda
@ Para rodar, fazer o seguinte:
@ gcc item-3.5.s
@ gdb a.out
@ b 19
@ r
@ q

	.text
	.globl main
main:
	LDR	r0, =0x11 @ Bits mais significativos do valor para deslocar
	LDR	r1, =0x80000004 @ Bits menos significativos do valor para deslocar

	MOVS r0, r0, LSL #1
	MOVS r1, r1, LSL #1
	ADDCS r0, r0, #1 @ Soma 1 no bit menos significativo de r0 se houver carry out

	SWI	0x123456
