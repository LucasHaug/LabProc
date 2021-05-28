@ Algoritmo para encontrar os maiores números primos anteriores a um número N
@ Autor: Lucas Haug, NUSP: 10773565
@ Para rodar, fazer o seguinte:
@ gcc p1.s
@ gdb a.out
@ x/3d primos_anteriores
@ b 85
@ r
@ x/3d primos_anteriores
@ q

	.text
	.globl main
main:
    LDR r0, =10773565 @ Número N para e verificar quais primos se tem antes del
    ADR r7, primos_anteriores @ Ponteiro para o vetor de resultdos

    MOV r11, #0 @ Número de números primos encontrados

	SUB r6, r0, #1
list_of_primes_loop:
	CMP r11, #3
    BEQ done_list_of_primes
    CMP r6, #2
    BLT done_list_of_primes

	@ ==== Início do loop de verificar se um número é primo ====

    MOV r9, r6, LSR #1 @ r9 é o maior divisor possível de r6, tirando r6, que é a metade de r6
	MOV r8, #2
	MOV r10, #-1 @ Guarda o menor divisor de r6 ou -1 se for primo
is_prime_loop:
    CMP r10, #-1
    BNE done_prime
    CMP r8, r9
    BGT done_prime

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
    MOVEQ r10, r8

    ADD r8, r8, #1
    B is_prime_loop
done_prime:
	@ ==== Fim do loop de verificar se um número é primo ====

	CMP r10, #-1
    STREQ r6, [r7, r11, LSL #2]
    ADDEQ r11, r11, #1

    SUB r6, r6, #1
    B list_of_primes_loop
done_list_of_primes:
	SWI	0x123456

primos_anteriores:
    .word -1, -1, -1
