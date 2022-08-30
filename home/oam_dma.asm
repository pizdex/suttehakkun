WriteOAMDMACodeToHRAM:
	ld hl, OAMDMACode
	ld de, hff80
	ld bc, OAMDMACodeEnd - OAMDMACode
	call CopyBytes16
	ret

OAMDMACode:
	ld a, $c0
	ldh [rDMA], a
	ld a, 40
.wait
	dec a
	jr nz, .wait
	ret
OAMDMACodeEnd:
