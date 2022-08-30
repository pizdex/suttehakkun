_Start:
	xor a
	ldh [rIF], a
	ldh [rIE], a
	di
	ld sp, wStackTop
	call Func_0447
	call Func_05e3
	call WriteOAMDMACodeToHRAM

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
	call WriteOAMDMACodeToHRAM
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
	call WriteOAMDMACodeToHRAM
; Bank
	ld a, [wd61e]
	and $3f
	ld c, a
	ld b, 0
	ld hl, .functable_bank
	add hl, bc
	ld a, [hl]
	call BankswitchHome
; Address
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
	dw Func_09aa    ; $00
	dw Func_0b9c    ; $01
	dw Func_08f8    ; $02
	dw Func_02_489d ; $03
	dw InfiniteLoop ; $04
	dw Func_0f4f    ; $05
	dw Func_02_494c ; $06
	dw Func_394d    ; $07
	dw Func_0d5f    ; $08
	dw Func_1bda    ; $09
	dw InfiniteLoop ; $0a
	dw Func_10d4    ; $0b
	dw Func_12a0    ; $0c
	dw Func_1586    ; $0d
	dw InfiniteLoop ; $0e
	dw Func_1789    ; $0f
	dw InfiniteLoop ; $10
	dw Func_1a80    ; $11
	dw Func_1d3d    ; $12
	dw Func_1663    ; $13
	dw Func_0dbf    ; $14
	dw InfiniteLoop ; $15
	dw InfiniteLoop ; $16
	dw InfiniteLoop ; $17
	dw InfiniteLoop ; $18
	dw InfiniteLoop ; $19
	dw InfiniteLoop ; $1a
	dw InfiniteLoop ; $1b
	dw InfiniteLoop ; $1c
	dw InfiniteLoop ; $1d
	dw InfiniteLoop ; $1e
	dw InfiniteLoop ; $1f

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
	ldh a, [hROMBank]
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
	dw Func_0b79    ; $00
	dw Func_0ca5    ; $01
	dw Func_09a7    ; $02
	dw Func_03ce    ; $03
	dw InfiniteLoop ; $04
	dw Func_10c0    ; $05
	dw Func_3ea2    ; $06
	dw Func_3900    ; $07
	dw Func_02_5539 ; $08
	dw Func_1d2f    ; $09
	dw InfiniteLoop ; $0a
	dw Func_11b1    ; $0b
	dw Func_155a    ; $0c
	dw Func_1660    ; $0d
	dw InfiniteLoop ; $0e
	dw Func_1996    ; $0f
	dw Func_1a6f    ; $10
	dw Func_1b6b    ; $11
	dw Func_1e17    ; $12
	dw Func_1783    ; $13
	dw Func_0f4c    ; $14
	dw InfiniteLoop ; $15
	dw InfiniteLoop ; $16
	dw InfiniteLoop ; $17
	dw InfiniteLoop ; $18
	dw InfiniteLoop ; $19
	dw InfiniteLoop ; $1a
	dw InfiniteLoop ; $1b
	dw InfiniteLoop ; $1c
	dw InfiniteLoop ; $1d
	dw InfiniteLoop ; $1e
	dw Func_03ce    ; $1f

.functable_bank
	db $01, $01, $01, $01, $01, $01, $02, $01
	db $02, $01, $01, $01, $01, $01, $01, $01
	db $01, $01, $01, $01, $01, $01, $01, $01
	db $01, $01, $01, $01, $01, $01, $01, $01

Func_03ce:
	ei
	call Func_28a1
	ld a, [wd623]
	inc a
	ld [wd623], a
	ld a, $01
	ldh [hff92], a
	call Func_3000
	ldh a, [hff9d]
	call BankswitchHome
	pop hl
	pop de
	pop bc
	pop af
	reti

InfiniteLoop:
; No escape
	nop
	nop
	jp InfiniteLoop

Func_03ef:
	ldh a, [hROMBank]
	ldh [hff9c], a
