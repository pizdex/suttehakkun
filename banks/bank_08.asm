data_08_4000:
	dab gfx_08_4100
	dwb $4744, $08
	dwb $4e64, $08
	dwb $5302, $08
	dwb $58ba, $08
	dwb $5d17, $08
	dwb $6296, $08
	dwb $6701, $08
	dwb $6b8d, $08
	dwb $6f30, $08
	dwb $73ce, $08
	dwb $77e5, $08
	dwb $7d1e, $08

	dab gfx_09_42bc
	dab gfx_09_44ff
	dab gfx_09_4bee
	dab gfx_09_5249
	dab gfx_09_5541
	dab gfx_09_5b71
	dab gfx_09_5b95
	dab gfx_09_6111
	dab gfx_09_676e
	dab gfx_09_6afa
	dab gfx_09_714c
	dab gfx_09_77c1
	dab gfx_09_7cfb

	dwb $433f, $0a
	dwb $4a79, $0a
	dwb $4ed7, $0a
	dwb $53d2, $0a
	dwb $5829, $0a
	dwb $5d5c, $0a
	dwb $6371, $0a
	dwb $6765, $0a
	dwb $6ca2, $0a
	dwb $7220, $0a
	dwb $7702, $0a
	dwb $7b56, $0a

	dwb $4187, $0b
	dwb $467c, $0b
	dwb $4803, $0b
	dwb $4a4a, $0b
	dwb $4d1a, $0b
	dwb $5126, $0b
	dwb $54d1, $0b
	dwb $5ac0, $0b
	dwb $5fe5, $0b
	dwb $65c0, $0b
	dwb $6d40, $0b
	dwb $7223, $0b
	dwb $7794, $0b
	dwb $7bec, $0b

	dwb $42e4, $0c
	dwb $4791, $0c
	dwb $4b73, $0c
	dwb $4fe8, $0c
	dwb $5556, $0c
	dwb $5a4e, $0c
	dwb $5e25, $0c
	dwb $5f0b, $0c
	dwb $647c, $0c
	dwb $6ba0, $0c
	dwb $7124, $0c
	dwb $7620, $0c
	dwb $7c6f, $0c

	dwb $428d, $0d
	dwb $4815, $0d
	dwb $4e6a, $0d

unk_08_40cc:
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00

gfx_08_4100:
	incbin "gfx/08/encoded_08_4100.sf"

gfx_08_4744:
	incbin "gfx/08/encoded_08_4744.sf"

gfx_08_4e64:
	incbin "gfx/08/encoded_08_4e64.sf"

gfx_08_5302:
	incbin "gfx/08/encoded_08_5302.sf"

gfx_08_58ba:
	incbin "gfx/08/encoded_08_58ba.sf"

gfx_08_5d17:
	incbin "gfx/08/encoded_08_5d17.sf"

gfx_08_6296:
	incbin "gfx/08/encoded_08_6296.sf"

gfx_08_6701:
	incbin "gfx/08/encoded_08_6701.sf"

gfx_08_6b8d:
	incbin "gfx/08/encoded_08_6b8d.sf"

gfx_08_6f30:
	incbin "gfx/08/encoded_08_6f30.sf"

gfx_08_73ce:
	incbin "gfx/08/encoded_08_73ce.sf"

gfx_08_77e5:
	incbin "gfx/08/encoded_08_77e5.sf"

gfx_08_7d1e:
	dr $23d1e, $24000
