	.file	"main.c"
	.intel_syntax noprefix
# GNU C17 (Ubuntu 11.2.0-19ubuntu1) version 11.2.0 (x86_64-linux-gnu)
#	compiled by GNU C version 11.2.0, GMP version 6.2.1, MPFR version 4.1.0, MPC version 1.2.1, isl version isl-0.24-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -masm=intel -mtune=generic -march=x86-64 -O0 -fno-asynchronous-unwind-tables -fcf-protection=none -fstack-protector-strong -fstack-clash-protection
	.text
	.globl	mygetch
	.type	mygetch, @function
mygetch:
	push	rbp	#
	mov	rbp, rsp	#,
	sub	rsp, 160	#,
# ./main.c:5: int mygetch( ) {
	mov	rax, QWORD PTR fs:40	# tmp96, MEM[(<address-space-1> long unsigned int *)40B]
	mov	QWORD PTR -8[rbp], rax	# D.3054, tmp96
	xor	eax, eax	# tmp96
# ./main.c:9:     tcgetattr( STDIN_FILENO, &oldt );
	lea	rax, -144[rbp]	# tmp86,
	mov	rsi, rax	#, tmp86
	mov	edi, 0	#,
	call	tcgetattr@PLT	#
# ./main.c:10:     newt = oldt;
	mov	rax, QWORD PTR -144[rbp]	# tmp87, oldt
	mov	rdx, QWORD PTR -136[rbp]	#, oldt
	mov	QWORD PTR -80[rbp], rax	# newt, tmp87
	mov	QWORD PTR -72[rbp], rdx	# newt,
	mov	rax, QWORD PTR -128[rbp]	# tmp88, oldt
	mov	rdx, QWORD PTR -120[rbp]	#, oldt
	mov	QWORD PTR -64[rbp], rax	# newt, tmp88
	mov	QWORD PTR -56[rbp], rdx	# newt,
	mov	rax, QWORD PTR -112[rbp]	# tmp89, oldt
	mov	rdx, QWORD PTR -104[rbp]	#, oldt
	mov	QWORD PTR -48[rbp], rax	# newt, tmp89
	mov	QWORD PTR -40[rbp], rdx	# newt,
	mov	rax, QWORD PTR -96[rbp]	# tmp90, oldt
	mov	QWORD PTR -32[rbp], rax	# newt, tmp90
	mov	eax, DWORD PTR -88[rbp]	# tmp91, oldt
	mov	DWORD PTR -24[rbp], eax	# newt, tmp91
# ./main.c:11:     newt.c_lflag &= ~( ICANON | ECHO );
	mov	eax, DWORD PTR -68[rbp]	# _1, newt.c_lflag
	and	eax, -11	# _2,
	mov	DWORD PTR -68[rbp], eax	# newt.c_lflag, _2
# ./main.c:12:     tcsetattr( STDIN_FILENO, TCSANOW, &newt );
	lea	rax, -80[rbp]	# tmp92,
	mov	rdx, rax	#, tmp92
	mov	esi, 0	#,
	mov	edi, 0	#,
	call	tcsetattr@PLT	#
# ./main.c:13:     ch = getchar();
	call	getchar@PLT	#
	mov	DWORD PTR -148[rbp], eax	# ch, tmp93
# ./main.c:14:     tcsetattr( STDIN_FILENO, TCSANOW, &oldt );
	lea	rax, -144[rbp]	# tmp94,
	mov	rdx, rax	#, tmp94
	mov	esi, 0	#,
	mov	edi, 0	#,
	call	tcsetattr@PLT	#
# ./main.c:15:     return ch;
	mov	eax, DWORD PTR -148[rbp]	# _11, ch
# ./main.c:16: }
	mov	rdx, QWORD PTR -8[rbp]	# tmp97, D.3054
	sub	rdx, QWORD PTR fs:40	# tmp97, MEM[(<address-space-1> long unsigned int *)40B]
	je	.L3	#,
	call	__stack_chk_fail@PLT	#
.L3:
	leave	
	ret	
	.size	mygetch, .-mygetch
	.globl	get_string
	.type	get_string, @function
get_string:
	push	rbp	#
	mov	rbp, rsp	#,
	sub	rsp, 32	#,
	mov	QWORD PTR -24[rbp], rdi	# str, str
# ./main.c:19:     int i = 0;
	mov	r12d, 0	# i,
