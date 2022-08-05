"
A Printargument holds the data to print one instance variable (constant) and its value.

	- name 	<String> 		the name of the argument
	- value 	<Printvalue>	the print value of the value

With Printvalue it represents the source for a Value
"
Class {
	#name : #Printargument,
	#superclass : #Value,
	#instVars : [
		'name',
		'value'
	],
	#category : #Values
}

{ #category : #specification }
Printargument class >> localSpecification [
	<constant: #name class: #String>
	<constant: #value class: #Printvalue>
]

{ #category : #'instance creation' }
Printargument class >> name: nameString value: valuePrintvalue [
	| inst |
	inst := self new.
	inst initializeName: nameString value: valuePrintvalue.
	^inst
]

{ #category : #'initialize-release' }
Printargument >> initializeName: nameString value: valuePrintvalue [
	name := nameString.
	value := valuePrintvalue.
	self beImmutable
]

{ #category : #testing }
Printargument >> isSimple [
	^self value isSimple
]

{ #category : #accessing }
Printargument >> name [
	"<String>"

	^name
]

{ #category : #printing }
Printargument >> printvalueWith: printer [
	| args |
	args := OrderedCollection new.
	args add: (printer constant: 'name' value: self name).
	args add: (printer constant: 'value' value: self value).
	^printer printvalue: self arguments: args
]

{ #category : #accessing }
Printargument >> sourceWith: emitter [
	emitter emitArgument: self
]

{ #category : #accessing }
Printargument >> value [
	"<Printvalue>"

	^value
]
