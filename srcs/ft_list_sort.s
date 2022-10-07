section .text
	global _ft_list_sort

; rdi = **begin, rsi = cmp(s1, s2)
_ft_list_sort:
	cmp	rdi, 0
	je	_error			; if **begin == NULL, error
	cmp	QWORD [rdi], 0
	je	_error			; if *begin == NULL, error
	cmp	rsi, 0
	je	_error			; if cmp == NULL, error
	mov	rax, 0
	mov	r8, QWORD [rdi]	; save *begin in r8
	mov	r11, rsi		; save cmp in rcx
	jmp	_loop

_loop:
	cmp		QWORD [r8 + 8], 0
	je		_exit				; if *tmp = NULL, it's sorted, _exit
	mov		r9, QWORD [r8 + 8]	; r9 = tmp->next
	push	rdi					; save **begin on the stack
	mov		rdi, QWORD [r8]		; cpy tmp->data in rdi (1st arg for cmp)
	mov		rsi, QWORD [r9]		; cpy tmp->next->data in rsi (2nd arg)
	call	r11					; call cmp
	pop		rdi					; restore **begin
	cmp		rax, 0
	jle		_next
	jg		_switch

_next:
	mov	r8, r9	; *tmp = tmp->next
	jmp	_loop

_switch:
	mov	rax, 100
	ret

_exit:
	mov	rax, 15
	ret

_error:
	mov	rax, 0
	ret



;2314

;2 < 3 oui

;3 < 1 non -> inverse puis met 1 au tout debut -> 1234



;4321

;4 < 3 non -> inverse puis met 3 au debut -> 3421

;3 < 4 oui

;4 < 2 non -> inverse puis met 2 au debut -> 2341

;2 < 3 oui

;3 < 4 oui

;4 < 1 non -> inverse puis met 1 au debut -> 1234