"
PLRM.pdf 3.2.2 p.46
"
Class {
	#name : #PSProcedure,
	#superclass : #Object,
	#instVars : [
		'objects'
	],
	#category : #PostScript
}

{ #category : #'instance creation' }
PSProcedure class >> source: aString [
	| scanner objects |
	scanner := PSScanner on: aString.
	objects := OrderedCollection new.
	[scanner atEnd] whileFalse: [objects add: scanner nextPostScriptObject].
	^self withAll: objects
]

{ #category : #'instance creation' }
PSProcedure class >> withAll: aCollection [
	| inst |
	inst := self new.
	inst initializeObjects: aCollection.
	^inst
]

{ #category : #converting }
PSProcedure >> asPostScriptLiteral [
	^self objects asArray
]

{ #category : #actions }
PSProcedure >> doIn: aPostScriptInterpreter [
	self objects isEmpty ifTrue: [
		^self].
	aPostScriptInterpreter executionStack push: self.
	self objects do: [:object | object processIn: aPostScriptInterpreter].
	aPostScriptInterpreter executionStack pop
]

{ #category : #'initialize-release' }
PSProcedure >> initializeObjects: aCollection [
	objects := nil.
	self objects addAll: aCollection
]

{ #category : #accessing }
PSProcedure >> objects [
	^objects ifNil: [objects := OrderedCollection new]
]

{ #category : #printing }
PSProcedure >> printOn: stream [
	self printPostScriptOn: stream
]

{ #category : #printing }
PSProcedure >> printPostScriptOn: aStream [
	aStream nextPutAll: '{'.
	self objects do: [:object | object printPostScriptOn: aStream] separatedBy: [
		aStream space].
	aStream nextPutAll: '}'
]
