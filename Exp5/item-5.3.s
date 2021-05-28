@ Achar o maximo valor de um unsigned array de 32bits
@ Para rodar, fazer o seguinte:
@ gcc item-5.3.s
@ gdb a.out
@ b 37
@ x/11d array
@ x/1d result
@ r
@ x/11d array
@ x/1d result
@ q

	.text
	.globl main
main:
    ADR r0, result @ r0 recebe o endereço na memória de 'result'
    ADR r1, array @ r1 recebe o endereço na memória de 'array'
    MOV r5, #11 @ Tamanho do array

    MOV r7, #0 @ Resultado temporário

    MOV r2, #0 @ i = 0
loop:
    CMP r2, r5 @ i < r5 ?
    BGE done @ se i ≥ r5 -> acaba o loop

	LDR r4, [r1, r2, LSL #2] @ r4 = array[r2]; // r4 = [r1 + r2 * 4]

    CMP r4, r7 @ r4 < r7 ?
    MOVGT r7, r4 @ se r4 > r7, r7 = r4

    ADD r2, r2, #1 @ i++
    B loop
done:
    STR r7, [r0] @ result = r7

    SWI	0x123456

array:
    .word 1, 2, 43, 40, 5, 76, 7, 8, 9, 10, 41

result:
    .word 0
