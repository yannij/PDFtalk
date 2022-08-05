"
Same as SC but also supports Pattern, Separation, DeviceN and ICCBased colour spaces.
If the current stroking colour space is a Separation, DeviceN, or ICCBased colour space, the operands c1…cn shall be numbers. 
The number of operands and their interpretation depends on the colour space.

If the current stroking colour space is a Pattern colour space, name shall be the name of an entry in the Pattern subdictionary of the current resource dictionary. 
For an uncoloured tiling pattern (PatternType = 1 and PaintType = 2), c1…cn shall be component values specifying a colour in the pattern’s underlying colour space. 
For other types of patterns, these operands shall not be specified.
"
Class {
	#name : #PtSetStrokingColorSpecial,
	#superclass : #PtColourOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #accessing }
PtSetStrokingColorSpecial class >> documentation [
	^'Same as SC but also supports Pattern, Separation, DeviceN and ICCBased colour spaces. If the current stroking colour space is a Separation, DeviceN, or ICCBased colour space, the operands c1…cn shall be numbers. The number of operands and their interpretation depends on the colour space.

If the current stroking colour space is a Pattern colour space, name shall be the name of an entry in the Pattern subdictionary of the current resource dictionary. For an uncoloured tiling pattern (PatternType = 1 and PaintType = 2), c1…cn shall be component values specifying a colour in the pattern’s underlying colour space. For other types of patterns, these operands shall not be specified.'
]

{ #category : #accessing }
PtSetStrokingColorSpecial class >> operandTypes [
	^#(#('cn' Number) #('name' Number))
]

{ #category : #accessing }
PtSetStrokingColorSpecial class >> operatorName [
	^#SCN
]

{ #category : #accessing }
PtSetStrokingColorSpecial class >> pdfVersion [
	^PtVersion pdf1_2
]

{ #category : #actions }
PtSetStrokingColorSpecial >> modify: aProcessor with: aResource [
	(aProcessor graphicsState colorSpaceStroking isKindOf: (PtPDF classAt: #Pattern)) ifTrue: [
		^aProcessor graphicsState at: #colorStroking put: (self operands content allButLast: 1)].
	aProcessor graphicsState at: #colorStroking put: self operands
]

{ #category : #accessing }
PtSetStrokingColorSpecial >> resourceIn: aPageGraphics [
	(aPageGraphics graphicsState colorSpaceStroking isKindOf: (PtPDF classAt: #Pattern)) ifTrue: [
		^aPageGraphics resources Pattern objectAt: self operands last content].
	^nil
]
