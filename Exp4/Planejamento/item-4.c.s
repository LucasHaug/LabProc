@ Fazer o código do seguinte loop:
@    for (i=0; i<8; i++) {
@         a[i] = b[7-i];
@    }
@
@ Para rodar, fazer o seguinte:
@ gcc item-4.c.s
@ gdb a.out
@ b 25
@ b 37
@ r
@ x/8 array_a
@ x/8 array_b
@ c ou s
@ x/8 array_a
@ x/8 array_b
@ q

	.text
	.globl main
main:
    ADR r0, array_a @ r0 recebe o endereço na memória de array_a
    ADR r1, array_b @ r1 recebe o endereço na memória de array_b

    MOV r2, #0 @ i = 0
loop:
    CMP r2, #8 @ i < 8 ?
    BGE done @ se i ≥ 8 -> acaba o loop

	RSB r3, r2, #7 @ r3 = 7 - r2
	LDR r4, [r1, r3, LSL #2] @ r4 = array_b[7 - i]; // r4 = [r1 + r3 * 4] // r3 * 4, pois cada palavra tem 4 bytes
    STR r4, [r0, r2, LSL #2] @ array_a[i] = r4; // [r0 + r2 * 4] = r4 // r2 * 4, pois cada palavra tem 4 bytes

    ADD r2, r2, #1 @ i++
    B loop
done:
    SWI	0x123456

array_a:
    .word 0, 0, 0, 0, 0, 0, 0, 0

array_b:
    .word 1, 2, 3, 4, 5, 6, 7, 8

