@ Programa para realizar um swap entre dois registradores
@ gcc item-3-10-4.s
@ gdb a.out
@ b 14
@ b 15
@ r
@ q

	.text
	.globl main
main:
	LDR	r0, =0xF631024C
	LDR	r1, =0x17539ABD
	BL	firstfunc
	SWI	0x123456
firstfunc:
    EOR r0, r0, r1
    EOR r1, r0, r1
    EOR r0, r0, r1
	MOV	 pc, lr
