	.file	"st_init.c"
	.text
	.globl	st_init
	.type	st_init, @function
st_init:
	movl	8(%rdi), %eax
	movl	%eax, 12(%rdi)
	leaq	12(%rdi), %rax
	movq	%rax, (%rdi)
	movq	%rdi, 16(%rdi)
	ret
	.size	st_init, .-st_init
	.ident	"GCC: (GNU) 13.2.1 20230801"
	.section	.note.GNU-stack,"",@progbits
