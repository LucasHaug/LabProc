@ Multiplique os registradores r7 e r12, colocando os resultados no registrador r3 somente se C estah setado (C = 1) e Z = 0
@ Para rodar, fazer o seguinte:
@ gcc item-1.c.s
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
    CMP r4, #4 @ Para fazer C = 0 e Z = 1
    MULHI r3, r7, r12 @ r3 = r7 * r12, se C = 1 e Z = 0

    SWI	0x123456
