section	.text
	global	_ft_atoi_base

; rdi = *str, rsi = *base
_ft_atoi_base:
	mov		rax, 0				; rax = res
	mov		r8, 0				; r8 = i
	push	r12
	push	r13
	mov		r12, 0				; r12 = base_len
	mov		r13, 0				; r13 = sign
	jmp		_base_check_loop

_base_len_inc:
	inc	r12	; base_len++

_base_check_loop:
	cmp	BYTE [rsi + r12], 0
	je	_base_check_end			; if base[base_len] == 0, end of string
	mov	r8, r12					; i = base_len

_base_check_dup_inc:
	inc	r8	; i++

_base_check_dup_loop:
	cmp	BYTE [rsi + r8], 0
	je	_base_check_valid		; if base[i] == 0, end of string
	mov	r9b, [rsi + r8]			; cpy base[i] in r9b (8-bit sub register of r9)
	cmp	BYTE [rsi + r12], r9b
	je	_exit					; if base[base_len] == base[i], duplicate -> _exit
	jmp	_base_check_dup_inc

_base_check_valid:
	cmp BYTE [rsi + r12], 32
	je	_exit					; if base[base_len] == ' ', _exit
	cmp	BYTE [rsi + r12], 43
	je	_exit					; if base[base_len] == '+', _exit
	cmp BYTE [rsi + r12], 45
	je	_exit					; if base[base_len] == '-', _exit
	cmp BYTE [rsi + r12], 9
	je	_exit					; if base[base_len] == '\t', _exit
	cmp BYTE [rsi + r12], 10
	je	_exit					; if base[base_len] == '\n', _exit
	cmp BYTE [rsi + r12], 11
	je	_exit					; if base[base_len] == '\v', _exit
	cmp BYTE [rsi + r12], 12
	je	_exit					; if base[base_len] == '\f', _exit
	cmp BYTE [rsi + r12], 13
	je	_exit					; if base[base_len] == '\r', _exit
	jmp	_base_len_inc

_base_check_end:
	cmp	r12, 2
	jl	_exit				; if base_len < 2, _exit
	mov	r8, 0
	jmp	_skip_whitespaces

_skip_whitespaces_inc:
	inc	r8	; i++

_skip_whitespaces:
	cmp BYTE [rdi + r8], 32
	je	_skip_whitespaces_inc	; if str[i] == ' ', _exit
	cmp BYTE [rdi + r8], 9
	je	_skip_whitespaces_inc	; if str[i] == '\t', _exit
	cmp BYTE [rdi + r8], 10
	je	_skip_whitespaces_inc	; if str[i] == '\n', _exit
	cmp BYTE [rdi + r8], 11
	je	_skip_whitespaces_inc	; if str[i] == '\v', _exit
	cmp BYTE [rdi + r8], 12
	je	_skip_whitespaces_inc	; if str[i] == '\f', _exit
	cmp BYTE [rdi + r8], 13
	je	_skip_whitespaces_inc	; if str[i] == '\r', _exit
	jmp	_check_sign

_is_neg:
	xor	r13b, 1 ; 0 = +, 1 = - | Ex: if r13b = 1 already, the second - will set r13b to 0

_is_pos:
	inc	r8	; i++

_check_sign:
	cmp	BYTE [rdi + r8], 45
	je	_is_neg					; if str[i] == '-', _is_neg
	cmp	BYTE [rdi + r8], 43
	je	_is_pos					; if str[i] == '+', _is_pos

_atoi_loop:
	cmp	BYTE [rdi + r8], 0
	je	_end				; if str[i] == 0, end of string
	mov	r9, 0				; j = 0

_atoi_base:
	cmp	BYTE [rsi + r9], 0
	je	_exit						; if base[j] == 0, end of string -> digit is not in the base
	mov	r10b, [rsi + r9]			; cpy base[j], in r10b
	cmp	BYTE [rdi + r8], r10b
	je	_add_res					; if str[i] == base[j], calculate
	inc	r9							; j++
	jmp	_atoi_base

_add_res:
	mul	r12		; res *= base_len
	add	rax, r9	; res += j
	inc	r8		; i++
	jmp	_atoi_loop

_end:
	cmp	r13, 0
	je	_return	; if sign is +, return
	neg	rax
	jmp	_return

_exit:
	mov	rax, 0

_return:
	pop	r12
	pop	r13
	ret
