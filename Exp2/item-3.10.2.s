@ Programa para verificar o funcionamento  da multiplicação longa com e sem sinal
@ gcc item-3-10-2.s
@ gdb a.out
@ b 14
@ r
@ q

	.text
	.globl main
main:
	LDR	r0, =0xFFFFFFFF
	LDR	r1, =0x80000000
	BL	firstfunc
	SWI	0x123456
firstfunc:
    UMULL r2, r3, r0, r1
    #SMULL r2, r3, r0, r1
	MOV	 pc, lr
