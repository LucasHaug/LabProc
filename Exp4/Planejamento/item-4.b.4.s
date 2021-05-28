@ Qual o erro da instrução
@ Para rodar, fazer o seguinte:
@ gcc item-4.b.4.s
@ gdb a.out
@ b 21
@ b 23
@ r
@ x/1 0x20
@ c
@ q

	.text
	.globl main
main:
    LDR r3, =0x4000
    LDR r6, =0x20

    LDR r5, =0xCACA
    STR r5, [r6]

    LDRSB r1, [r6], r3, LSL #4 @ Shift imediato só funciona com word e unsigned byte

	SWI	0x123456
