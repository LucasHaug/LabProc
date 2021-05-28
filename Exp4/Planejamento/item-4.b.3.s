@ Ver o endereço efetivo de cada instrução
@ Para rodar, fazer o seguinte:
@ gcc item-4.b.3.s
@ gdb a.out
@ b 30
@ b 35
@ r
@ x/1 0x4000
@ x/1 0x4100
@ s
@ x/1 0x4020
@ s
@ s
@ q

	.text
	.globl main
main:
    LDR r3, =0x4000
    LDR r4, =0x20
    LDR r9, =0xFA

    LDR r5, =0xEAE
    LDR r0, =0x4100
    STR r5, [r0]

    LDR r10, =0xCACA
    STR r10, [r3]

    STRB r9, [r3, r4]         @ [[r3] + [r4] = 0x4020] = r9, r3 = 0x4000
    LDRB r8, [r3, r4, LSL #3] @ r8 = [[r3] + [r4 * 8] = 0x4100], r3 = 0x4000
    LDR  r7, [r3], r4         @ r7 = [0x4000], r3 = [0x4020]
    STRB r6, [r3], r4, ASR #2 @ [0x4020] = r6, r3 = r3 + r4/4 = 0x4028

	SWI	0x123456







