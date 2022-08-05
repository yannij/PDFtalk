"
TextBlockEmitter emits text as indented block
"
Class {
	#name : #TextBlockEmitter,
	#superclass : #TextEmitter,
	#category : #Values
}

{ #category : #writing }
TextBlockEmitter >> emitSeparator [
	self stream cr.
	self level + 1 timesRepeat: [self stream tab]
]

{ #category : #writing }
TextBlockEmitter >> inBracketsDo: aZeroArgumentBlock [
	aZeroArgumentBlock value
]

{ #category : #'initialize-release' }
TextBlockEmitter >> initializePrinter: aPrinter stream: aWriteStream level: anInteger [
	printer := aPrinter.
	stream := aWriteStream.
	level := anInteger + 1
]
