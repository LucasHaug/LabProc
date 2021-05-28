@ Algoritmo de divisão binária com subtração e deslocamento
@ Para rodar, fazer o seguinte:
@ gcc item-3.10.7.s
@ gdb a.out
@ b 38
@ r
@ q

	.text
	.globl main
main:
	LDR	r1, =10773565 @ Dividendo
	LDR	r2, =1000 @ Divisor
	LDR	r3, =0x0 @ Quociente
	LDR	r5, =0x0 @ Resto

	MOV r4, r2

	@ Alinhamento do divisor com o dividendo
	CLZ r12, r1
	CLZ r13, r2
	SUBS r12, r13, r12
	MOVPL r2, r2, LSL r12 @ Dá o shift se a subtração resultou num valor positivo

	@ Loop que realiza a divisao desejada
	B div_condition
div_loop:
	MOV r3, r3, LSL #1
	CMP r1, r2
	SUBGE r1, r1, r2 @ Subtração do dividendo, r1 = r1 - r2
	ADDGE r3, r3, #1 @ Adição do quociente, r3 = r3 + 1
	MOV r2, r2, LSR #1 @ Deslocamento do dividendo para a direita
div_condition:
	CMP r2, r4
	BGE div_loop

	MOV r5, r1 @ Guarda o valor do resto
	SWI	0x123456
