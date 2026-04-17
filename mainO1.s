	.file	"main.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Fib: "
.LC1:
	.string	"%d"
.LC2:
	.string	"Fib(0) = 0"
.LC3:
	.string	"Fib(1) = 1"
.LC4:
	.string	"Fib(%d) = %lld\n"
.LC6:
	.string	"Time taken: %f seconds\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
	endbr64
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$16, %rsp
	.cfi_def_cfa_offset 64
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	leaq	.LC0(%rip), %rsi
	movl	$2, %edi
	call	__printf_chk@PLT
	leaq	4(%rsp), %rsi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	call	clock@PLT
	movq	%rax, %r14
	cmpl	$0, 4(%rsp)
	js	.L3
	leaq	.LC2(%rip), %rdi
	call	puts@PLT
	cmpl	$0, 4(%rsp)
	jle	.L3
	leaq	.LC3(%rip), %rdi
	call	puts@PLT
	cmpl	$1, 4(%rsp)
	jle	.L3
	movl	$2, %ebp
	movl	$1, %ebx
	movl	$0, %eax
	leaq	.LC4(%rip), %r13
.L4:
	movq	%rbx, %r12
	addq	%rax, %rbx
	movq	%rbx, %rcx
	movl	%ebp, %edx
	movq	%r13, %rsi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	addl	$1, %ebp
	movq	%r12, %rax
	cmpl	%ebp, 4(%rsp)
	jge	.L4
.L3:
	call	clock@PLT
	subq	%r14, %rax
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	divsd	.LC5(%rip), %xmm0
	leaq	.LC6(%rip), %rsi
	movl	$2, %edi
	movl	$1, %eax
	call	__printf_chk@PLT
	movq	8(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L8
	movl	$0, %eax
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
.L8:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE23:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC5:
	.long	0
	.long	1093567616
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
