@ Fazer o load de constante em endereço especifico e testar as tipos SB, SH, B.
@ Para rodar, fazer o seguinte:
@ gcc item-4.b.1.s
@ gdb a.out
@ b 18
@ b 22
@ x/1 0x24
@ r
@ s
@ q

	.text
	.globl main
main:
    LDR r7, =0x03 @ 0x06, 0x00FC, 0x03, 0x00FF
    LDR r0, =0x24
    STR r7, [r0] @ adiciona no endereco 0x24 o valor do registrador r7
	LDRSB sp, [r0] @ signed byte, sp = 0x06, sp=0xFFFFFFFC, sp=0x03, sp=0xFFFFFFFF
    LDRSH sp, [r0] @ signed halfword, sp=0x06, sp=0x00FC, sp=0x03, sp=0x00FF
    LDR sp,[r0] @ word, sp=0x06, sp=0xFC, sp=0x03, sp=0xFF
    LDRB sp,[r0] @ unsigned byte, sp=0x06, sp =0xFC, sp=0x03, sp=0xFF
	SWI	0x123456
