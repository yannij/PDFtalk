"
ArrayPrintvalue is a special Printvalue for sequentiable collections of Values
"
Class {
	#name : #ArrayPrintvalue,
	#superclass : #Printvalue,
	#instVars : [
		'arguments'
	],
	#category : #Values
}

{ #category : #'instance creation' }
ArrayPrintvalue class >> arguments: argumentsArray [
	| inst |
	inst := self new.
	inst initializeArguments: argumentsArray.
	^inst
]

{ #category : #specification }
ArrayPrintvalue class >> localSpecification [
	<sequence: #arguments>
]

{ #category : #accessing }
ArrayPrintvalue >> arguments [
	"<Array>"

	^arguments ifNil: [#()]
]

{ #category : #'initialize-release' }
ArrayPrintvalue >> initializeArguments: argumentsArray [
	(argumentsArray notNil and: [
	argumentsArray notEmpty]) ifTrue: [
			arguments := (Array withAll: argumentsArray) beImmutable].
	self beImmutable
]

{ #category : #testing }
ArrayPrintvalue >> isLine [
	^self arguments size = 1 or: [
	self arguments size < 5 and: [
	self arguments allSatisfy: [:arg | arg isSimple]]]
]

{ #category : #printing }
ArrayPrintvalue >> printvalueWith: printer [
	| args |
	args := OrderedCollection new.
	args add: (printer array: 'arguments' value: self arguments).
	^printer printvalue: self arguments: args
]

{ #category : #accessing }
ArrayPrintvalue >> sourceWith: emitter [
	emitter emitArraySourceFor: self arguments
]
