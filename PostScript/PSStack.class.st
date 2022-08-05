"
A stack supporting basic operations for the PostScript interpreter

The objects are held in an OrderedCollection named #objects
"
Class {
	#name : #PSStack,
	#superclass : #Object,
	#instVars : [
		'objects'
	],
	#category : #PostScript
}

{ #category : #accessing }
PSStack >> at: zeroBasedIndex [
	self objects size <= zeroBasedIndex ifTrue: [
		^PSStackunderflow raiseSignal].
	^self objects at: zeroBasedIndex + 1
]

{ #category : #accessing }
PSStack >> indexOf: anObject [
	^self objects indexOf: anObject
]

{ #category : #testing }
PSStack >> isEmpty [
	^self objects isEmpty
]

{ #category : #accessing }
PSStack >> objects [
	"<OrderedCollection>"

	^objects ifNil: [objects := OrderedCollection new]
]

{ #category : #actions }
PSStack >> pop [
	self objects isEmpty ifTrue: [
		^PSStackunderflow raiseSignal].
	^self objects removeFirst
]

{ #category : #actions }
PSStack >> popTill: anObject [
	"<OrderedCollection of: Object>
	pops all elements off the receiver including anObject"

	| list |
	list := OrderedCollection new.
	[self top = anObject] whileFalse: [list add: self pop].
	self pop.
	^list
]

{ #category : #actions }
PSStack >> popTillMark [
	"<OrderedCollection of: Object>
	in the order: top-of-stack first continuing towards the bottom-of-stack"

	^self popTill: PSMark new
]

{ #category : #printing }
PSStack >> printOn: stream [
	self printPostScriptOn: stream
]

{ #category : #printing }
PSStack >> printPostScriptOn: aStream [
	aStream nextPutAll: '|| '.
	self objects reverse do: [:object | object printPostScriptOn: aStream] separatedBy: [
		aStream space].
	aStream nextPutAll: ' <'
]

{ #category : #actions }
PSStack >> push: anObject [
	^self objects addFirst: anObject
]

{ #category : #accessing }
PSStack >> size [
	^self objects size
]

{ #category : #accessing }
PSStack >> top [
	self objects isEmpty ifTrue: [
		^PSStackunderflow raiseSignal].
	^self objects first
]
