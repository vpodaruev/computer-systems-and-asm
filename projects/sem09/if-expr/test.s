	.file	"test.c"
	.text
	.globl	test
	.type	test, @function
test:
	testq	%rdi, %rdi
	js	.L6
	leaq	12(%rsi), %rax
	addq	%rsi, %rdi
	cmpq	$10, %rsi
	cmovg	%rdi, %rax
	ret
.L6:
	movq	%rsi, %rax
	subq	%rdi, %rax
	movq	%rsi, %rdx
	andq	%rdi, %rdx
	cmpq	%rdi, %rsi
	cmovle	%rdx, %rax
	ret
	.size	test, .-test
	.ident	"GCC: (GNU) 13.2.1 20230801"
	.section	.note.GNU-stack,"",@progbits
