	.text
	.globl	is_divide
is_divide:
	movq	%rdi, %rax
	cqto
	idivq	%rsi
	testq	%rdx, %rdx
	setz	%al
	ret

