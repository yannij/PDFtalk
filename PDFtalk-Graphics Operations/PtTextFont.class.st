"
Set the text font, Tf, to font and the text font size, Tfs, to size. 
font shall be the name of a font resource in the Font subdictionary of the current resource dictionary; 
size shall be a number representing a scale factor. 
There is no initial value for either font or size; they shall be specified explicitly by using Tf before any text is shown
"
Class {
	#name : #PtTextFont,
	#superclass : #PtTextStateOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #accessing }
PtTextFont class >> documentation [
	^'Set the text font, Tf, to font and the text font size, Tfs, to size. font shall be the name of a font resource in the Font subdictionary of the current resource dictionary; size shall be a number representing a scale factor. There is no initial value for either font or size; they shall be specified explicitly by using Tf before any text is shown'
]

{ #category : #accessing }
PtTextFont class >> operandTypes [
	^#(#('font' Name) #('size' Number))
]

{ #category : #accessing }
PtTextFont class >> operatorName [
	^#Tf
]

{ #category : #actions }
PtTextFont >> modify: aProcessor with: aResource [
	aProcessor graphicsState at: #textFont put: self operands first.
	aProcessor graphicsState at: #textFontSize put: self operands last.
	aProcessor currentFont: aResource
]

{ #category : #accessing }
PtTextFont >> resourceIn: aPageGraphics [
	^aPageGraphics resources Font objectAt: self operands first content
]
