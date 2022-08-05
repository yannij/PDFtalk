"
Library

#findresource returns a dictionary of the library.

Holds a one argument block as action.
The action is executed with an interpreter as argument.
"
Class {
	#name : #PSProcSet,
	#superclass : #Object,
	#instVars : [
		'action'
	],
	#category : #PostScript
}

{ #category : #'instance creation' }
PSProcSet class >> action: oneArgumentBlock [
	| inst |
	inst := self new.
	inst initializeAction: oneArgumentBlock.
	^inst
]

{ #category : #accessing }
PSProcSet class >> notImplemented [
	^self action: [:ps | ps error: 'This operator is not implemented']
]

{ #category : #accessing }
PSProcSet class >> operators [
	"<Dictionary key: Symbol value: BuildIn>
	self operators"

	| dict |
	dict := IdentityDictionary new.
	(Pragma allNamed: #operator in: self class) do: [:pragma |
		| operator |
		operator := self perform: pragma methodSelector.
		dict at: pragma methodSelector put: operator].
	(Pragma allNamed: #operator: in: self class) do: [:pragma |
		| symbol operator |
		symbol := pragma message arguments first.
		operator := self perform: pragma methodSelector.
		dict at: symbol put: operator].
	^dict
]

{ #category : #accessing }
PSProcSet class >> pragmas [
	<pragmas: #class>

	^#(operator operator:)
]

{ #category : #accessing }
PSProcSet >> action [
	"<BlockClosure with: Interpreter>"

	^action
]

{ #category : #actions }
PSProcSet >> doIn: aPostScriptInterpreter [
	self action value: aPostScriptInterpreter
]

{ #category : #accessing }
PSProcSet >> initializeAction: oneArgumentBlock [
	action := oneArgumentBlock
]

{ #category : #accessing }
PSProcSet >> postScriptType [
	^#operatortype
]
