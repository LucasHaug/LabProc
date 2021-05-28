@ Fazer o código dos seguintes loop:
@    int* p;
@    for (p = &array[0]; p < &array[s]; p++) {
@         *p = 0;
@    }
@
@ Para rodar, fazer o seguinte:
@ gcc item-4.b.s
@ gdb a.out
@ b 26
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

    MOV r2, #10 @ s = 10

    MOV r3, r1 @ r3 = r1 = &array[0], r3 = endereco para o comeco da array
    ADD r4, r3, r2 @ r4 = r3 + r2 = &array[s], r4 = endereco para o final da array
loop:
    CMP r3, r4 @ &array[0] < &array[s] ?
    BGE done @ se i ≥ s -> acaba o loop

    MOV r5, #0 @ Registrador auxiliar para zerar o array
    STRB r5, [r3], #1 @ *p = r5,  p++

    B loop
done:
    SWI	0x123456

array:
    .byte 1, 2, 3, 4, 5, 6, 7, 8, 9, 10


