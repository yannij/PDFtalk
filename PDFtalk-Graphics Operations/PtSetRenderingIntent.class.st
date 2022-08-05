"
Set the colour rendering intent in the graphics state
"
Class {
	#name : #PtSetRenderingIntent,
	#superclass : #PtGraphicsStateOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #accessing }
PtSetRenderingIntent class >> documentation [
	^'Set the colour rendering intent in the graphics state'
]

{ #category : #accessing }
PtSetRenderingIntent class >> operandTypes [
	^#(#('intent' Name))
]

{ #category : #accessing }
PtSetRenderingIntent class >> operatorName [
	^#ri
]

{ #category : #accessing }
PtSetRenderingIntent class >> pdfVersion [
	^PtVersion pdf1_1
]

{ #category : #actions }
PtSetRenderingIntent >> modify: aProcessor with: aResource [
	aProcessor graphicsState at: #renderingIntent put: self operands first
]
