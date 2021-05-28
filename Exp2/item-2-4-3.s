@ Programa para verificar o funcionamento do gdb ao mostrar o conteúdo de registradores em diferentes formatos
@ gcc item-2-4-3.s
@ gdb a.out
@ b main
@ b 22
@ p/d $r0
@ p/x $r0
@ p/o $r0
@ p/t $r0
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
	ADD	r0, r0, r1
	MOV	pc, lr
