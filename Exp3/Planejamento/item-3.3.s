@ Comparacao 2 valores de 64-bits
@ Para rodar, fazer o seguinte:
@ gcc item-3.3.s
@ gdb a.out
@ b 23
@ r
@ q

	.text
	.globl main
main:
	MOV	r0, #0 @ Registrador auxiliar para ver flags específicas de comparação
	LDR	r1, =0x4 @ Valor 1 [63...32]
	LDR	r2, =0x1 @ Valor 1 [31...0]
	LDR	r3, =0x4 @ Valor 2 [63...32]
	LDR	r4, =0x2 @ Valor 1 [31...0]

	CMP r1, r3 @ Comparção do bloco mais significativo
	CMPEQ r2, r4 @ Comparção do bloco menos significativo

	MOVLE r0, #1 @ Define o registrador como 1 dependendo da comparação

	SWI	0x123456
