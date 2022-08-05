"
Set the specified parameters in the graphics state. 
dictName shall be the name of a graphics state parameter dictionary in the ExtGState subdictionary of the current resource dictionary
"
Class {
	#name : #PtSetGraphicsState,
	#superclass : #PtGraphicsStateOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #accessing }
PtSetGraphicsState class >> documentation [
	^'Set the specified parameters in the graphics state. dictName shall be the name of a graphics state parameter dictionary in the ExtGState subdictionary of the current resource dictionary'
]

{ #category : #accessing }
PtSetGraphicsState class >> operandTypes [
	^#(#('dictName' Name))
]

{ #category : #accessing }
PtSetGraphicsState class >> operatorName [
	^#gs
]

{ #category : #accessing }
PtSetGraphicsState class >> pdfVersion [
	^PtVersion pdf1_2
]

{ #category : #actions }
PtSetGraphicsState >> modify: aProcessor with: anExtGState [
	| default specialBehaviors |
	default := PtGraphicsState new.
	specialBehaviors := Dictionary new.
	specialBehaviors at: #Type put: [:gs :value | ].
	specialBehaviors at: #OP put: [:gs :value |
		gs at: #overprintStroking put: value.
		(anExtGState content includesKey: #op) ifFalse: [
			gs at: #overprintNonstroking put: value]].
	specialBehaviors at: #Font put: [:gs :value |
		gs at: #textFont put: (aProcessor resources Font keyAtValue: value first).
		gs at: #textFontSize put: value last].
	specialBehaviors at: #BG2 put: [:gs :value |
		gs
			at: #blackGeneration
			put: (value = #Default
				ifTrue: [
				default blackGeneration]
				ifFalse: [
				value])].
	specialBehaviors at: #UCR2 put: [:gs :value |
		gs
			at: #undercolorRemoval
			put: (value = #Default
				ifTrue: [
				default undercolorRemoval]
				ifFalse: [
				value])].
	specialBehaviors at: #TR2 put: [:gs :value |
		gs
			at: #transfer
			put: (value = #Default
				ifTrue: [default transfer]
				ifFalse: [
				value])].
	anExtGState keysAndValuesDo: [:key :value |
		(anExtGState gsStateAttributeFor: key)
			ifNotNil: [:gsKey |
			aProcessor graphicsState at: gsKey put: value]
			ifNil: [
			(specialBehaviors at: key) value: aProcessor graphicsState value: value]]
]

{ #category : #accessing }
PtSetGraphicsState >> resourceIn: aProcessor [
	^aProcessor resources ExtGState objectAt: self operands first content
]
