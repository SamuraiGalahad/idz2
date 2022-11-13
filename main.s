	.file	"main.c"
# GNU C17 (Ubuntu 11.2.0-19ubuntu1) version 11.2.0 (x86_64-linux-gnu)
#	compiled by GNU C version 11.2.0, GMP version 6.2.1, MPFR version 4.1.0, MPC version 1.2.1, isl version isl-0.24-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -mtune=generic -march=x86-64 -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection
	.text
	.globl	mygetch
	.type	mygetch, @function
mygetch:
.LFB0:
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$160, %rsp	#,
# ./main.c:5: int mygetch( ) {
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp96
	movq	%rax, -8(%rbp)	# tmp96, D.3054
	xorl	%eax, %eax	# tmp96
# ./main.c:9:     tcgetattr( STDIN_FILENO, &oldt );
	leaq	-144(%rbp), %rax	#, tmp86
	movq	%rax, %rsi	# tmp86,
	movl	$0, %edi	#,
	call	tcgetattr@PLT	#
# ./main.c:10:     newt = oldt;
	movq	-144(%rbp), %rax	# oldt, tmp87
	movq	-136(%rbp), %rdx	# oldt,
	movq	%rax, -80(%rbp)	# tmp87, newt
	movq	%rdx, -72(%rbp)	#, newt
	movq	-128(%rbp), %rax	# oldt, tmp88
	movq	-120(%rbp), %rdx	# oldt,
	movq	%rax, -64(%rbp)	# tmp88, newt
	movq	%rdx, -56(%rbp)	#, newt
	movq	-112(%rbp), %rax	# oldt, tmp89
	movq	-104(%rbp), %rdx	# oldt,
	movq	%rax, -48(%rbp)	# tmp89, newt
	movq	%rdx, -40(%rbp)	#, newt
	movq	-96(%rbp), %rax	# oldt, tmp90
	movq	%rax, -32(%rbp)	# tmp90, newt
	movl	-88(%rbp), %eax	# oldt, tmp91
	movl	%eax, -24(%rbp)	# tmp91, newt
# ./main.c:11:     newt.c_lflag &= ~( ICANON | ECHO );
	movl	-68(%rbp), %eax	# newt.c_lflag, _1
	andl	$-11, %eax	#, _2
	movl	%eax, -68(%rbp)	# _2, newt.c_lflag
# ./main.c:12:     tcsetattr( STDIN_FILENO, TCSANOW, &newt );
	leaq	-80(%rbp), %rax	#, tmp92
	movq	%rax, %rdx	# tmp92,
	movl	$0, %esi	#,
	movl	$0, %edi	#,
	call	tcsetattr@PLT	#
# ./main.c:13:     ch = getchar();
	call	getchar@PLT	#
	movl	%eax, -148(%rbp)	# tmp93, ch
# ./main.c:14:     tcsetattr( STDIN_FILENO, TCSANOW, &oldt );
	leaq	-144(%rbp), %rax	#, tmp94
	movq	%rax, %rdx	# tmp94,
	movl	$0, %esi	#,
	movl	$0, %edi	#,
	call	tcsetattr@PLT	#
# ./main.c:15:     return ch;
	movl	-148(%rbp), %eax	# ch, _11
# ./main.c:16: }
	movq	-8(%rbp), %rdx	# D.3054, tmp97
	subq	%fs:40, %rdx	# MEM[(<address-space-1> long unsigned int *)40B], tmp97
	je	.L3	#,
	call	__stack_chk_fail@PLT	#
.L3:
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE0:
	.size	mygetch, .-mygetch
	.globl	get_string
	.type	get_string, @function
get_string:
.LFB1:
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movq	%rdi, -24(%rbp)	# str, str
# ./main.c:19:     int i = 0;
	movl	$0, -8(%rbp)	#, i
.L5:
# ./main.c:22:             ch = mygetch();
	movl	$0, %eax	#,
	call	mygetch	#
	movl	%eax, -4(%rbp)	# tmp93, ch
