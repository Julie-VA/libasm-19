section .text
	global _ft_list_sort

; rdi = **begin, rsi = cmp(s1, s2)
_ft_list_sort:
	cmp		rdi, 0
	je		_exit				; if **begin == NULL, error
	cmp		QWORD [rdi], 0
	je		_exit				; if *begin == NULL, error
	cmp		rsi, 0
	je		_exit				; if cmp == NULL, error
	mov		rax, 0
	push	r12
	push	r13
	push	r14
	mov		r12, QWORD [rdi]	; save *begin in r12
	mov		r14, rsi			; save cmp in r14
	jmp		_loop

_loop:
	cmp		QWORD [r12 + 8], 0
	je		_restore				; if *tmp = NULL, it's sorted, _restore
	mov		r13, QWORD [r12 + 8]	; r13 = tmp->next
	push	rdi						; save **begin on the stack
	mov		rdi, QWORD [r12]		; cpy tmp->data in rdi (1st arg for cmp)
	mov		rsi, QWORD [r13]		; cpy tmp->next->data in rsi (2nd arg)
	call	r14						; call cmp
	pop		rdi						; restore **begin
	cmp		rax, 0
	jle		_next
	jg		_switch

_next:
	mov	r12, [r12 + 8]	; *tmp = tmp->next
	jmp	_loop

_switch:
	mov	r8, QWORD [r12] 	; r8 = tmp->data
	mov	r9, QWORD [r13]		; r9 = tmp->next->data
	mov	[r12], r9			; tmp->data = tmp->next->data
	mov	[r13], r8			; tmp->next->data = tmp->data
	mov	r12, QWORD [rdi]	; go back to *begin
	jmp	_loop

_restore:
	pop	r14
	pop	r13
	pop	r12

_exit:
	mov	rax, 0
	ret