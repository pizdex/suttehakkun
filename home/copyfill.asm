CopyBytes16::
; copy bc bytes from hl to de
.copy
	ld a, [hli]
	ld [de], a
	inc de
	dec bc
	ld a, b
	or c
	jr nz, .copy
	ret

CopyBytes8:
; copy c bytes from hl to de
.copy
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .copy
	ret

ByteFill16::
; fill bc bytes with the value of a, starting at hl
.fill
	ld [hli], a
	ld d, a
	dec bc
	ld a, b
	or c
	ld a, d
	jr nz, .fill
	ret

ByteFill8:
; fill c bytes with the value of a, starting at hl
.fill
	ld [hli], a
	dec c
	jr nz, .fill
	ret
