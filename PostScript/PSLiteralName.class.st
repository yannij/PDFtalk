"
PLRM.pdf 3.2.2 p.45
"
Class {
	#name : #PSLiteralName,
	#superclass : #PSObjectWrapper,
	#category : #PostScript
}

{ #category : #'instance creation' }
PSLiteralName class >> for: aString [
	^self on: aString
]

{ #category : #converting }
PSLiteralName >> asPostScriptExecutable [
	^self object
]

{ #category : #converting }
PSLiteralName >> asString [
	^self object asString
]

{ #category : #testing }
PSLiteralName >> postScriptEqual: anObject [
	^self asString = anObject asString
]

{ #category : #accessing }
PSLiteralName >> postScriptKey [
	"<Symbol>"

	^self object
]

{ #category : #accessing }
PSLiteralName >> postScriptType [
	^#nametype
]

{ #category : #printing }
PSLiteralName >> printOn: stream [
	stream nextPut: $/.
	stream nextPutAll: self object asString
]
