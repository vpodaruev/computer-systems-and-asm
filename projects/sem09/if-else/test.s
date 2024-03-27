	.file	"test.c"
	.text
	.globl	test
	.type	test, @function
test:
	leaq	(%rdx,%rsi), %rax
	subq	%rdi, %rax
	cmpq	$5, %rdx
	jle	.L2
	cmpq	$2, %rsi
	jle	.L3
	movq	%rdx, %rax
	imulq	%rdi, %rax
	ret
.L3:
	movq	%rsi, %rax
	imulq	%rdi, %rax
	ret
.L2:
	cmpq	$2, %rdx
	jg	.L1
	movq	%rdx, %rax
	imulq	%rsi, %rax
.L1:
	ret
	.size	test, .-test
	.ident	"GCC: (GNU) 13.2.1 20230801"
	.section	.note.GNU-stack,"",@progbits
