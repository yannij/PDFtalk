Extension { #name : #PSInterpreter }

{ #category : #'*PostScript-CIDInit-actions' }
PSInterpreter >> addPairsAt: aSymbol [
	self at: aSymbol addTuples: (self tuples: aSymbol size: 2).
	self scanner takeHexAsString
]

{ #category : #'*PostScript-CIDInit-actions' }
PSInterpreter >> addTriplesAt: aSymbol [
	self at: aSymbol addTuples: (self tuples: aSymbol size: 3).
	self scanner takeHexAsString
]

{ #category : #'*PostScript-CIDInit-actions' }
PSInterpreter >> at: aSymbol addTuples: someTuples [
	(self dictionaryStack top at: aSymbol ifAbsentPut: [OrderedCollection new]) addAll: someTuples
]

{ #category : #'*PostScript-CIDInit-actions' }
PSInterpreter >> tuples: aSymbol size: anInteger [
	"<SequenceableCollection of: (Array[anInteger] of: Object)>
	used in CID processing"

	| codes count tuples rst |
	count := self propertyRemove: (aSymbol , 'Count') asSymbol ifAbsent: [
		self error: '/end' , aSymbol asString , ' must occur after /begin' , aSymbol asString].
	codes := self popTillMark.
	codes size / anInteger = count ifFalse: [
		self error: aSymbol asString , ' count is wrong'].
	tuples := OrderedCollection new: count.
	rst := codes readStream.
	[rst atEnd] whileFalse: [tuples add: (rst next: anInteger) reverse asArray].
	^tuples reverse
]
