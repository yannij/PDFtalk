"
Operation not known in PDF

Occurs when there are rrors in the content stream
"
Class {
	#name : #PtUnknownOperation,
	#superclass : #PtOperation,
	#instVars : [
		'operatorName'
	],
	#category : #'PDFtalk-Graphics'
}

{ #category : #accessing }
PtUnknownOperation class >> documentation [
	^'Error in the contents stream'
]

{ #category : #specification }
PtUnknownOperation class >> localSpecification [
	<constant: #operatorName class: #Symbol comment: 'token of the unknown operator'>
	<sequence: #operands>
]

{ #category : #accessing }
PtUnknownOperation class >> operatorName [
	"implemented by the instances"

	^self shouldNotImplement
]

{ #category : #'instance creation optional' }
PtUnknownOperation class >> operatorName: operatorNameSymbol [
	^self operatorName: operatorNameSymbol operands: nil
]

{ #category : #'instance creation' }
PtUnknownOperation class >> operatorName: operatorNameSymbol operands: operandsArray [
	| inst |
	inst := self new.
	inst initializeOperatorName: operatorNameSymbol operands: operandsArray.
	^inst
]

{ #category : #testing }
PtUnknownOperation class >> usedForLookup [
	^false
]

{ #category : #'initialize-release' }
PtUnknownOperation >> initializeOperatorName: operatorNameSymbol operands: operandsArray [
	operatorName := operatorNameSymbol.
	(operandsArray notNil and: [
	operandsArray notEmpty]) ifTrue: [
			operands := (Array withAll: operandsArray) beImmutable].
	self beImmutable
]

{ #category : #copying }
PtUnknownOperation >> operands: someOperands [
	^self class operatorName: self operatorName operands: someOperands
]

{ #category : #accessing }
PtUnknownOperation >> operatorName [
	"<Symbol>
	token of the unknown operator"

	^operatorName
]

{ #category : #printing }
PtUnknownOperation >> printvalueWith: printer [
	| args |
	args := OrderedCollection new.
	args add: (printer constant: 'operatorName' value: self operatorName).
	args add: (printer array: 'operands' value: self operands).
	^printer printvalue: self arguments: args
]
