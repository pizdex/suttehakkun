_Start:
	xor a
	ldh [rIF], a
	ldh [rIE], a
	di
	ld sp, wStackTop
	call Func_0447
	call Func_05e3
	call Func_050f

	ld a, $1f
	ld [wd61e], a
	xor a
	ldh [rLCDC], a
	ldh [rSTAT], a
	ldh [rSCY], a
	ldh [rSCX], a
	ld a, 1
	ldh [hff94], a
	ldh [rIE], a
	ei
	call Func_37f0
	di
	call Func_29ab
	ld a, 1
	jr c, .asm_0183
	xor a
.asm_0183
	ldh [hff8a], a
	di

Func_0186:
	ld sp, wStackTop
	call Func_050f
	xor a
	ld [wdb20], a
	ld [wd618], a
	ldh [hffae], a
	ld a, 0
	ld [wd61e], a
	call Func_0573
	call Func_3000
	xor a
	call Func_04b1

Func_01a4:
	ld sp, wStackTop
	call Func_050f
	ld a, [wd61e]
	and $3f
	ld c, a
	ld b, 0
	ld hl, .functable_bank
	add hl, bc
	ld a, [hl]
	call Func_048a

	ld a, [wd61e]
	and $3f
	sla a
	ld c, a
	ld b, 0
	ld hl, .functable_addr
	add hl, bc
	ld a, [hli]
	ld c, a
	ld b, [hl]
	push bc
	pop hl
	jp hl

.functable_addr
	dw Func_09aa ; $00
	dw Func_0b9c ; $01
	dw Func_08f8 ; $02
	dw $489d     ; $03
	dw Func_03ea ; $04
	dw Func_0f4f ; $05
	dw $494c     ; $06
	dw Func_394d ; $07
	dw Func_0d5f ; $08
	dw Func_1bda ; $09
	dw Func_03ea ; $0a
	dw Func_10d4 ; $0b
	dw Func_12a0 ; $0c
	dw Func_1586 ; $0d
	dw Func_03ea ; $0e
	dw Func_1789 ; $0f
	dw Func_03ea ; $10
	dw Func_1a80 ; $11
	dw Func_1d3d ; $12
	dw Func_1663 ; $13
	dw Func_0dbf ; $14
	dw Func_03ea ; $15
	dw Func_03ea ; $16
	dw Func_03ea ; $17
	dw Func_03ea ; $18
	dw Func_03ea ; $19
	dw Func_03ea ; $1a
	dw Func_03ea ; $1b
	dw Func_03ea ; $1c
	dw Func_03ea ; $1d
	dw Func_03ea ; $1e
	dw Func_03ea ; $1f

.functable_bank
	db $01, $01, $01, $02, $01, $01, $02, $01
	db $01, $01, $01, $01, $01, $01, $01, $01
	db $01, $01, $01, $01, $01, $01, $01, $01
	db $01, $01, $01, $01, $01, $01, $01, $01

Func_022e:
	dr $022e, $0320

VBlank:
	di
	push af
	push bc
	push de
	push hl
	ldh a, [hff9b]
	ldh [hff9d], a
	call hff80
	ld a, [wd600]
	ldh [rBGP], a
	ld a, [wd601]
	ldh [rOBP0], a
	ld a, [wd602]
	ldh [rOBP1], a
	ldh a, [hff98]
	ldh [rSCY], a
	ldh a, [hff99]
	ldh [rSCX], a
	ld a, [wdb20]
	and a
	jp nz, Func_03ce

	ld a, [wd61e]
	and $3f
	ld c, a
	ld b, 0
	ld hl, .functable_bank
	add hl, bc
	ld a, [hl]
	ld [MBC2RomBank], a

	ld a, [wd61e]
	and $3f
	sla a
	ld c, a
	ld b, 0
	ld hl, .functable_addr
	add hl, bc
	ld a, [hli]
	ld c, a
	ld b, [hl]
	ld l, c
	ld h, b
	jp hl

.functable_addr
	dw Func_0b79 ; $00
	dw Func_0ca5 ; $01
	dw Func_09a7 ; $02
	dw Func_03ce ; $03
	dw Func_03ea ; $04
	dw Func_10c0 ; $05
	dw Func_3ea2 ; $06
	dw Func_3900 ; $07
	dw $5539     ; $08
	dw Func_1d2f ; $09
	dw Func_03ea ; $0a
	dw Func_11b1 ; $0b
	dw Func_155a ; $0c
	dw Func_1660 ; $0d
	dw Func_03ea ; $0e
	dw Func_1996 ; $0f
	dw Func_1a6f ; $10
	dw Func_1b6b ; $11
	dw Func_1e17 ; $12
	dw Func_1783 ; $13
	dw Func_0f4c ; $14
	dw Func_03ea ; $15
	dw Func_03ea ; $16
	dw Func_03ea ; $17
	dw Func_03ea ; $18
	dw Func_03ea ; $19
	dw Func_03ea ; $1a
	dw Func_03ea ; $1b
	dw Func_03ea ; $1c
	dw Func_03ea ; $1d
	dw Func_03ea ; $1e
	dw Func_03ce ; $1f