.asm_03f3
	ldh a, [hff92]
	and a
	jr z, .asm_03f3
	xor a
	ldh [hff92], a
	dec c
	jr nz, .asm_03f3

	ldh a, [hff9c]
	call BankswitchHome
	ret

Func_0404:
	ld a, [wd61f]
	or $01
	ld [wd61f], a
	ld hl, wc100
	ld de, wd400
	ld bc, $0100
	call CopyBytes16
	ld hl, hff8a
	ld de, wd500
	ld bc, $0075
	call CopyBytes16
	ret

Func_0425:
	ld hl, wd400
	ld de, wc100
	ld bc, $0100
	call CopyBytes16
	ld hl, wd500
	ld de, hff8a
	ld bc, $0075
	call CopyBytes16
	ret

Func_043e:
	ldh a, [hff98]
	ldh [rSCY], a
	ldh a, [hff99]
	ldh [rSCX], a
	ret

Func_0447:
	dr $0447, $048a

BankswitchHome:
; Switches to bank # in 'a'
	push af
	ldh a, [hROMBank]
	ldh [hTempBank], a
	pop af
	ldh [hROMBank], a
	ld [MBC2RomBank], a
	ret

Func_0496:
	ldh [hTempBank], a
	ret

BankswitchReturn:
	ldh a, [hTempBank]
	ld [MBC2RomBank], a
	ldh [hROMBank], a
	ret

Func_04a1:
	ld a, [wd600]
	ldh [rBGP], a
	ld a, [wd601]
	ldh [rOBP0], a
	ld a, [wd602]
	ldh [rOBP1], a
	ret

Func_04b1:
	and $3f
	ld b, a
	ld a, [wd61e]
	and $c0
	or b
	ld [wd61e], a
	ret

INCLUDE "home/joypad.asm"
INCLUDE "home/oam_dma.asm"
INCLUDE "home/copyfill.asm"

Func_0544:
	call Func_1ef0
	xor a
	ld [wd600], a
	ld [wd601], a
	ld [wd602], a
	ldh [hff92], a
.asm_0553
	ldh a, [hff92]
	and a
	jr z, .asm_0553
	ret

Func_0559:
	call Func_1ef0
	xor a
	ld [wd600], a
	ld [wd601], a
	ld [wd602], a
	ldh [hff92], a
	ld a, $80
	ld [wcf00], a
.asm_056d
	ldh a, [hff92]
	and a
	jr z, .asm_056d
	ret

Func_0573:
	ld a, $80
	ld [wcf00], a
	ret

Func_0579:
	ld [wcf00], a
	ret

Func_057d:
	ldh a, [hffb4]
	swap a
	and $0f
	ld c, a
	ld b, 0
	ld hl, .unk_058f
	add hl, bc
	ld a, [hl]
	ld [wcf00], a
	ret

.unk_058f
	db $81, $82, $83, $84, $85
	db $86, $87, $88, $89, $8a

Func_0599:
	ld [wcfa0], a
	ret

Func_059d:
	ldh a, [hffb2]
	bit 7, a
	ret z

	and $7f
	ld b, a
	ld c, $fe
.asm_05a7
	and c
	cp b
	jr nz, .asm_05b0

	rlc c
	jp .asm_05a7

.asm_05b0
	ldh [hffb2], a
	bit 1, a
	ret nz

	ldh a, [hffb5]
	and $7f
	ldh [hffb5], a
	ret

Func_05bc:
	dr $05bc, $05e3

Func_05e3:
	dr $05e3, $0620

Func_0620:
	dr $0620, $085c

Func_085c:
	call Func_2c70
	ld hl, wTilemap
	ld bc, $240
	ld de, vBGMap0
	call CopyBytes16
	ret

Func_086c:
	xor a
	ld c, $2d
	ld hl, wd777
	call ByteFill8
	ret

Func_0876:
	ld a, $01
	call BankswitchHome
	call Func_01_43ee
	call Func_01_4714
	call BankswitchReturn
	ret

Func_0885:
	ld a, BANK(Func_0e_5917)
	call BankswitchHome
	call Func_0e_5917
	call BankswitchReturn
	ret