# ./main.c:24:             putc(ch, stdout);    // echo out
	movq	stdout(%rip), %rdx	# stdout, stdout.0_1
	movl	-4(%rbp), %eax	# ch, tmp94
	movq	%rdx, %rsi	# stdout.0_1,
	movl	%eax, %edi	# tmp94,
	call	putc@PLT	#
# ./main.c:25:             str[i++] = ch;
	movl	-8(%rbp), %eax	# i, i.1_2
	leal	1(%rax), %edx	#, tmp95
	movl	%edx, -8(%rbp)	# tmp95, i
	movslq	%eax, %rdx	# i.1_2, _3
# ./main.c:25:             str[i++] = ch;
	movq	-24(%rbp), %rax	# str, tmp96
	addq	%rdx, %rax	# _3, _4
# ./main.c:25:             str[i++] = ch;
	movl	-4(%rbp), %edx	# ch, tmp97
	movb	%dl, (%rax)	# _5, *_4
# ./main.c:26:         } while(ch != 4);   // break then Ctrl+D
	cmpl	$4, -4(%rbp)	#, ch
	jne	.L5	#,
# ./main.c:27:     str[i] = '\0';
	movl	-8(%rbp), %eax	# i, tmp98
	movslq	%eax, %rdx	# tmp98, _6
	movq	-24(%rbp), %rax	# str, tmp99
	addq	%rdx, %rax	# _6, _7
# ./main.c:27:     str[i] = '\0';
	movb	$0, (%rax)	#, *_7
# ./main.c:28:     return &str[i+1]; // Первый свободный байт
	movl	-8(%rbp), %eax	# i, tmp100
	cltq
	leaq	1(%rax), %rdx	#, _9
# ./main.c:28:     return &str[i+1]; // Первый свободный байт
	movq	-24(%rbp), %rax	# str, tmp101
	addq	%rdx, %rax	# _9, _21
# ./main.c:29: }
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE1:
	.size	get_string, .-get_string
	.section	.rodata
.LC0:
	.string	"\nmax: %c\n"
.LC1:
	.string	"\nmin: %c\n"
	.text
	.globl	get_chars
	.type	get_chars, @function
get_chars:
.LFB2:
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$48, %rsp	#,
	movq	%rdi, -40(%rbp)	# str, str
# ./main.c:32:     int i = 0;
	movl	$0, -16(%rbp)	#, i
# ./main.c:34:     int min_int = 130;
	movl	$130, -12(%rbp)	#, min_int
# ./main.c:36:     int max_int = -1;
	movl	$-1, -8(%rbp)	#, max_int
# ./main.c:38:     while (str[i] != '\0') {
	jmp	.L8	#
.L11:
# ./main.c:39:         code = (int)str[i];
	movl	-16(%rbp), %eax	# i, tmp94
	movslq	%eax, %rdx	# tmp94, _1
	movq	-40(%rbp), %rax	# str, tmp95
	addq	%rdx, %rax	# _1, _2
	movzbl	(%rax), %eax	# *_2, _3
# ./main.c:39:         code = (int)str[i];
	movsbl	%al, %eax	# _3, tmp96
	movl	%eax, -4(%rbp)	# tmp96, code
# ./main.c:40:         if (code < min_int && code != 4) {
	movl	-4(%rbp), %eax	# code, tmp97
	cmpl	-12(%rbp), %eax	# min_int, tmp97
	jge	.L9	#,
# ./main.c:40:         if (code < min_int && code != 4) {
	cmpl	$4, -4(%rbp)	#, code
	je	.L9	#,
# ./main.c:41:             min = str[i];
	movl	-16(%rbp), %eax	# i, tmp98
	movslq	%eax, %rdx	# tmp98, _4
	movq	-40(%rbp), %rax	# str, tmp99
	addq	%rdx, %rax	# _4, _5
# ./main.c:41:             min = str[i];
	movzbl	(%rax), %eax	# *_5, tmp100
	movb	%al, -18(%rbp)	# tmp100, min
# ./main.c:42:             min_int = code;
	movl	-4(%rbp), %eax	# code, tmp101
	movl	%eax, -12(%rbp)	# tmp101, min_int
