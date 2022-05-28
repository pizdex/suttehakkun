_Start:
	dr $0150, $0320

VBlank:
	dr $0320, $206d

LCD:
	dr $206d, $207e

Serial:
	dr $207e, $239a

Timer:
	dr $239a, $4000
