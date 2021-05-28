@ Fazer o seguinte código tendo-se um vetor de 25 posições e usando a forma pré-indexada:
@    array[10] = array[5] + y
@
@ Para rodar, fazer o seguinte:
@ gcc item-2.b.s
@ gdb a.out
@ b 21
@ b 25
@ r
@ x/6 array
@ c ou s
@ x/11 array
@ q

	.text
	.globl main
main:
    MOV r1, #3 @ y
    ADR r2, array @ r2 recebe o endereço do array

    LDR r3, [r2, #20] @ r3 = array[5 * 4] // 5 * 4, pois cada palavra tem 4 bytes
    ADD r3, r3, r1 @ r3 = r3 + r1 // r3 = array[5] + y
    STR r3, [r2, #40] @ array[10 * 4] = r3

    SWI	0x123456

array:
    .word 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0


