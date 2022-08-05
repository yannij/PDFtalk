"
TextLineEmitter emits text as one line
"
Class {
	#name : #TextLineEmitter,
	#superclass : #TextEmitter,
	#category : #Values
}

{ #category : #writing }
TextLineEmitter >> emitSeparator [
	self stream space
]
