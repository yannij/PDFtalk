Extension { #name : #Integer }

{ #category : #'*PostScript-double dispatching' }
Integer >> copyFor: aPostScriptInterpreter [
	| elements |
	elements := OrderedCollection new.
	self timesRepeat: [elements add: aPostScriptInterpreter pop].
	elements reverse do: [:element | aPostScriptInterpreter push: element].
	elements reverse do: [:element | aPostScriptInterpreter push: element]
]

{ #category : #'*PostScript-bit manipulation' }
Integer >> postScriptAnd: anInteger [
	^self bitAnd: anInteger
]

{ #category : #'*PostScript-logical operations' }
Integer >> postScriptNot [
	^self bitInvert
]

{ #category : #'*PostScript-logical operations' }
Integer >> postScriptOr: anInteger [
	^self bitOr: anInteger
]

{ #category : #'*PostScript-accessing' }
Integer >> postScriptType [
	^#integertype
]

{ #category : #'*PostScript-logical operations' }
Integer >> postScriptXor: anInteger [
	^self bitXor: anInteger
]

{ #category : #'*PostScript-printing' }
Integer >> printPostScriptHexByte [
	"<String[2]>
	padded to 2 characters
	the receiver is a byte, i.e. between 0 and 255"

	^'00' , (self printPostScriptRadix: 16) last: 2
]

{ #category : #'*PostScript-printing' }
Integer >> printPostScriptOn: aStream [
	self negative ifTrue: [
		aStream nextPut: $-.
		^self negated writeDecimalDigitsOn: aStream].
	self writeDecimalDigitsOn: aStream
]

{ #category : #'*PostScript-printing' }
Integer >> printPostScriptRadix: radix [
	"<String>"

	| chars wst num |
	self isZero ifTrue: [
		^'0'].
	chars := '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ'.
	wst := String new writeStream.
	num := self.
	self negative ifTrue: [
		num := (2 raisedTo: 32) + self].
	[num isZero] whileFalse: [
		wst nextPut: (chars at: num \\ radix + 1).
		num := num // radix].
	^wst contents reverse
]

{ #category : #'*PostScript-printing' }
Integer >> writeDecimalDigitsOn: aStream [
	self >= 10 ifTrue: [
		self // 10 writeDecimalDigitsOn: aStream].
	aStream nextPut: ($0 asInteger + (self \\ 10)) asCharacter
]
