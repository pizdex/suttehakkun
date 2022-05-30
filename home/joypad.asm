Joypad::
; We can only get four inputs at a time.
; We take d-pad first (Up, Down, Left, Right).
	ld a, R_DPAD
	ldh [rJOYP], a
; Read eight times to give the request time to take.
REPT 8
	ldh a, [rJOYP]
ENDR
	xor $ff ; cpl
	and $0f
	swap a
; We'll keep this in b for now.
	ld b, a

; Buttons make 8 total inputs (A, B, Select, Start).
; We can fit this into one byte.
	ld a, R_BUTTONS
	ldh [rJOYP], a
; Wait for input to stabilize.
REPT 12
	ldh a, [rJOYP]
ENDR
; Buttons take the lo nybble.
	xor $ff ; cpl
	and $0f
	or b
	ld c, a

; To get the delta we xor the last frame's input with the new one.
	ldh a, [hJoypadDown] ; last frame
	xor c
; Newly pressed this frame:
	and c
	ldh [hJoypadPressed], a
; Currently pressed:
	ld a, c
	ldh [hJoypadDown], a

; Reset the joypad register since we're done with it.
	ld a, $30
	ldh [rJOYP], a
	ret

Func_0509:
	xor a
	ldh [hJoypadDown], a
	ldh [hJoypadPressed], a
	ret
