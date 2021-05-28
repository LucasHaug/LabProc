@ Programa para verificar a atualização das flags usando o ADD e o ADDS
@ gcc item-2-2.s
@ gdb a.out
@ b 15
@ b 18
@ r
@ s
@ q

	.text
	.globl main
main:
	MOV	r0, #15
	MOV	r1, #20
	BL	firstfunc
	MOV	r0, #0x18
	LDR	r1, =0x20026
	SWI	0x123456
firstfunc:
	ADDS	r0, r0, r1
	@ ADD	r0, r0, r1
	MOV	pc, lr
