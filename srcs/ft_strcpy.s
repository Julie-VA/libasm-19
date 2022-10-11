section .text
	global _ft_strcpy

_ft_strcpy:
	;original strcpy doesn't protect for NULL strings, but that's how you'd do it
	;cmp	rdi, 0
	;je	_error	; if rdi == 0, _error
	;cmp	rsi, 0
	;je	_error	; if rsi == 0, _error
	mov	rax, 0 ; rax = 0
	jmp	_loop

_loop:
	cmp	BYTE [rsi + rax], 0	; compare src[rax] with 0
	je	_exit				; if src[rax] == 0, return
	mov	cl, [rsi + rax]		; cpy src[rax] in another register
	mov	[rdi + rax], cl		; cpy the previously stored character in dest[rax]
	inc	rax					; increment rax
	jmp	_loop

_exit:
	mov	BYTE [rdi + rax], 0	; add \0 at the end of dest
	mov	rax, rdi			; cpy dest in the returned string
	ret

_error:
	mov	rax, 0
	ret