@ Adição com imediato
@ Para rodar, fazer o seguinte:
@ gcc item-3.1.a.s
@ gdb a.out
@ b 13
@ r
@ q

	.text
	.globl main
main:
	ADDS r3, r7, #0x1F5
	SWI	0x123456
