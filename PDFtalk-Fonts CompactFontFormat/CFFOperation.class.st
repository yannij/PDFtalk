"
a CFF operation with operands and operator
"
Class {
	#name : #CFFOperation,
	#superclass : #Value,
	#instVars : [
		'operator',
		'operands'
	],
	#category : #'PDFtalk-Fonts CompactFontFormat'
}

{ #category : #specification }
CFFOperation class >> localSpecification [
	<constant: #operator class: #CFFOperator>
	<sequence: #operands>
]

{ #category : #'instance creation optional' }
CFFOperation class >> operator: operatorOperator [
	| inst |
	inst := self new.
	inst initializeOperator: operatorOperator operands: nil.
	^inst
]

{ #category : #'instance creation' }
CFFOperation class >> operator: operatorOperator operands: operandsArray [
	| inst |
	inst := self new.
	inst initializeOperator: operatorOperator operands: operandsArray.
	^inst
]

{ #category : #'initialize-release' }
CFFOperation >> initializeOperator: operatorOperator operands: operandsArray [
	operator := operatorOperator.
	(operandsArray notNil and: [
	operandsArray notEmpty]) ifTrue: [
			operands := (Array withAll: operandsArray) beImmutable].
	self beImmutable
]

{ #category : #testing }
CFFOperation >> isExtended: integer [
	^self operator isExtended: integer
]

{ #category : #testing }
CFFOperation >> isSimple: integer [
	^self operator isSimple: integer
]

{ #category : #accessing }
CFFOperation >> operands [
	"<Array>"

	^operands ifNil: [#()]
]

{ #category : #accessing }
CFFOperation >> operator [
	"<Operator>"

	^operator
]

{ #category : #printing }
CFFOperation >> printOn: stream [
	self operands do: [:arg |
		stream
			nextPutAll: arg printString;
			space].
	stream nextPutAll: self operator name
]

{ #category : #printing }
CFFOperation >> printvalueWith: printer [
	| args |
	args := OrderedCollection new.
	args add: (printer constant: 'operator' value: self operator).
	args add: (printer array: 'operands' value: self operands).
	^printer printvalue: self arguments: args
]
