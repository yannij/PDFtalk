"
ValuePrintvalue holds the data to print a Value.

Instance Variables:
	arguments	<SequenceableCollection of: (Printargument | EmptyArgument)>	the arguments
	classname	<String>														the namespace aware name of the class


"
Class {
	#name : #ValuePrintvalue,
	#superclass : #Printvalue,
	#instVars : [
		'classname',
		'arguments'
	],
	#category : #Values
}

{ #category : #'instance creation optional' }
ValuePrintvalue class >> classname: classnameString [
	^self classname: classnameString arguments: nil
]

{ #category : #'instance creation' }
ValuePrintvalue class >> classname: classnameString arguments: argumentsArray [
	| inst |
	inst := self new.
	inst initializeClassname: classnameString arguments: argumentsArray.
	^inst
]

{ #category : #specification }
ValuePrintvalue class >> localSpecification [
	<constant: #classname class: #String>
	<sequence: #arguments>
]

{ #category : #accessing }
ValuePrintvalue >> arguments [
	"<Array>"

	^arguments ifNil: [#()]
]

{ #category : #accessing }
ValuePrintvalue >> classname [
	"<String>"

	^classname
]

{ #category : #'initialize-release' }
ValuePrintvalue >> initializeClassname: classnameString arguments: argumentsArray [
	classname := classnameString.
	(argumentsArray notNil and: [
	argumentsArray notEmpty]) ifTrue: [
			arguments := (Array withAll: argumentsArray) beImmutable].
	self beImmutable
]

{ #category : #testing }
ValuePrintvalue >> isLine [
	self arguments size = 1 ifTrue: [
		^self arguments first value isLine].
	^self arguments size < 5 and: [
	self arguments allSatisfy: [:arg | arg isSimple]]
]

{ #category : #printing }
ValuePrintvalue >> printvalueWith: printer [
	| args |
	args := OrderedCollection new.
	args add: (printer constant: 'classname' value: self classname).
	args add: (printer array: 'arguments' value: self arguments).
	^printer printvalue: self arguments: args
]

{ #category : #accessing }
ValuePrintvalue >> sourceWith: emitter [
	self arguments isEmpty ifTrue: [
		^emitter emitEmpty: self].
	emitter inBracketsDo: [
		emitter emitClass: self classname.
		self arguments do: [:arg |
			emitter emitSeparator.
			emitter emitArgument: arg]]
]
