	.file	"transpose.c"
	.text
	.globl	transpose
	.type	transpose, @function
transpose:
	movq	%rdi, %r8
	movq	%rdi, %r10
	movl	$0, %r9d
	jmp	.L2
.L10:
	addl	$1, %r9d
	addq	$120, %rdi
	addq	$8, %r10
	subq	$-128, %r8
.L2:
	movq	%r10, %rax
	movq	%rdi, %rdx
	testl	%r9d, %r9d
	jle	.L10
.L3:
	movq	(%rdx), %rcx
	movq	(%rax), %rsi
	movq	%rsi, (%rdx)
	movq	%rcx, (%rax)
	addq	$8, %rdx
	addq	$120, %rax
	cmpq	%r8, %rax
	jne	.L3
	addl	$1, %r9d
	addq	$120, %rdi
	addq	$8, %r10
	subq	$-128, %r8
	cmpl	$15, %r9d
	jne	.L2
	ret
	.size	transpose, .-transpose
	.ident	"GCC: (GNU) 13.2.1 20230801"
	.section	.note.GNU-stack,"",@progbits
