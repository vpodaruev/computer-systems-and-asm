	.file	"arith2.c"
	.text
	.globl	arith2
	.type	arith2, @function
arith2:
	orq	%rsi, %rdi
	sarq	$3, %rdi
	notq	%rdi
	movq	%rdx, %rax
	subq	%rdi, %rax
	ret
	.size	arith2, .-arith2
	.ident	"GCC: (GNU) 13.2.1 20230801"
	.section	.note.GNU-stack,"",@progbits
