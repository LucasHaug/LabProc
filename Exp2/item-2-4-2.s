@ Programa para testar o uso do step e do next com labels no meio do programa
@ gcc item-2-4-2.s
@ gdb a.out
@ b main
@ b 19
@ r
@ s
@ q

	.text
	.globl main
main:
	MOV	r0, #15
	MOV	r1, #20
	BL	firstfunc
teste:
	MOV	r0, #0x18
	LDR	r1, =0x20026
	SWI	0x123456
firstfunc:
	ADD	r0, r0, r1
	MOV	pc, lr
