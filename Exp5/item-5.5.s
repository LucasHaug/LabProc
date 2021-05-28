@ Programa que inspeciona a paridade de um número em r0, colocando 1 em r1 se ímpar e 0 se par
@ Para rodar, fazer o seguinte:
@ gcc item-5.5.s
@ gdb a.out
@ b 33
@ r
@ p/t $r0
@ p/t $r1
@ q

	.text
	.globl main
main:
    LDR r0, =0b1100100100001 @ Entrada de numero a ser verificada
    MOV r1, #0 @ Resultado da paridade de r0, 1 se ímpar e 0 se par

    LDR r2, =0x80000000 @ Máscara para pegar bit a bit

    MOV r3, #31
loop:
    CMP r3, #0
    BLT done

    AND r4, r0, r2 @ r4 = r0 && r2

    EOR r1, r1, r4, LSR r3 @ r1 = r1 xor (r4 >> r3)

    MOV r2, r2, LSR #1 @ Rotaciona a máscara um bit para a direita

    SUB r3, r3, #1
    B loop
done:
    SWI	0x123456