.functable_bank
	db $01, $01, $01, $01, $01, $01, $02, $01
	db $02, $01, $01, $01, $01, $01, $01, $01
	db $01, $01, $01, $01, $01, $01, $01, $01
	db $01, $01, $01, $01, $01, $01, $01, $01

Func_03ce:
	dr $03ce, $03ea

Func_03ea:
	dr $03ea, $0447

Func_0447:
	dr $0447, $048a

Func_048a:
	dr $048a, $04b1

Func_04b1:
	and $3f
	ld b, a
	ld a, [wd61e]
	and $c0
	or b
	ld [wd61e], a
	ret

INCLUDE "home/joypad.asm"

Func_050f:
	dr $050f, $0573

Func_0573:
	dr $0573, $05e3

Func_05e3:
	dr $05e3, $08f8

Func_08f8:
	dr $08f8, $09a7

Func_09a7:
	jp Func_03ce

Func_09aa:
	dr $09aa, $0b79

Func_0b79:
	dr $0b79, $0b9c

Func_0b9c:
	dr $0b9c, $0ca5

Func_0ca5:
	dr $0ca5, $0d5f

Func_0d5f:
	dr $0d5f, $0dbf

Func_0dbf:
	dr $0dbf, $0f4c

Func_0f4c:
	jp Func_03ce

Func_0f4f:
	dr $0f4f, $10c0

Func_10c0:
	dr $10c0, $10d4

Func_10d4:
	dr $10d4, $11b1

Func_11b1:
	dr $11b1, $12a0

Func_12a0:
	dr $12a0, $155a

Func_155a:
	dr $155a, $1586

Func_1586:
	dr $1586, $1660

Func_1660:
	jp Func_03ce

Func_1663:
	dr $1663, $1783

Func_1783:
	call Func_2038
	jp Func_03ce

Func_1789:
	dr $1789, $1996

Func_1996:
	dr $1996, $1a6f

Func_1a6f:
	dr $1a6f, $1a80

Func_1a80:
	dr $1a80, $1b6b

Func_1b6b:
	dr $1b6b, $1bda

Func_1bda:
	dr $1bda, $1d2f

Func_1d2f:
	dr $1d2f, $1d3d

Func_1d3d:
	dr $1d3d, $1e17

Func_1e17:
	dr $1e17, $2038

Func_2038:
	dr $2038, $206d

LCD:
	ldh a, [rLCDC]
	and $df
	ldh [rLCDC], a
	xor a
	ldh [rSCX], a
	reti

Func_2077:
	ldh a, [rLCDC]
	and $df
	ldh [rLCDC], a
	ret

Serial:
	push af
	push bc
	push de
	push hl
	ld a, [wd692]
	cp $ff
	jr z, Func_20aa

	ld e, a
	ld d, 0
	sla e
	ld hl, .functable
	add hl, de
	push hl
	pop de
	ld a, [de]
	ld l, a
	inc de
	ld a, [de]
	ld h, a
	jp hl

.functable
	dw Func_211e
	dw Func_2159
	dw Func_20e0
	dw Func_2107
	dw Func_211b
	dw Func_20c3
	dw Func_2159
	dw Func_20af

Func_20aa:
	pop hl
	pop de
	pop bc
	pop af
	reti

Func_20af:
	dr $20af, $20c3

Func_20c3:
	dr $20c3, $20e0

Func_20e0:
	dr $20e0, $2107

Func_2107:
	dr $2107, $211b

Func_211b:
	jp Func_20aa

Func_211e:
	dr $211e, $2159

Func_2159:
	dr $2159, $239a

Timer:
	di
	push af
	xor a
	ldh [rTAC], a
	ld a, $01
	ldh [rSC], a
	ld a, $81
	ldh [rSC], a
	pop af
	ei
	reti

Func_23aa:
	dr $23aa, $29ab

Func_29ab:
	dr $29ab, $3000

Func_3000:
	dr $3000, $37f0

Func_37f0:
	dr $37f0, $3900

Func_3900:
	dr $3900, $394d

Func_394d:
	dr $394d, $3ea2

Func_3ea2:
	dr $3ea2, $4000
