	.file	"store_uprod.c"
	.text
	.globl	store_uprod
	.type	store_uprod, @function
store_uprod:
	movq	%rsi, %rax
	mulq	%rdx
	movq	%rax, (%rdi)
	movq	%rdx, 8(%rdi)
	ret
	.size	store_uprod, .-store_uprod
	.ident	"GCC: (GNU) 13.2.1 20230801"
	.section	.note.GNU-stack,"",@progbits
