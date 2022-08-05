"
DictionaryPrintvalue is used for printing Dictionaries

Instance Variables:
	arguments	<SequenceableCollection of DictionaryPrintargument>	the Printarguments for each entry
"
Class {
	#name : #DictionaryPrintvalue,
	#superclass : #Printvalue,
	#instVars : [
		'arguments',
		'isOrdered'
	],
	#category : #Values
}

{ #category : #'instance creation optional' }
DictionaryPrintvalue class >> arguments: argumentsArray [
	^self arguments: argumentsArray isOrdered: nil
]

{ #category : #'instance creation' }
DictionaryPrintvalue class >> arguments: argumentsArray isOrdered: isOrderedBoolean [
	| inst |
	inst := self new.
	inst initializeArguments: argumentsArray isOrdered: isOrderedBoolean.
	^inst
]

{ #category : #'instance creation optional' }
DictionaryPrintvalue class >> isOrdered: isOrderedBoolean [
	^self arguments: nil isOrdered: isOrderedBoolean
]

{ #category : #specification }
DictionaryPrintvalue class >> localSpecification [
	<sequence: #arguments>
	<optional: #isOrdered class: #Boolean default: 'false'>
]

{ #category : #accessing }
DictionaryPrintvalue >> arguments [
	"<Array>"

	^arguments ifNil: [#()]
]

{ #category : #'initialize-release' }
DictionaryPrintvalue >> initializeArguments: argumentsArray isOrdered: isOrderedBoolean [
	(argumentsArray notNil and: [
	argumentsArray notEmpty]) ifTrue: [
			arguments := (Array withAll: argumentsArray) beImmutable].
	(isOrderedBoolean notNil and: [
	self isOrdered ~= isOrderedBoolean]) ifTrue: [
			isOrdered := isOrderedBoolean].
	self beImmutable
]

{ #category : #testing }
DictionaryPrintvalue >> isEmpty [
	^self arguments isEmpty
]

{ #category : #testing }
DictionaryPrintvalue >> isLine [
	^self isEmpty
]

{ #category : #accessing }
DictionaryPrintvalue >> isOrdered [
	"<Boolean>"

	^isOrdered ifNil: [false]
]

{ #category : #printing }
DictionaryPrintvalue >> printvalueWith: printer [
	| args |
	args := OrderedCollection new.
	args add: (printer array: 'arguments' value: self arguments).
	args add: (printer optional: 'isOrdered' value: isOrdered).
	^printer printvalue: self arguments: args
]

{ #category : #accessing }
DictionaryPrintvalue >> sourceWith: emitter [
	self isEmpty ifTrue: [
		^emitter emit: self targetClassname , ' new'].
	emitter emitDictionarySourceFor: self
]

{ #category : #accessing }
DictionaryPrintvalue >> targetClass [
	^self isOrdered
		ifTrue: [Valuemap]
		ifFalse: [Dictionary]
]

{ #category : #accessing }
DictionaryPrintvalue >> targetClassname [
	^self targetClass name asString
]
