"
Text in one line with uniform attributes resulting from one text showing operation

The text cannot contain line breaks
"
Class {
	#name : #PtTextspan,
	#superclass : #PtGraphicelement,
	#instVars : [
		'font'
	],
	#category : #'PDFtalk-Graphics'
}

{ #category : #'instance creation' }
PtTextspan class >> operations: someOperations state: aGraphicsState font: aFont [
	| inst |
	inst := self new.
	inst initializeOperations: someOperations state: aGraphicsState font: aFont.
	^inst
]

{ #category : #accessing }
PtTextspan >> effectiveFontSize [
	"<Number>
	the scaled font size"

	^(self state textMatrix transformedDelta: 0 @ self state fontSize) y
]

{ #category : #accessing }
PtTextspan >> font [
	"<PDFtalk font>"

	^font
]

{ #category : #accessing }
PtTextspan >> fontSize [
	"<Number>"

	^self state fontSize
]

{ #category : #accessing }
PtTextspan >> fontSymbol [
	"<Symbol>"

	^self state textFont asSmalltalkValue
]

{ #category : #'initialize-release' }
PtTextspan >> initializeOperations: someOperations state: aGraphicsState font: aFont [
	self initializeOperations: someOperations state: aGraphicsState.
	font := aFont
]

{ #category : #accessing }
PtTextspan >> position [
	"<Point>
	the text insertion point"

	^self state textMatrix transformedZero
]

{ #category : #printing }
PtTextspan >> printOn: stream [
	stream
		nextPutAll: self class name asString;
		nextPut: $(;
		nextPutAll: (self string first: 10).
	self string size > 10 ifTrue: [
		stream nextPutAll: '...'].
	stream nextPut: $).
	^stream contents
]

{ #category : #accessing }
PtTextspan >> resource [
	^self font
]

{ #category : #accessing }
PtTextspan >> string [
	"<String>
	the decoded unicode string"

	^self font decodedString: self stringBytes
]

{ #category : #accessing }
PtTextspan >> stringBytes [
	"<ByteArray>"

	^self operation stringBytes
]

{ #category : #accessing }
PtTextspan >> strings [
	^Array with: self string
]

{ #category : #accessing }
PtTextspan >> textWidth [
	"<Number> in page space
	the distance from the start of the receiver to the start of the Textspan after the receiver"

	^self operation widthInFont: self font inState: self state
]

{ #category : #accessing }
PtTextspan >> yPosition [
	"<Number>"

	^self position y
]
