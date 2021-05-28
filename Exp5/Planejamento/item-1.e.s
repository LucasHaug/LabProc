@ Compare os registradores r6 e r8 somente se Z estah zerado
@ Para rodar, fazer o seguinte:
@ gcc item-1.e.s
@ gdb a.out
@ b 17
@ r
@ q

	.text
	.globl main
main:
    MOV r6, #0
    MOV r8, #3
    MOVS r4, #0 @ Para fazer Z = 1
    CMPNE r6, r8 @ se Z = 0, faz: r6 < r8 ?

    SWI	0x123456
