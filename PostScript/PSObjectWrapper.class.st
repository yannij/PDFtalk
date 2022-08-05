"
Wrapper for native objects with additional PostScript behavior
"
Class {
	#name : #PSObjectWrapper,
	#superclass : #Object,
	#instVars : [
		'object'
	],
	#category : #PostScript
}

{ #category : #'instance creation' }
PSObjectWrapper class >> on: anObject [
	| inst |
	inst := self new.
	inst initializeObject: anObject.
	^inst
]

{ #category : #comparing }
PSObjectWrapper >> = anObject [
	^self class == anObject class and: [
	self object = anObject object]
]

{ #category : #converting }
PSObjectWrapper >> asPostScriptString [
	^self printPostScript
]

{ #category : #comparing }
PSObjectWrapper >> hash [
	^self object hash
]

{ #category : #'initialize-release' }
PSObjectWrapper >> initializeObject: anObject [
	object := anObject
]

{ #category : #accessing }
PSObjectWrapper >> object [
	^object
]

{ #category : #accessing }
PSObjectWrapper >> size [
	^self object size
]
