	.file	"record.c"
	.text
	.globl	compute
	.type	compute, @function
compute:
	movl	4(%rdi), %eax
	addl	(%rdi), %eax
	cltq
	leaq	8(%rdi,%rax,4), %rax
	movq	%rax, 16(%rdi)
	ret
	.size	compute, .-compute
	.ident	"GCC: (GNU) 13.2.1 20230801"
	.section	.note.GNU-stack,"",@progbits
