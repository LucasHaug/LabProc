@ Calcular os 12 primeiros números da sequência de Fibonacci usando bytes
@ Para rodar, fazer o seguinte:
@ gcc item-5_byte.s
@ gdb a.out
@ b 26
@ b 41
@ r
@ x/12db array
@ c ou s
@ x/12db array
@ q

	.text
	.globl main
main:
    MOV r0, #0 @ f(0) = 0
    MOV r1, #1 @ f(1) = 1

    ADR r2, array @ r0 recebe o endereço na memória do array

    STRB r0, [r2] @ array[0] = f(0)
    STRB r1, [r2, #1] @ array[1] = f(1)

    MOV r3, #12 @ Deve-se calcular os 12 primeiros números da sequência

    MOV r4, #2 @ n = 2
loop:
    CMP r4, r3 @ n < 12 ?
    BGT done @ se n ≥ 12 -> acaba o loop

    SUB r6, r4, #2
    SUB r7, r4, #1
    LDRB r0, [r2, r6] @ r0 = f(n - 2)
    LDRB r1, [r2, r7] @ r1 = f(n - 1)
    ADD r7, r0, r1 @ r7 = f(n - 1) + f(n - 2)
    STRB r7, [r2, r4] @ array[r4] = r7

    ADD r4, r4, #1 @ n++
    B loop
done:
    SWI	0x123456

array:
    .byte 0,0,0,0,0,0,0,0,0,0,0,0



