"
A Printvalue holds a representation of a Value to be printed.
It consists of
	- classname 	<String>										properly resolved against a target class (#name or #fullName)
	- arguments 	<SequenceableCollection of: Printargument>		the list of arguments with constructor variable name and a Printvalue

Printvalues are created when printing the source for a Value in the first pass. The second pass takes the Printvalue and produces a nicely indented soure string for the value.
"
Class {
	#name : #Printvalue,
	#superclass : #Value,
	#category : #Values
}

{ #category : #accessing }
Printvalue >> description [
	"<Text>"

	| emitter |
	emitter := self textemitterClass new.
	self sourceWith: emitter.
	^emitter stream contents
]

{ #category : #accessing }
Printvalue >> emitterClass [
	"<SourceEmitter class>"

	^self isLine
		ifTrue: [LineEmitter]
		ifFalse: [BlockEmitter]
]

{ #category : #testing }
Printvalue >> isLine [
	^false
]

{ #category : #testing }
Printvalue >> isSimple [
	"does it have to be printed in brackets?
	only literals are simple"

	^false
]

{ #category : #accessing }
Printvalue >> sourceFor: outerEmitter [
	"<String>"

	^self sourceWith: (outerEmitter emitterFor: self)
]

{ #category : #accessing }
Printvalue >> sourceWith: emitter [
	"write yourself with the emitter"

	^self subclassResponsibility
]

{ #category : #accessing }
Printvalue >> sourceWithPrinter: aPrinter [
	"<String>"

	| emitter |
	emitter := self emitterClass for: aPrinter.
	self sourceWith: emitter.
	^emitter stream contents
]

{ #category : #accessing }
Printvalue >> textemitterClass [
	"<SourceEmitter class>"

	^self isLine
		ifTrue: [TextLineEmitter]
		ifFalse: [TextBlockEmitter]
]
