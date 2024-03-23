	.file	"test.c"
	.text
	.globl	test
	.type	test, @function
test:
	testl	%edi, %edi
	setne	%al
	movzbl	%al, %eax
	ret
	.size	test, .-test
	.ident	"GCC: (GNU) 13.2.1 20230801"
	.section	.note.GNU-stack,"",@progbits
