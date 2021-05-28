@ Programa para verificar os valores do registrador cpsr para soma com e sem sinal
@ gcc item-3-10-1.s
@ gdb a.out
@ b 14
@ r
@ q

	.text
	.globl main
main:
	LDR	r0, =0x67654321
	LDR	r1, =0x23110000
	BL	firstfunc
	SWI	0x123456
firstfunc:
	ADDS r0, r0, r1
	MOV	 pc, lr
