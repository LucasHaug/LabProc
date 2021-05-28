@ Calcular os 12 primeiros números da sequência de Fibonacci usando word
@ Para rodar, fazer o seguinte:
@ gcc item-5_word.s
@ gdb a.out
@ b 26
@ b 41
@ r
@ x/12d array
@ c ou s
@ x/12d array
@ q

	.text
	.globl main
main:
    MOV r0, #0 @ f(0) = 0
    MOV r1, #1 @ f(1) = 1

    ADR r2, array @ r0 recebe o endereço na memória de array

    STR r0, [r2] @ array[0] = f(0)
    STR r1, [r2, #4] @ array[1] = f(1)

    MOV r3, #65 @ Deve-se calcular os n primeiros números da sequência

    MOV r4, #2 @ n = 2
loop:
    CMP r4, r3 @ n < r3 ?
    BGT done @ se n ≥ r3 -> acaba o loop

    SUB r6, r4, #2
    SUB r7, r4, #1
    LDR r0, [r2, r6, LSL #2] @ r0 = f(n - 2)
    LDR r1, [r2, r7, LSL #2] @ r1 = f(n - 1)
    ADD r7, r0, r1 @ r7 = f(n - 1) + f(n - 2)
    STR r7, [r2, r4, LSL #2] @ array[r4] = r7

    ADD r4, r4, #1 @ n++
    B loop
done:
    SWI	0x123456

array:
    .word 0,0,0,0,0,0,0,0,0,0,0,0




