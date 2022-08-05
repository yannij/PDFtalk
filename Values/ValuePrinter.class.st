"
ValuePrinter creates the source for a Value.
For each level, a new ValuePrinter is created.

The target class is the compilation target of the created source, as if the source is compiled as method of that class.
The scoping from the target defines how class names are printed (with or without namespaces).
"
Class {
	#name : #ValuePrinter,
	#superclass : #Object,
	#instVars : [
		'target'
	],
	#category : #Values
}

{ #category : #'instance creation' }
ValuePrinter class >> newFor: targetClass [
	| inst |
	inst := self new.
	inst initializeTarget: targetClass.
	^inst
]

{ #category : #accessing }
ValuePrinter >> array: selectorname value: object [
	"<Printargument | nil>"

	object isEmpty ifTrue: [
		^nil].
	^Printargument name: selectorname value: (object printvalueWith: self)
]

{ #category : #accessing }
ValuePrinter >> classnameOf: value [
	^value class nameRelativeTo: self target
]

{ #category : #accessing }
ValuePrinter >> constant: selectorname value: object [
	"<Printargument>"

	^Printargument name: selectorname value: (object printvalueWith: self)
]

{ #category : #accessing }
ValuePrinter >> dictionary: selectorname value: object [
	"<Printargument | nil>"

	object isEmpty ifTrue: [
		^nil].
	^Printargument name: selectorname value: (object printvalueWith: self)
]

{ #category : #'initialize-release' }
ValuePrinter >> initializeTarget: targetClass [
	target := targetClass
]

{ #category : #accessing }
ValuePrinter >> optional: selectorname value: object [
	"<Printargument | nil>"

	^object ifNotNil: [
		Printargument name: selectorname value: (object printvalueWith: self)]
]

{ #category : #accessing }
ValuePrinter >> printvalue: aValue arguments: arguments [
	aValue class new = aValue ifTrue: [
		^ValuePrintvalue classname: (self classnameOf: aValue)].
	^ValuePrintvalue
		classname: (self classnameOf: aValue)
		arguments: (arguments select: [:arg |
			arg notNil])
]

{ #category : #accessing }
ValuePrinter >> target [
	"<Value class>
	the class for which the object is printed as if the generated source is included into a method of the class.
	Takes the visibility of classes into account for class name generation (with or without namespaces)"

	^target
]
