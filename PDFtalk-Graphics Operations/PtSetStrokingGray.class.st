"
Set the stroking colour space to DeviceGray (or the DefaultGray colour space) and set the gray level to use for stroking operations. 
gray shall be a number between 0.0 (black) and 1.0 (white).
"
Class {
	#name : #PtSetStrokingGray,
	#superclass : #PtColourOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #accessing }
PtSetStrokingGray class >> documentation [
	^'Set the stroking colour space to DeviceGray (or the DefaultGray colour space) and set the gray level to use for stroking operations. gray shall be a number between 0.0 (black) and 1.0 (white)'
]

{ #category : #accessing }
PtSetStrokingGray class >> operandTypes [
	^#(#('gray' Number))
]

{ #category : #accessing }
PtSetStrokingGray class >> operatorName [
	^#G
]

{ #category : #actions }
PtSetStrokingGray >> modify: aProcessor with: aResource [
	aProcessor graphicsState at: #colorSpaceStroking put: (PtPDF classAt: #DeviceGray) new.
	aProcessor graphicsState at: #colorStroking put: self operands
]
