	.file	"loop_do_while.c"
	.text
	.globl	loop_do_while
	.type	loop_do_while, @function
loop_do_while:
	movq	%rdi, %rax
	movq	%rdi, %rcx
	imulq	%rdi, %rcx
	leaq	0(,%rdi,4), %rdx
.L2:
	leaq	5(%rcx,%rax), %rax
	subq	$2, %rdx
	testq	%rdx, %rdx
	jg	.L2
	ret
	.size	loop_do_while, .-loop_do_while
	.ident	"GCC: (GNU) 13.2.1 20230801"
	.section	.note.GNU-stack,"",@progbits