.L5:
# ./main.c:22:             ch = mygetch();
	mov	eax, 0	#,
	call	mygetch	#
	mov	DWORD PTR -4[rbp], eax	# ch, tmp93
# ./main.c:24:             putc(ch, stdout);    // echo out
	mov	rdx, QWORD PTR stdout[rip]	# stdout.0_1, stdout
	mov	eax, DWORD PTR -4[rbp]	# tmp94, ch
	mov	rsi, rdx	#, stdout.0_1
	mov	edi, eax	#, tmp94
	call	putc@PLT	#
# ./main.c:25:             str[i++] = ch;
	mov	eax, r12d	# i.1_2, i
	lea	edx, 1[rax]	# tmp95,
	mov	r12d, edx	# i, tmp95
	movsx	rdx, eax	# _3, i.1_2
# ./main.c:25:             str[i++] = ch;
	mov	rax, QWORD PTR -24[rbp]	# tmp96, str
	add	rax, rdx	# _4, _3
# ./main.c:25:             str[i++] = ch;
	mov	edx, DWORD PTR -4[rbp]	# tmp97, ch
	mov	BYTE PTR [rax], dl	# *_4, _5
# ./main.c:26:         } while(ch != 4);   // break then Ctrl+D
	cmp	DWORD PTR -4[rbp], 4	# ch,
	jne	.L5	#,
# ./main.c:27:     str[i] = '\0';
	mov	eax, r12d	# tmp98, i
	movsx	rdx, eax	# _6, tmp98
	mov	rax, QWORD PTR -24[rbp]	# tmp99, str
	add	rax, rdx	# _7, _6
# ./main.c:27:     str[i] = '\0';
	mov	BYTE PTR [rax], 0	# *_7,
# ./main.c:28:     return &str[i+1]; // Первый свободный байт
	mov	eax, r12d	# tmp100, i
	cdqe
	lea	rdx, 1[rax]	# _9,
# ./main.c:28:     return &str[i+1]; // Первый свободный байт
	mov	rax, QWORD PTR -24[rbp]	# tmp101, str
	add	rax, rdx	# _21, _9
# ./main.c:29: }
	leave	
	ret	
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
	push	rbp	#
	mov	rbp, rsp	#,
	sub	rsp, 48	#,
	mov	QWORD PTR -40[rbp], rdi	# str, str
# ./main.c:32:     int i = 0;
	mov	r13d, 0	# i,
# ./main.c:34:     int min_int = 130;
	mov	DWORD PTR -12[rbp], 130	# min_int,
# ./main.c:36:     int max_int = -1;
	mov	r12d, -1	# max_int,
# ./main.c:38:     while (str[i] != '\0') {
	jmp	.L8	#
.L11:
# ./main.c:39:         code = (int)str[i];
	mov	eax, r13d	# tmp94, i
	movsx	rdx, eax	# _1, tmp94
	mov	rax, QWORD PTR -40[rbp]	# tmp95, str
	add	rax, rdx	# _2, _1
	movzx	eax, BYTE PTR [rax]	# _3, *_2
# ./main.c:39:         code = (int)str[i];
	movsx	eax, al	# tmp96, _3
	mov	DWORD PTR -4[rbp], eax	# code, tmp96
# ./main.c:40:         if (code < min_int && code != 4) {
	mov	eax, DWORD PTR -4[rbp]	# tmp97, code
	cmp	eax, DWORD PTR -12[rbp]	# tmp97, min_int
	jge	.L9	#,
# ./main.c:40:         if (code < min_int && code != 4) {
	cmp	DWORD PTR -4[rbp], 4	# code,
	je	.L9	#,
# ./main.c:41:             min = str[i];
	mov	eax, r13d	# tmp98, i
	movsx	rdx, eax	# _4, tmp98
	mov	rax, QWORD PTR -40[rbp]	# tmp99, str
	add	rax, rdx	# _5, _4
# ./main.c:41:             min = str[i];
	movzx	eax, BYTE PTR [rax]	# tmp100, *_5
	mov	BYTE PTR -18[rbp], al	# min, tmp100
# ./main.c:42:             min_int = code;
	mov	eax, DWORD PTR -4[rbp]	# tmp101, code
	mov	DWORD PTR -12[rbp], eax	# min_int, tmp101
