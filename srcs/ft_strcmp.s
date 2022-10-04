section .text
	global _ft_strcmp

_ft_strcmp:
	mov	rax, 0 ; rax = 0
	jmp	loop

loop:
	cmp	BYTE [rdi + rax], 0	; compare s1[rax] with 0
	je	exit				; if s1[rax] == 0, return
	cmp	BYTE [rsi + rax], 0	; same with s2
	je	exit				; same with s2
	inc	rax					; increment rax
	jmp	loop

ret_inf:
	mov	rax, -1 ; rax = -1
	ret

ret_sup:
	mov rax, 1 ; rax = 1
	ret

exit:
	mov	cl, BYTE [rsi + rax]	; store rsi[rax] in cl
	cmp	BYTE [rdi + rax], cl	; compare the characters we ended on in both strs
	jg	ret_sup					; if s1[rax] > s2[rax], go to ret_sup
	jl	ret_inf					; if s1[rax] < s2[rax], go to ret_inf
	mov	rax, 0					; rax = 0
	ret