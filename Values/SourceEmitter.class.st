"
SourceEmitter outputs source code.
"
Class {
	#name : #SourceEmitter,
	#superclass : #Emitter,
	#category : #Values
}

{ #category : #accessing }
SourceEmitter >> emitterClassFor: printvalue [
	^printvalue isLine
		ifTrue: [LineEmitter]
		ifFalse: [BlockEmitter]
]

{ #category : #accessing }
SourceEmitter >> streamClass [
	^WriteStream
]
