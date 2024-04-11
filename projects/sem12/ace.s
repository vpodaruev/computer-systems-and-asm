	.file	"ace.c"
	.text
	.globl	test
	.type	test, @function
test:
	movl	$1, %eax
	jmp	.L2
.L3:
	imulq	(%rdi), %rax
	movq	8(%rdi), %rdi
.L2:
	testq	%rdi, %rdi
	jne	.L3
	ret
	.size	test, .-test
	.ident	"GCC: (GNU) 13.2.1 20230801"
	.section	.note.GNU-stack,"",@progbits
