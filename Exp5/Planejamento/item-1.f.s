@ Compare os registradores r6 e r8 somente se Z set ou N ≠ V
@ Para rodar, fazer o seguinte:
@ gcc item-1.e.s
@ gdb a.out
@ b 18
@ r
@ q

	.text
	.globl main
main:
    MOV r6, #0
    MOV r8, #3
    mov r4, #5
    CMP r4, #3 @ Para Z set ou N ≠ V
    CMPLE r6, r8 @ se Z = 1 ou N ≠ V, faz: r6 < r8 ?

    SWI	0x123456
