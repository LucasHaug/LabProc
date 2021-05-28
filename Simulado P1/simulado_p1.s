@ Algoritmo de divisão binária com subtração e deslocamento para identificar os 3 maiores divisores de um número
@ Autor: Lucas Haug, NUSP: 10773565
@ Para rodar, fazer o seguinte:
@ gcc simulado_p1.s
@ gdb a.out
@ x/3d results
@ b 66
@ r
@ x/3d results
@ q

	.text
	.globl main
main:
    LDR r6, =50 @ Número para verificar os divisores
    ADR r7, results @ Ponteiro para o vetor de resultdos

    MOV r10, #0 @ Número de divisores encontrados

    MOV r8, r6, LSR #1 @ r8 é o maior divisor possível de r6, tirando r6, que é a metade de r6
divisors_loop:
    CMP r10, #3
    BEQ done
    CMP r8, #2
    BLT done

	MOV	r1, r6 @ Dividendo
	MOV	r2, r8 @ Divisor
	MOV	r3, #0 @ Quociente
	MOV	r5, #0 @ Resto

    @ ==== Início do loop da divisão ====

	MOV r4, r2

	@ Alinhamento do divisor com o dividendo
	CLZ r12, r1
	CLZ r13, r2
	SUBS r12, r13, r12
	MOVPL r2, r2, LSL r12 @ Dá o shift se a subtração resultou num valor positivo

	@ Loop que realiza a divisao desejada
	B div_condition
div_loop:
	MOV r3, r3, LSL #1
	CMP r1, r2
	SUBGE r1, r1, r2 @ Subtração do dividendo, r1 = r1 - r2
	ADDGE r3, r3, #1 @ Adição do quociente, r3 = r3 + 1
	MOV r2, r2, LSR #1 @ Deslocamento do dividendo para a direita
div_condition:
	CMP r2, r4
	BGE div_loop

	MOV r5, r1 @ Guarda o valor do resto

    @ ==== Fim do loop da divisão ====

    @ Guarda o valor do divisor atual se o resto for zero
    CMP r5, #0
    STREQ r8, [r7, r10, LSL #2]
    ADDEQ r10, r10, #1

    SUB r8, r8, #1
    B divisors_loop
done:
	SWI	0x123456

results:
    .word -1, -1, -1
