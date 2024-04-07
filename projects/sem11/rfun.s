	.file	"rfun.c"
	.text
	.globl	rfun
	.type	rfun, @function
rfun:
	testq	%rdi, %rdi
	jne	.L8
	movl	$0, %eax
	ret
.L8:
	pushq	%rbx
	movq	%rdi, %rbx
	shrq	$2, %rdi
	call	rfun
	addq	%rbx, %rax
	popq	%rbx
	ret
	.size	rfun, .-rfun
	.ident	"GCC: (GNU) 13.2.1 20230801"
	.section	.note.GNU-stack,"",@progbits
