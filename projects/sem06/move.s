	.file	"move.c"
	.text
	.globl	exchange
	.type	exchange, @function
exchange:
	movq	(%rdi), %rax
	movq	%rsi, (%rdi)
	ret
	.size	exchange, .-exchange
	.ident	"GCC: (GNU) 13.2.1 20230801"
	.section	.note.GNU-stack,"",@progbits
