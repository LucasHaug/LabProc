@ Multiplique os registradores r7 e r12, colocando os resultados no registrador r3 somente se C clear ou Z set
@ Para rodar, fazer o seguinte:
@ gcc item-1.d.s
@ gdb a.out
@ b 19
@ r
@ q

	.text
	.globl main
main:
    MOV r3, #0
    MOV r7, #3
    MOV r12, #4
    MOV r4, #3
    CMP r4, #2 @ Para fazer C = 1 e Z = 0
    MULLS r3, r7, r12 @ r3 = r7 * r12, se C = 0 e Z = 1

    SWI	0x123456
