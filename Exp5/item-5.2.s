@ Fazer o cálculo de n fatorial
@ Para rodar, fazer o seguinte:
@ gcc item-5.2.s
@ gdb a.out
@ b 24
@ r
@ q

	.text
	.globl main
main:
    MOV r6, #10 @ Valor n

    MOV r5, r6 @ Resultado

    MOV r4, r6 @ i = n
loop:
    SUBS r4, r4, #1
    MULNE r7, r4, r5 @ r7 = r5 * (n - 1)
    MOVNE r5, r7 @ r7 = r5
    BNE loop

    @ Depois do fim do loop
    SWI	0x123456