.L9:
# ./main.c:44:         if (code > max_int && code != 4) {
	mov	eax, DWORD PTR -4[rbp]	# tmp102, code
	cmp	eax, r12d	# tmp102, max_int
	jle	.L10	#,
# ./main.c:44:         if (code > max_int && code != 4) {
	cmp	DWORD PTR -4[rbp], 4	# code,
	je	.L10	#,
# ./main.c:45:             max = str[i];
	mov	eax, r13d	# tmp103, i
	movsx	rdx, eax	# _6, tmp103
	mov	rax, QWORD PTR -40[rbp]	# tmp104, str
	add	rax, rdx	# _7, _6
# ./main.c:45:             max = str[i];
	movzx	eax, BYTE PTR [rax]	# tmp105, *_7
	mov	BYTE PTR -17[rbp], al	# max, tmp105
# ./main.c:46:             max_int = code;
	mov	eax, DWORD PTR -4[rbp]	# tmp106, code
	mov	r12d, eax	# max_int, tmp106
.L10:
# ./main.c:48:         i++;
	add	r13d, 1	# i,
.L8:
# ./main.c:38:     while (str[i] != '\0') {
	mov	eax, r13d	# tmp107, i
	movsx	rdx, eax	# _8, tmp107
	mov	rax, QWORD PTR -40[rbp]	# tmp108, str
	add	rax, rdx	# _9, _8
	movzx	eax, BYTE PTR [rax]	# _10, *_9
# ./main.c:38:     while (str[i] != '\0') {
	test	al, al	# _10
	jne	.L11	#,
# ./main.c:50:     printf("\nmax: %c\n", max);
	movsx	eax, BYTE PTR -17[rbp]	# _11, max
	mov	esi, eax	#, _11
	lea	rax, .LC0[rip]	# tmp109,
	mov	rdi, rax	#, tmp109
	mov	eax, 0	#,
	call	printf@PLT	#
# ./main.c:51:     printf("\nmin: %c\n", min);
	movsx	eax, BYTE PTR -18[rbp]	# _12, min
	mov	esi, eax	#, _12
	lea	rax, .LC1[rip]	# tmp110,
	mov	rdi, rax	#, tmp110
	mov	eax, 0	#,
	call	printf@PLT	#
# ./main.c:52: }
	nop	
	leave	
	ret	
	.size	get_chars, .-get_chars
	.section	.rodata
.LC2:
	.string	"\nstr1? "
	.text
	.globl	main
	.type	main, @function
main:
	push	rbp	#
	mov	rbp, rsp	#,
	sub	rsp, 4096	#,
	or	QWORD PTR [rsp], 0	#,
	sub	rsp, 4096	#,
	or	QWORD PTR [rsp], 0	#,
	sub	rsp, 1840	#,
# ./main.c:54: int main() {
	mov	rax, QWORD PTR fs:40	# tmp89, MEM[(<address-space-1> long unsigned int *)40B]
	mov	QWORD PTR -8[rbp], rax	# D.3058, tmp89
	xor	eax, eax	# tmp89
# ./main.c:56:     char* str1 = str;
	lea	rax, -10016[rbp]	# tmp84,
	mov	QWORD PTR -10024[rbp], rax	# str1, tmp84
# ./main.c:57:     puts("\nstr1? ");
	lea	rax, .LC2[rip]	# tmp85,
	mov	rdi, rax	#, tmp85
	call	puts@PLT	#
# ./main.c:58:     get_string(str1);
	mov	rax, QWORD PTR -10024[rbp]	# tmp86, str1
	mov	rdi, rax	#, tmp86
	call	get_string	#
# ./main.c:59:     get_chars(str1);
	mov	rax, QWORD PTR -10024[rbp]	# tmp87, str1
	mov	rdi, rax	#, tmp87
	call	get_chars	#
# ./main.c:60:     return 0;
	mov	eax, 0	# _6,
# ./main.c:61: }
	mov	rdx, QWORD PTR -8[rbp]	# tmp90, D.3058
	sub	rdx, QWORD PTR fs:40	# tmp90, MEM[(<address-space-1> long unsigned int *)40B]
	je	.L14	#,
	call	__stack_chk_fail@PLT	#
.L14:
	leave	
	ret	
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.2.0-19ubuntu1) 11.2.0"
	.section	.note.GNU-stack,"",@progbits