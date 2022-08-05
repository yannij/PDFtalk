"
Emits source as indented block
"
Class {
	#name : #BlockEmitter,
	#superclass : #SourceEmitter,
	#category : #Values
}

{ #category : #writing }
BlockEmitter >> emitSeparator [
	self stream cr.
	self level + 1 timesRepeat: [self stream tab]
]

{ #category : #'initialize-release' }
BlockEmitter >> initializePrinter: aPrinter stream: aWriteStream level: anInteger [
	printer := aPrinter.
	stream := aWriteStream.
	level := anInteger + 1
]
