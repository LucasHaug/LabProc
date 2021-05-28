@ Subtração com shit para esquerda
@ Para rodar, fazer o seguinte:
@ gcc item-3.1.b.s
@ gdb a.out
@ b 13
@ r
@ q

	.text
	.globl main
main:
	SUB r11, r12, r3, LSL #32
	SWI	0x123456
