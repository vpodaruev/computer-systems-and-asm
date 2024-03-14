	.file	"arith.c"
	.text
	.globl	arith
	.type	arith, @function
arith:
	xorq	%rsi, %rdi
	leaq	(%rdx,%rdx,2), %rax
	salq	$4, %rax
	andl	$252645135, %edi
	subq	%rdi, %rax
	ret
	.size	arith, .-arith
	.ident	"GCC: (GNU) 13.2.1 20230801"
	.section	.note.GNU-stack,"",@progbits
