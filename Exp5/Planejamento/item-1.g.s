@ Traduzir o seguinte código:
@     int foo(int x, int y) {
@         if ((x + y) >= 0)
@             return 0;
@         else
@             return 1;
@     }
@
@ Para rodar, fazer o seguinte:
@ gcc item-1.g.s
@ gdb a.out
@ b 24
@ r
@ q

	.text
	.globl main
main:
    MOV r0, #-10 @ x
    MOV r1, #0 @ y

    BL foo

    SWI	0x123456

foo:
    ADDS r0, r0, r1
    MOVPL r0, #0
    MOVMI r0, #1
    MOV pc, lr
