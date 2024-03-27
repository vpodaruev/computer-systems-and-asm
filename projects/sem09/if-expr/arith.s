	.file	"arith.c"
	.text
	.globl	arith
	.type	arith, @function
arith:
	leaq	7(%rdi), %rax
	testq	%rdi, %rdi
	cmovns	%rdi, %rax
	sarq	$3, %rax
	ret
	.size	arith, .-arith
	.ident	"GCC: (GNU) 13.2.1 20230801"
	.section	.note.GNU-stack,"",@progbits
