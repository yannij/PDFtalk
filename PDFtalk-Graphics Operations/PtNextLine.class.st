"
Move to the start of the next line. This operator has the same effect as the code
	0 -Tl Td
where Tl denotes the current leading parameter in the text state. 
The negative of Tl is used here because Tl is the text leading expressed as a positive number. 
Going to the next line entails decreasing the y coordinate
"
Class {
	#name : #PtNextLine,
	#superclass : #PtTextPositioningOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #accessing }
PtNextLine class >> documentation [
	^'Move to the start of the next line. This operator has the same effect as the code
	0 -Tl Td
where Tl denotes the current leading parameter in the text state. The negative of Tl is used here because Tl is the text leading expressed as a positive number. Going to the next line entails decreasing the y coordinate'
]

{ #category : #accessing }
PtNextLine class >> operatorName [
	^#'T*'
]

{ #category : #actions }
PtNextLine >> modify: aProcessor with: aResource [
	aProcessor graphicsState nextLineBy: 0 @ aProcessor graphicsState leading content negated
]
