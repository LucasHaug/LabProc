@ Programa que reconhece uma sequência de bits Y na entrada X, colocando Z em 1 quando corresponder
@ Para rodar, fazer o seguinte:
@ gcc item-5.4.s
@ gdb a.out
@ b 36
@ r
@ q

	.text
	.globl main
main:
    LDR r1, =0x5555AAAA @ Entrada X
    MOV r2, #0 @ Saída Z
    LDR r8, =0b101 @ Sequência Y
    MOV r9, #3 @ Tamanho da sequência Y

    RSB r3, r9, #32 @ r3 -> máximo que se pode shiftar
    MOV r4, #0
loop:
    CMP r4, r3
    BGT done

    MOV r6, r1, LSL r4 @ Corta os bits que não vão ser comparados da esquerda
    MOV r6, r6, LSR r3 @ Corta os bits que não vão ser comparados da direita

    CMP r6, r8
    MOVEQ r7, #1 @ r2 = 1, se r6 == r8
    MOVNE r7, #0 @ r2 = 0, se r6 != r8

    @ Guarda o resultado atual da saída em r2
    MOV r2, r2, LSL #1 @ r2 = r2 << 1
    ADD r2, r2, r7 @ r2 = r2 + r7

    ADD r4, r4, #1
    B loop
done:
    SWI	0x123456
