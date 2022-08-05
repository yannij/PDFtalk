"
Same as CS but used for nonstroking operations.
"
Class {
	#name : #PtSetNonStrokingColorSpace,
	#superclass : #PtColourOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #accessing }
PtSetNonStrokingColorSpace class >> documentation [
	^'Same as CS but used for nonstroking operations'
]

{ #category : #accessing }
PtSetNonStrokingColorSpace class >> operandTypes [
	^#(#('name' #Name))
]

{ #category : #accessing }
PtSetNonStrokingColorSpace class >> operatorName [
	^#cs
]

{ #category : #accessing }
PtSetNonStrokingColorSpace class >> pdfVersion [
	^PtVersion pdf1_1
]

{ #category : #actions }
PtSetNonStrokingColorSpace >> modify: aProcessor with: aResource [
	| colorspace |
	colorspace := (#(#DeviceGray #DeviceRGB #DeviceCMYK #Pattern) includes: self operands first content)
		ifTrue: [self operands first asType: (PtDirectType onSymbol: #ColourSpace)]
		ifFalse: [self resourceIn: aProcessor].
	aProcessor graphicsState at: #colorSpaceNonstroking put: colorspace
]

{ #category : #accessing }
PtSetNonStrokingColorSpace >> resourceIn: aPageGraphics [
	(#(#DeviceGray #DeviceRGB #DeviceCMYK #Pattern) includes: self operands first asSmalltalkValue) ifFalse: [
		^aPageGraphics resources ColorSpace objectAt: self operands first asSmalltalkValue].
	^nil
]
