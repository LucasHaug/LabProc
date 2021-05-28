@ Fazer o código do seguinte loop:
@    for (i=0; i <= 10; i++) {
@         a[i] = b[i] + c;
@    }
@
@ Para rodar, fazer o seguinte:
@ gcc item-3.s
@ gdb a.out
@ b 27
@ b 39
@ r
@ x/11d array_a
@ x/11d array_b
@ c ou s
@ x/11d array_a
@ x/11d array_b
@ q

	.text
	.globl main
main:
    ADR r1, array_a @ r1 recebe o endereço na memória de array_a
    ADR r2, array_b @ r2 recebe o endereço na memória de array_b

    MOV r4, #5 @ c = 5

    MOV r3, #0 @ i = 0
loop:
    CMP r3, #10 @ i <= 10 ?
    BGT done @ se i ≥ 10 -> acaba o loop

	LDR r5, [r2, r3, LSL #2] @ r5 = array_b[i]; // r5 = [r2 + r3 * 4] // r3 * 4, pois cada palavra tem 4 bytes
    ADD r5, r5, r4 @ r5 = r5 + r4
    STR r5, [r1, r3, LSL #2] @ array_a[i] = r5; // [r1 + r3 * 4] = r5 // r3 * 4, pois cada palavra tem 4 bytes

    ADD r3, r3, #1 @ i++
    B loop
done:
    SWI	0x123456

array_a:
    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

array_b:
    .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11


