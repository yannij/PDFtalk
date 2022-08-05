Extension { #name : #PtOTFontHeader }

{ #category : #'*PDFtalk-test resources-test instances' }
PtOTFontHeader class >> example [
	^PtOTFontHeader
		version: 1.0
		fontRevision: 2.2
		checkSumAdjustment: 3453633193
		flags: 3
		unitsPerEm: 1000
		created: (Timestamp d: 12 m: 9 y: 2008 h: 11 m: 59 s: 27)
		modified: (Timestamp d: 12 m: 9 y: 2008 h: 11 m: 59 s: 27)
		glyphBBox: (-53 @ -285 corner: 1121 @ 1012)
		macStyle: 0
		lowestRecPPEM: 3
		fontDirectionHint: 2
		indexToLocFormat: 0
		glyphDataFormat: 0
]

{ #category : #'*PDFtalk-test resources-test instances' }
PtOTFontHeader class >> exampleDifferentDates [
	^PtOTFontHeader
		version: 1.0
		fontRevision: 1.0
		checkSumAdjustment: 3395040194
		flags: 3
		unitsPerEm: 1000
		created: (Timestamp d: 14 m: 1 y: 2010 h: 1)
		modified: (Timestamp d: 22 m: 7 y: 2010 h: 9 m: 46 s: 28)
		glyphBBox: (-80 @ -214 corner: 1033 @ 991)
		macStyle: 0
		lowestRecPPEM: 3
		fontDirectionHint: 2
		indexToLocFormat: 0
		glyphDataFormat: 0
]

{ #category : #'*PDFtalk-test resources-test instances' }
PtOTFontHeader class >> exampleUnitsPerEm2000 [
	^PtOTFontHeader
		version: 1.0
		fontRevision: 7.504
		checkSumAdjustment: 2521734574
		flags: 3
		unitsPerEm: 2000
		created: (Timestamp d: 18 m: 10 y: 2013 h: 16 m: 13 s: 8)
		modified: (Timestamp d: 18 m: 10 y: 2013 h: 15 m: 13 s: 13)
		glyphBBox: (-1351 @ -476 corner: 3135 @ 1948)
		macStyle: 0
		lowestRecPPEM: 7
		fontDirectionHint: 2
		indexToLocFormat: 0
		glyphDataFormat: 0
]
