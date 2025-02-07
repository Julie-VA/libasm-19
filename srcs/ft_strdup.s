section .text
	global _ft_strdup
	extern _malloc
	extern _ft_strlen
	extern _ft_strcpy
	extern ___error

_ft_strdup:
	;original strdup doesn't protect for NULL strings, but that's how you'd do it
	;cmp	rdi, 0
	je	_error	; if rdi == 0, _error
	call	_ft_strlen	; call ft_strlen, len of src is in rax
	push	rdi			; push and save rdi on the stack
	inc		rax			; increment rax for the \0
	mov		rdi, rax	; cpy len in rdi, to be used by malloc
	call	_malloc		; call malloc, pointer to allocated memory is in rax
	pop		rcx			; pop the rdi save in rcx
	cmp		rax, 0		; compare rax with 0
	je		_error		; if rax = 0 then go to _error
	mov		rdi, rax	; prep args for ft_strcpy, first the dest
	mov		rsi, rcx	; then the src
	call	_ft_strcpy	; call ft_strcpy, the copied string is in rax
	ret

_error:
	mov	rax, 0	; set rax to 0
	ret