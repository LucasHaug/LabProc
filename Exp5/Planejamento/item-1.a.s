@ Adicione registradores r3 e r6 somente se N = 0 (N estah "clear"). Armazene o resultado no registrador r7
@ Para rodar, fazer o seguinte:
@ gcc item-1.a.s
@ gdb a.out
@ b 18
@ r
@ q

	.text
	.globl main
main:
    MOV r3, #0
    MOV r6, #3
    MOV r7, #0
    MOVS r4, #-1 @ Para fazer N = 1
    ADDPL r7, r3, r6 @ r7 = r3 + r6, se N = 0

    SWI	0x123456
