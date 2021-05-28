@ Fazer o seguinte código tendo-se um vetor de 25 posições e usando a forma pré-indexada:
@    x = array[5] + y
@
@ Para rodar, fazer o seguinte:
@ gcc item-1.b.s
@ gdb a.out
@ b 21
@ b 24
@ r
@ x/6 array
@ c ou s
@ q

	.text
	.globl main
main:
    MOV r0, #0 @ x
    MOV r1, #3 @ y
    ADR r2, array @ r2 recebe o endereço do array

	LDR r0, [r2, #20] @ r0 = array[5 * 4] // 5 * 4, pois cada palavra tem 4 bytes
    ADD r0, r0, r1 @ r0 = r0 + r1

    SWI	0x123456

array:
    .word 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0


