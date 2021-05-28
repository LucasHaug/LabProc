@ Calcular o n-ésimo termo da sequência de Fibonacci
@ Para rodar, fazer o seguinte:
@ gcc item-6.s
@ gdb a.out
@ b 23
@ b 36
@ r
@ c ou s
@ q

	.text
	.globl main
main:
    MOV r0, #0 @ f(n) = 0
    MOV r1, #35 @ n = 6

    MOV r2, #0 @ f(0) = 0
    MOV r3, #1 @ f(1) = 1

    CMP r1, #1
    MOVEQ r0, r3

    MOV r4, #2 @ i = 2
loop:
    CMP r4, r1 @ i < n ?
    BGT done @ se i ≥ n -> acaba o loop

    ADD r0, r2, r3 @ r0 = f(n - 1) + f(n - 2)

    MOV r2, r3 @ f(n - 2) = f(n - 1)
    MOV r3, r0 @ f(n - 1) = f(n)

    ADD r4, r4, #1 @ n++
    B loop
done:
    SWI	0x123456

