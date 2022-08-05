"
Set the colour to use for stroking operations in a device, CIE-based (other than ICCBased), or Indexed colour space. 
The number of operands required and their interpretation depends on the current stroking colour space:
For DeviceGray, CalGray, and Indexed colour spaces, one operand shall be required (n = 1).
For DeviceRGB, CalRGB, and Lab colour spaces, three operands shall be required (n = 3).
For DeviceCMYK, four operands shall be required (n = 4).
"
Class {
	#name : #PtSetStrokingColor,
	#superclass : #PtColourOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #accessing }
PtSetStrokingColor class >> documentation [
	^'Set the colour to use for stroking operations in a device, CIE-based (other than ICCBased), or Indexed colour space. The number of operands required and their interpretation depends on the current stroking colour space: For DeviceGray, CalGray, and Indexed colour spaces, one operand shall be required (n = 1). For DeviceRGB, CalRGB, and Lab colour spaces, three operands shall be required (n = 3). For DeviceCMYK, four operands shall be required (n = 4)'
]

{ #category : #accessing }
PtSetStrokingColor class >> operandTypes [
	^#(#('cn' Number))
]

{ #category : #accessing }
PtSetStrokingColor class >> operatorName [
	^#SC
]

{ #category : #accessing }
PtSetStrokingColor class >> pdfVersion [
	^PtVersion pdf1_1
]

{ #category : #actions }
PtSetStrokingColor >> modify: aProcessor with: aResource [
	aProcessor graphicsState at: #colorStroking put: self operands
]
