	.file	"switcher.c"
	.text
	.globl	switcher
	.type	switcher, @function
switcher:
	cmpq	$7, %rdi
	ja	.L2
	jmp	*.L4(,%rdi,8)
	.section	.rodata
	.align 8
	.align 4
.L4:
	.quad	.L7
	.quad	.L2
	.quad	.L3
	.quad	.L2
	.quad	.L6
	.quad	.L5
	.quad	.L2
	.quad	.L3
	.text
.L6:
	movq	%rdi, %rsi
	jmp	.L2
.L5:
	movq	%rsi, %rdx
	xorq	$15, %rdx
.L7:
	leaq	112(%rdx), %rsi
.L2:
	movq	%rsi, (%rcx)
	ret
.L3:
	addq	%rdx, %rsi
	salq	$2, %rsi
	jmp	.L2
	.size	switcher, .-switcher
	.ident	"GCC: (GNU) 13.2.1 20230801"
	.section	.note.GNU-stack,"",@progbits
