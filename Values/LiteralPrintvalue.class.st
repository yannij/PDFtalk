"
LiteralPrintvalue is a Printvalue for literals.

Instance Variables:
	string	<String>	the representation as a string
"
Class {
	#name : #LiteralPrintvalue,
	#superclass : #Printvalue,
	#instVars : [
		'string'
	],
	#category : #Values
}

{ #category : #specification }
LiteralPrintvalue class >> localSpecification [
	<constant: #string class: #String>
]

{ #category : #'instance creation' }
LiteralPrintvalue class >> string: stringString [
	| inst |
	inst := self new.
	inst initializeString: stringString.
	^inst
]

{ #category : #'initialize-release' }
LiteralPrintvalue >> initializeString: stringString [
	string := stringString.
	self beImmutable
]

{ #category : #testing }
LiteralPrintvalue >> isLine [
	^true
]

{ #category : #testing }
LiteralPrintvalue >> isSimple [
	^(self string first = $() not
]

{ #category : #printing }
LiteralPrintvalue >> printvalueWith: printer [
	| args |
	args := OrderedCollection new.
	args add: (printer constant: 'string' value: self string).
	^printer printvalue: self arguments: args
]

{ #category : #accessing }
LiteralPrintvalue >> sourceWith: emitter [
	emitter emitValue: self string
]

{ #category : #accessing }
LiteralPrintvalue >> string [
	"<String>"

	^string
]