Func_0891:
	ld a, BANK(Func_0e_5a72)
	call BankswitchHome
	call Func_0e_5a72
	call BankswitchReturn
	ret

Func_089d:
	ld a, BANK(Func_0e_66e5)
	call BankswitchHome
	call Func_0e_66e5
	call BankswitchReturn
	ret

Func_08a9:
	ld a, BANK(Func_0e_660a)
	call BankswitchHome
	call Func_0e_660a
	call BankswitchReturn
	ret

Func_08b5:
	ld a, BANK(Func_0e_44db)
	call BankswitchHome
	call Func_0e_44db
	call BankswitchReturn
	ret

Func_08c1:
	ld a, BANK(Func_0e_4597)
	call BankswitchHome
	call Func_0e_4597
	call BankswitchReturn
	ret

Func_08cd:
	ld a, BANK(Func_0e_4a20)
	call BankswitchHome
	call Func_0e_4a20
	call BankswitchReturn
	ret

Func_08d9:
	ld a, BANK(Func_0d_6fd4)
	call BankswitchHome
	call Func_0d_6fd4
	call BankswitchReturn
	ret

Func_08e5:
	ld a, BANK(Func_0e_6a04)
	call BankswitchHome
	call Func_0e_6a04
	call BankswitchReturn
	ret

Func_08f1:
	ret

Func_08f2:
	dr $08f2, $08f8

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
	dr $1e17, $1ef0

Func_1ef0:
	dr $1ef0, $2038

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
	ldh a, [rSB]
	ldh [hff9e], a
	ldh a, [hJoypadPressed]
	ldh [rSB], a
	ld a, $01
	ld [wd691], a
	ld a, $80
	ldh [rSC], a
	jp Func_20aa

Func_20c3:
	dr $20c3, $20e0

Func_20e0:
	dr $20e0, $2107

Func_2107:
	ldh a, [rSB]
	ldh [hff9e], a
	ldh a, [hJoypadPressed]
	ldh [rSB], a
	ld a, $01
	ld [wd691], a
	ld a, $80
	ldh [rSC], a
	jp Func_20aa

Func_211b:
	jp Func_20aa

Func_211e:
	dr $211e, $2159

Func_2159:
	dr $2159, $237a

Func_237a:
	ld a, [wd690]
	cp $f0
	ret nz
	ldh a, [hJoypadPressed]
	and A_BUTTON | START
	ret z

	ld a, [wd6d8]
	or $40
	ld [wd6d8], a
	ld a, $aa
	ldh [rSB], a
	ld a, SCF_SOURCE
	ldh [rSC], a
	ld a, SCF_START + SCF_SOURCE
	ldh [rSC], a
	ret

Timer:
	di
	push af
	xor a ; TACF_STOP
	ldh [rTAC], a
	ld a, SCF_SOURCE
	ldh [rSC], a
	ld a, SCF_START + SCF_SOURCE
	ldh [rSC], a
	pop af
	ei
	reti

Func_23aa:
	ld a, $90
	ldh [rTIMA], a
	xor a
	ldh [rTMA], a
	ld a, TACF_65KHZ
	ldh [rTAC], a
	ld a, TACF_START + TACF_65KHZ
	ldh [rTAC], a
	ret

Func_23ba:
	dr $23ba, $251f

Func_251f:
	ld hl, .unk_255e
	ld a, [wd603]
	sla a
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ld hl, wc000
	ldh a, [hffae]
	sla a
	sla a
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [de]
	inc de
	ld b, a
	ld c, a
	ldh a, [hffae]
	add b
	ldh [hffae], a
.asm_2544
	ld a, [de]
	ld b, a
	ld a, [wd604]
	add b
	ld [hli], a
	inc de
	ld a, [de]
	ld b, a
	ld a, [wd605]
	add b
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .asm_2544
	ret

.unk_255e:
	dr $255e, $258a

unk_258a:
	dr $258a, $2651

Func_2651:
	dr $2651, $2813

Func_2813:
	xor a
	call Func_2822
	ld a, $01
	call Func_2822
	ld a, $02
	call Func_2822
	ret

