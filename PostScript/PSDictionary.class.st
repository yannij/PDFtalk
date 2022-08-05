"
A PostScript dictionary

The keys are names.
It may contain itself as a value of a key
"
Class {
	#name : #PSDictionary,
	#superclass : #Valuemap,
	#type : #variable,
	#category : #PostScript
}

{ #category : #'double dispatching' }
PSDictionary >> copyFor: aPostScriptInterpreter [
	aPostScriptInterpreter pop keysAndValuesDo: [:key :value | self at: key put: value copy].
	aPostScriptInterpreter push: self
]

{ #category : #'double dispatching' }
PSDictionary >> forAllDo: proc for: aPostScriptInterpreter [
	self keysAndValuesDo: [:key :value |
		aPostScriptInterpreter push: key.
		aPostScriptInterpreter push: value.
		proc doIn: aPostScriptInterpreter]
]

{ #category : #'double dispatching' }
PSDictionary >> get: key for: aPostScriptInterpreter [
	^self at: key postScriptKey
]

{ #category : #testing }
PSDictionary >> postScriptEqual: otherCollection [ 
	"Other composite objects (arrays and dictionaries) are equal only if they share the same value.
	Separate values are considered unequal, even if all the components of those values are the same."

	^self == otherCollection
]

{ #category : #accessing }
PSDictionary >> postScriptType [
	^#dicttype
]

{ #category : #printing }
PSDictionary >> prettyPrintPSOn: aStream indent: anInteger [
	aStream nextPutAll: '<<'; cr.
	self keys
		do: [:key |
		anInteger + 1 timesRepeat: [aStream tab].
		key isSymbol ifTrue: [
			aStream nextPut: $/].
		key printPostScriptOn: aStream.
		aStream space.
		(self at: key) == self
			ifTrue: [aStream nextPutAll: '***MYSELF***']
			ifFalse: [
			(self at: key) prettyPrintPSOn: aStream indent: anInteger + 1]]
		separatedBy: [
		aStream cr].
	aStream nextPutAll: '>>'
]

{ #category : #printing }
PSDictionary >> printOn: aStream [
	"the receiver may be a value of a key"

	aStream nextPutAll: '<<'.
	self keys
		do: [:key |
		key isSymbol ifTrue: [
			aStream nextPut: $/].
		key printPostScriptOn: aStream.
		aStream space.
		(self at: key) == self
			ifTrue: [aStream nextPutAll: '***MYSELF***']
			ifFalse: [
			(self at: key) printPostScriptOn: aStream]]
		separatedBy: [
		aStream space].
	aStream nextPutAll: '>>'
]

{ #category : #printing }
PSDictionary >> printPostScriptOn: aStream [
	aStream nextPutAll: '<<'.
	self keys
		do: [:key |
		key isSymbol ifTrue: [
			aStream nextPut: $/].
		key printPostScriptOn: aStream.
		aStream space.
		(self at: key) == self ifTrue: [
			^self error: 'The receiver cannot be printed asPostScript, because it contains itself'].
		(self at: key) printPostScriptOn: aStream]
		separatedBy: [
		aStream space].
	aStream nextPutAll: '>>'
]

{ #category : #printing }
PSDictionary >> printargumentsWith: printer [
	(self keysForPrinting anySatisfy: [:key | (self at: key) == self]) ifTrue: [
		^self error: 'The receiver cannot be printed asSource, because it contains itself'].
	^super printargumentsWith: printer
]

{ #category : #'double dispatching' }
PSDictionary >> put: value at: key [
	"dict key value put –
	Associate key with value in dict"

	self at: key put: value
]

{ #category : #printing }
PSDictionary >> storeOn: aStream [
	| noneYet |
	aStream nextPutAll: '(('.
	aStream store: self class.
	aStream nextPutAll: ' new)'.
	noneYet := true.
	self associationsDo: [:association |
		association value == self ifTrue: [
			^self error: 'The receiver cannot be stored, because it contains itself'].
		noneYet
			ifTrue: [noneYet := false]
			ifFalse: [aStream nextPut: $;].
		aStream nextPutAll: ' add: '.
		aStream store: association].
	noneYet ifFalse: [
		aStream nextPutAll: '; yourself'].
	aStream nextPut: $)
]
