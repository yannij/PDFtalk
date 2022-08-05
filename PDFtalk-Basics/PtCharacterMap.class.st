"
provides a mapping of bytes to characters

#encode: maps a Character to a byte
#decode: maps a byte to a Character

Unusual name to not conflict with VW ByteCharacterEncoder which was used before and provides some of its services
"
Class {
	#name : #PtCharacterMap,
	#superclass : #Object,
	#instVars : [
		'name',
		'encoder',
		'decoder'
	],
	#category : #'PDFtalk-Basics'
}

{ #category : #'instance creation' }
PtCharacterMap class >> iso8859_1 [
	"the platform encoding"
	"self iso8859_1"

	| map |
	map := WordArray new: 256 withAll: Character illegalCode.
	1 to: 256 do: [:index | map at: index put: (index - 1) asCharacter codePoint].
	^self named: #iso8859_1 withCodes: map
]

{ #category : #'instance creation' }
PtCharacterMap class >> named: aSymbol withCodes: arrayWithCharacterCodes [
	| inst |
	inst := self new.
	inst initializeName: aSymbol withCodes: arrayWithCharacterCodes.
	^inst
]

{ #category : #accessing }
PtCharacterMap >> decode: anInteger [
	"<Character>"

	^self decoder at: anInteger + 1
]

{ #category : #accessing }
PtCharacterMap >> decoder [
	"<SequenceableCollection[256] of: Character>"

	^decoder ifNil: [
		decoder := WideString new: 256 withAll: Character illegalCode asCharacter]
]

{ #category : #accessing }
PtCharacterMap >> encode: aCharacter [
	"<Integer>"

	^self encoder at: aCharacter ifAbsent: [Character illegalCode]
]

{ #category : #'initialize-release' }
PtCharacterMap >> encode: aCharacter as: aByte [
	| oldCharacter newByte |
	oldCharacter := self decoder at: aByte + 1.
	oldCharacter == aCharacter ifTrue: [
		^self].
	self decoder at: aByte + 1 put: aCharacter.
	aCharacter asInteger = Character illegalCode ifFalse: [
		self encoder at: aCharacter put: aByte].
	(self encoder at: oldCharacter ifAbsent: []) == aByte ifTrue: [
		newByte := decoder indexOf: oldCharacter.
		newByte = 0
			ifTrue: [self encoder removeKey: oldCharacter]
			ifFalse: [
			self encoder at: oldCharacter put: newByte - 1]]
]

{ #category : #accessing }
PtCharacterMap >> encoder [
	"<Dictionary[256] key: Character value: Byte>"

	^encoder ifNil: [encoder := IdentityDictionary new: 256]
]

{ #category : #'initialize-release' }
PtCharacterMap >> initializeName: aSymbol withCodes: arrayWithCharacterCodes [
	name := aSymbol.
	1 to: arrayWithCharacterCodes size do: [:index |
		self encode: (Character value: (arrayWithCharacterCodes at: index)) as: index - 1]
]

{ #category : #accessing }
PtCharacterMap >> name [
	"<Symbol>"
	
	^name
]