Func_2822:
	dr $2822, $28a1

Func_28a1:
	dr $28a1, $29ab

Func_29ab:
	dr $29ab, $2c70

Func_2c70:
; one big function
	dr $2c70, $2d29

Func_2d29:
	ld b, a
	ld a, $08
	call BankswitchHome
	ld a, b
	sla a
	add b
	ld l, a
	ld h, $40
	ld a, [hli]
	ld [wce40], a
	ld a, [hli]
	ld [wce41], a
	ld a, [hl]
	ld [wce42], a
	ld a, [wce42]
	call BankswitchHome

	ld a, [wce40]
	ld l, a
	ld a, [wce41]
	ld h, a
	ld a, [wd609]
	ld c, a
	ld a, [wd60a]
	ld b, a
	ld a, 0
	ld [wd603], a
	ld [wd604], a
	ld de, $0400
	call Func_2d8f

	ld a, [wd609]
	ld c, a
	ld a, [wd60a]
	ld b, a
	inc bc
	ld a, $00
	ld [wd603], a
	ld [wd604], a
	ld de, $0400
	call Func_2d8f

	ld a, l
	ld [wce40], a
	ld a, h
	ld [wce41], a
	dec bc
	ld a, c
	ld [wd609], a
	ld a, b
	ld [wd60a], a
	ret

Func_2d8f:
; 2bpp copy 'de' bytes from 'hl' to 'bc'
.asm_2d8f
	push de
.asm_2d90
	ld a, [wd603]
	and a
	jr nz, .asm_2dc0

	ld a, [hli] ; get byte
	ld e, a
	; check if at end of bank
	ld a, h
	cp $80
	call z, Func_2df0 ; if so, switch to next bank

	; check if 'a' is less than $40
	ld a, e
	and $c0
	jr z, .asm_2da8
	; use 00:3fxx
	ld d, $3f
	ld a, [de]
	jr .writebyte

.asm_2da8
	or e ; ld a, e but also checks if 0
	jr z, .command_00
	sub 5 ; check if less than 5
	jr c, .asm_2dd5
	inc a
	ld [wd603], a
	jr .asm_2d90

.command_00
; Directly write next byte
	ld a, [hli]
	ld e, a
	; check if at end of bank
	ld a, h
	cp $80
	call z, Func_2df0 ; if so, switch to next bank
	ld a, e
	jr .writebyte

.asm_2dc0
	dec a
	ld [wd603], a
	ld a, [wd604]

.writebyte
	ld [bc], a
	pop de

.asm_2dc9
	ld [wd604], a
	inc bc
	inc bc
	dec e
	jr nz, .asm_2d8f
	dec d
	jr nz, .asm_2d8f
.ret ret

.asm_2dd5
; 4 = $ff, 3 = $fe, 2 = $fd, 1 = $fc
; backtracks a certain amount of bytes and copy 2 2bpp bytes
	sla a
	sla a
	ld d, b
	add c
	jr c, .asm_2dde
	dec d
.asm_2dde
	ld e, a
	ld a, [de]
	ld [bc], a
	inc de
	inc de
	inc bc
	inc bc
	ld a, [de]
	ld [bc], a
	pop de
	dec e
	jr nz, .asm_2dc9
	dec d
	jr nz, .asm_2dc9
	jr .ret

Func_2df0:
	ld hl, $4000
	ld a, [wce42]
	inc a
	ld [wce42], a
	call BankswitchHome
	ret

Func_2dfe:
	dr $2dfe, $3000

Func_3000:
	dr $3000, $37f0

Func_37f0:
	dr $37f0, $3900

Func_3900:
	dr $3900, $394d

Func_394d:
	dr $394d, $3ea2

Func_3ea2:
	dr $3ea2, $3ee9

Func_3ee9:
	ld a, BANK(Func_02_5927)
	call BankswitchHome
	call Func_02_5927
	ld a, 1
	call BankswitchHome
	ret

unk_3ef7:
	dr $3ef7, $4000
