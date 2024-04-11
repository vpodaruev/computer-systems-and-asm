	.file	"echo.c"
	.text
	.globl	gets
	.type	gets, @function
gets:
	pushq	%rbp
	pushq	%rbx
	subq	$8, %rsp
	movq	%rdi, %rbp
	movq	%rdi, %rbx
	jmp	.L2
.L4:
	movb	%al, (%rbx)
	leaq	1(%rbx), %rbx
.L2:
	movq	stdin(%rip), %rdi
	call	getc@PLT
	cmpl	$10, %eax
	je	.L3
	cmpl	$-1, %eax
	jne	.L4
.L3:
	cmpl	$-1, %eax
	sete	%dl
	cmpq	%rbp, %rbx
	sete	%al
	testb	%al, %dl
	jne	.L6
	movb	$0, (%rbx)
	movq	%rbp, %rax
.L1:
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	ret
.L6:
	movl	$0, %eax
	jmp	.L1
	.size	gets, .-gets
	.globl	echo
	.type	echo, @function
echo:
	pushq	%rbx
	subq	$16, %rsp
	leaq	8(%rsp), %rbx
	movq	%rbx, %rdi
	call	gets
	movq	%rbx, %rdi
	call	puts@PLT
	addq	$16, %rsp
	popq	%rbx
	ret
	.size	echo, .-echo
	.ident	"GCC: (GNU) 13.2.1 20230801"
	.section	.note.GNU-stack,"",@progbits
