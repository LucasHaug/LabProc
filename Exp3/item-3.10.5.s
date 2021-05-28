@ Algoritmo de multiplicação com sinal usando UMULL
@ Para rodar, fazer o seguinte:
@ gcc item-3.10.5.s
@ gdb a.out
@ b 33
@ r
@ q

	.text
	.globl main
main:
	LDR	r0, =4 @ Multiplicando
	LDR	r1, =-8 @ Multiplicador
	LDR	r3, =0x0 @ Resultado [63...32]
	LDR r4, =0x0 @ Resultado [31...0]

	LDR r5, =0 @ Registrador para verificar se um dos operandos é negativo

	CMP r0, #0
	LDRLT r5, =1 @ Se r0 < 0, r5 = 1
	RSBLT r0, r0, #0 @ gera o valor absoluto de r0

	CMP r1, #0
	EORLT r5, r5, #1 @ Se r1 < 0 r5 = 0 ou r5 = 1 dependendo do valor inicial de r5
	RSBLT r1, r1, #0 @ gera o valor absoluto de r1

	UMULL r4, r3, r0, r1

	CMP r5, #1
	RSBEQ r3, r3, #0 @ inverte o sinal de r3
	RSBEQ r4, r4, #0 @ inverte o sinal de r4

	SWI	0x123456
