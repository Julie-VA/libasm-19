section .text
	global _ft_strcmp

_ft_strcmp:
	;original strcmp doesn't protect for NULL strings, but that's how you'd do it
	;cmp	rdi, 0
	;je	_error	; if rdi == 0, _error
	;cmp	rsi, 0
	;je	_error	; if rsi == 0, _error
	mov	rax, 0	; rax = 0
	mov	rcx, 0	; rcx = 0
	jmp	_loop

_loop:
	mov	cl, BYTE [rsi + rax]	; store rsi[rax] in cl
	cmp	BYTE [rdi + rax], cl	; compare s1[rax] with s2[rax]
	jne	_exit					; if s1[rax] != s2[rax], exit
	cmp	BYTE [rdi + rax], 0		; compare s1[rax] with 0
	je	_exit					; if s1[rax] == 0, exit
	cmp	BYTE [rsi + rax], 0		; same with s2
	je	_exit					; same with s2
	inc	rax						; increment rax
	jmp	_loop

_ret_inf:
	mov	rax, -1 ; rax = -1
	ret

_ret_sup:
	mov rax, 1 ; rax = 1
	ret

_exit:
	mov	cl, BYTE [rsi + rax]	; store rsi[rax] in cl
	cmp	BYTE [rdi + rax], cl	; compare the characters we ended on in both strs
	jg	_ret_sup				; if s1[rax] > s2[rax], go to _ret_sup
	jl	_ret_inf				; if s1[rax] < s2[rax], go to _ret_inf
	mov	rax, 0					; rax = 0
	ret

_error:
	mov	rax, 0
	ret