.L9:
# ./main.c:44:         if (code > max_int && code != 4) {
	movl	-4(%rbp), %eax	# code, tmp102
	cmpl	-8(%rbp), %eax	# max_int, tmp102
	jle	.L10	#,
# ./main.c:44:         if (code > max_int && code != 4) {
	cmpl	$4, -4(%rbp)	#, code
	je	.L10	#,
# ./main.c:45:             max = str[i];
	movl	-16(%rbp), %eax	# i, tmp103
	movslq	%eax, %rdx	# tmp103, _6
	movq	-40(%rbp), %rax	# str, tmp104
	addq	%rdx, %rax	# _6, _7
# ./main.c:45:             max = str[i];
	movzbl	(%rax), %eax	# *_7, tmp105
	movb	%al, -17(%rbp)	# tmp105, max
# ./main.c:46:             max_int = code;
	movl	-4(%rbp), %eax	# code, tmp106
	movl	%eax, -8(%rbp)	# tmp106, max_int
.L10:
# ./main.c:48:         i++;
	addl	$1, -16(%rbp)	#, i
.L8:
# ./main.c:38:     while (str[i] != '\0') {
	movl	-16(%rbp), %eax	# i, tmp107
	movslq	%eax, %rdx	# tmp107, _8
	movq	-40(%rbp), %rax	# str, tmp108
	addq	%rdx, %rax	# _8, _9
	movzbl	(%rax), %eax	# *_9, _10
# ./main.c:38:     while (str[i] != '\0') {
	testb	%al, %al	# _10
	jne	.L11	#,
# ./main.c:50:     printf("\nmax: %c\n", max);
	movsbl	-17(%rbp), %eax	# max, _11
	movl	%eax, %esi	# _11,
	leaq	.LC0(%rip), %rax	#, tmp109
	movq	%rax, %rdi	# tmp109,
	movl	$0, %eax	#,
	call	printf@PLT	#
# ./main.c:51:     printf("\nmin: %c\n", min);
	movsbl	-18(%rbp), %eax	# min, _12
	movl	%eax, %esi	# _12,
	leaq	.LC1(%rip), %rax	#, tmp110
	movq	%rax, %rdi	# tmp110,
	movl	$0, %eax	#,
	call	printf@PLT	#
# ./main.c:52: }
	nop	
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE2:
	.size	get_chars, .-get_chars
	.section	.rodata
.LC2:
	.string	"\nstr1? "
	.text
	.globl	main
	.type	main, @function
main:
.LFB3:
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$4096, %rsp	#,
	orq	$0, (%rsp)	#,
	subq	$4096, %rsp	#,
	orq	$0, (%rsp)	#,
	subq	$1840, %rsp	#,
# ./main.c:54: int main() {
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp89
	movq	%rax, -8(%rbp)	# tmp89, D.3058
	xorl	%eax, %eax	# tmp89
# ./main.c:56:     char* str1 = str;
	leaq	-10016(%rbp), %rax	#, tmp84
	movq	%rax, -10024(%rbp)	# tmp84, str1
# ./main.c:57:     puts("\nstr1? ");
	leaq	.LC2(%rip), %rax	#, tmp85
	movq	%rax, %rdi	# tmp85,
	call	puts@PLT	#
# ./main.c:58:     get_string(str1);
	movq	-10024(%rbp), %rax	# str1, tmp86
	movq	%rax, %rdi	# tmp86,
	call	get_string	#
# ./main.c:59:     get_chars(str1);
	movq	-10024(%rbp), %rax	# str1, tmp87
	movq	%rax, %rdi	# tmp87,
	call	get_chars	#
# ./main.c:60:     return 0;
	movl	$0, %eax	#, _6
# ./main.c:61: }
	movq	-8(%rbp), %rdx	# D.3058, tmp90
	subq	%fs:40, %rdx	# MEM[(<address-space-1> long unsigned int *)40B], tmp90
	je	.L14	#,
	call	__stack_chk_fail@PLT	#
.L14:
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.2.0-19ubuntu1) 11.2.0"
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
