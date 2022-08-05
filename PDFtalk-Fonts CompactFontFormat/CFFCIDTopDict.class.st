"
Top DICT for CIDFonts
"
Class {
	#name : #CFFCIDTopDict,
	#superclass : #CFFTopDict,
	#category : #'PDFtalk-Fonts CompactFontFormat'
}

{ #category : #accessing }
CFFCIDTopDict >> cIDCount [
	"<Number>"

	| op |
	op := self operations detect: [:operation | operation isExtended: 34] ifNone: [
		^8720].
	^op operands first
]

{ #category : #accessing }
CFFCIDTopDict >> cIDFontRevision [
	"<Number>"

	| op |
	op := self operations detect: [:operation | operation isExtended: 32] ifNone: [
		^0].
	^op operands first
]

{ #category : #accessing }
CFFCIDTopDict >> cIDFontType [
	"<Number>"

	| op |
	op := self operations detect: [:operation | operation isExtended: 33] ifNone: [
		^0].
	^op operands first
]

{ #category : #accessing }
CFFCIDTopDict >> cIDFontVersion [
	"<Number>"

	| op |
	op := self operations detect: [:operation | operation isExtended: 31] ifNone: [
		^0].
	^op operands first
]

{ #category : #accessing }
CFFCIDTopDict >> fdArray [
	"<Number>
	Font DICT (FD) INDEX offset (0)"

	| op |
	op := self operations detect: [:operation | operation isExtended: 36] ifNone: [
		^0].
	^op operands first
]

{ #category : #accessing }
CFFCIDTopDict >> fdSelect [
	"<Number>
	FDSelect offset (0)"

	| op |
	op := self operations detect: [:operation | operation isExtended: 37] ifNone: [
		^0].
	^op operands first
]

{ #category : #accessing }
CFFCIDTopDict >> fontClass [
	^CFFCIDFont
]

{ #category : #accessing }
CFFCIDTopDict >> fontName [
	"<SID>
	FD FontName"

	| op |
	op := self operations detect: [:operation | operation isExtended: 38] ifNone: [
		^0].
	^op operands first
]

{ #category : #accessing }
CFFCIDTopDict >> ros [
	"<[SID SID Number]>
	Registry Ordering Supplement"

	| op |
	op := self operations detect: [:operation | operation isExtended: 30] ifNone: [
		^#()].
	^op operands
]

{ #category : #accessing }
CFFCIDTopDict >> uIDBase [
	"<Number>"

	| op |
	op := self operations detect: [:operation | operation isExtended: 35] ifNone: [
		^0].
	^op operands first
]
