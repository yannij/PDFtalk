"
an Operator in a CFF DICT
"
Class {
	#name : #CFFOperator,
	#superclass : #Value,
	#instVars : [
		'value'
	],
	#category : #'PDFtalk-Fonts CompactFontFormat'
}

{ #category : #specification }
CFFOperator class >> localSpecification [
	<constant: #value class: #SmallInteger>
]

{ #category : #accessing }
CFFOperator class >> namesDictionary [
	"<Dictionary key: Integer value: String>"

	^self subclassResponsibility
]

{ #category : #'instance creation' }
CFFOperator class >> value: valueSmallInteger [
	| inst |
	inst := self new.
	inst initializeValue: valueSmallInteger.
	^inst
]

{ #category : #'initialize-release' }
CFFOperator >> initializeValue: valueSmallInteger [
	value := valueSmallInteger.
	self beImmutable
]

{ #category : #testing }
CFFOperator >> isExtended: integer [
	^false
]

{ #category : #testing }
CFFOperator >> isSimple: integer [
	^self value = integer
]

{ #category : #accessing }
CFFOperator >> name [
	"<String>"

	^self class namesDictionary at: self value ifAbsent: ['unknown']
]

{ #category : #printing }
CFFOperator >> printOn: stream [
	stream
		nextPutAll: self class name;
		nextPut: $(;
		nextPutAll: self name;
		nextPut: $)
]

{ #category : #printing }
CFFOperator >> printvalueWith: printer [
	| args |
	args := OrderedCollection new.
	args add: (printer constant: 'value' value: self value).
	^printer printvalue: self arguments: args
]

{ #category : #accessing }
CFFOperator >> value [
	"<SmallInteger>"

	^value
]
