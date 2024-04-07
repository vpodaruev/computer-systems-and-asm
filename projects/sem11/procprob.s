	.file	"procprob.c"
	.text
	.globl	procprob
	.type	procprob, @function
procprob:
	movslq	%edi, %rdi
	addq	%rdi, (%rdx)
	addb	%sil, (%rcx)
	movl	$6, %eax
	ret
	.size	procprob, .-procprob
	.ident	"GCC: (GNU) 13.2.1 20230801"
	.section	.note.GNU-stack,"",@progbits
