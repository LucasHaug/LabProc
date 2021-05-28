@ Fazer o código dos seguintes loop:
@    int i = 0;
@    for (i = 0; i < s; i++) {
@         a[i] = 0;
@    }
@
@ Para rodar, fazer o seguinte:
@ gcc item-4.a.s
@ gdb a.out
@ b 25
@ b 36
@ r
@ x/10b array
@ c ou s
@ x/10b array
@ q

	.text
	.globl main
main:
    ADR r1, array @ r1 recebe o endereço na memória do array

    MOV r2, #10

    MOV r3, #0 @ i = 0
loop:
    CMP r3, r2 @ i < s ?
    BGE done @ se i ≥ s -> acaba o loop

    MOV r4, #0 @ Registrador auxiliar para zerar o array
    STRB r4, [r1, r3] @ array[i] = r4; // [r1 + r3] = r4

    ADD r3, r3, #1 @ i++
    B loop
done:
    SWI	0x123456

array:
    .byte 1, 2, 3, 4, 5, 6, 7, 8, 9, 10


