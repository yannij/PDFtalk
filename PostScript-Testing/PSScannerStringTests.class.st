Class {
	#name : #PSScannerStringTests,
	#superclass : #TestCase,
	#category : #'PostScript-Testing'
}

{ #category : #Testing }
PSScannerStringTests >> testAsciiBase85String [
	| scanner object |
	scanner := PSScanner on: '<~9jqo^BlbD-BleB1DJ+*+F(f,q/0JhKF<GL>Cj@.4Gp$d7F!,L7@<6@)/0JDEF<G%<+EV:2F!,
O<DJ+*.@<*K0@<6L(Df-\0Ec5e;DffZ(EZee.Bl.9pF"AGXBPCsi+DGm>@3BB/F*&OCAfu2/AKY
i(DIb:@FD,*)+C]U=@3BN#EcYf8ATD3s@q?d$AftVqCh[NqF<G:8+EV:.+Cf>-FD5W8ARlolDIa
l(DId<j@<?3r@:F%a+D58''ATD4$Bl@l3De:,-DJs`8ARoFb/0JMK@qB4^F!,R<AKZ&-DfTqBG%G
>uD.RTpAKYo''+CT/5+Cei#DII?(E,9)oF*2M7/c~>'.
	object := scanner nextPostScriptObject.
	self assert: (object isKindOf: String).
	self assert: object = 'Man is distinguished, not only by his reason, but by this singular passion from other animals, which is a lust of the mind, that by a perseverance of delight in the continued and indefatigable generation of knowledge, exceeds the short vehemence of any carnal pleasure.'.
]

{ #category : #Testing }
PSScannerStringTests >> testHexadecimalString [
	| scanner object |
	scanner := PSScanner on: '<1fEA00a2>'.
	object := scanner nextPostScriptObject.
	self assert: (object isKindOf: String).
	self assert: object printPostScript = '(\037\352\000\242)'.
	self assert: object asByteArray = #[31 234 0 162].
]

{ #category : #Testing }
PSScannerStringTests >> testHexadecimalStrings [
	| scanner |
	self assert: (PSScanner on: '<901fa3>') nextPostScriptObject asByteArray = #[144 31 163].
	self assert: (PSScanner on: '<901fa>') nextPostScriptObject asByteArray = #[144 31 160].
	self assert: (PSScanner on: '<90 1f a>') nextPostScriptObject asByteArray = #[144 31 160].
	self assert: (PSScanner on: '<	9 0	1 f	a >') nextPostScriptObject asByteArray = #[144 31 160].
	self should: [(PSScanner on: '<901faG>') nextPostScriptObject] raise: PSSyntaxerror.
	scanner := PSScanner on: '<901fa3> 123'.
	self assert: scanner nextPostScriptObject asByteArray = #[144 31 163].
	self assert: scanner nextPostScriptObject = 123.
]

{ #category : #Testing }
PSScannerStringTests >> testNibble [
	self assert: (PSScanner new nibbleFor: $0) = 0.
	self assert: (PSScanner new nibbleFor: $1) = 1.
	self assert: (PSScanner new nibbleFor: $2) = 2.
	self assert: (PSScanner new nibbleFor: $3) = 3.
	self assert: (PSScanner new nibbleFor: $4) = 4.
	self assert: (PSScanner new nibbleFor: $5) = 5.
	self assert: (PSScanner new nibbleFor: $6) = 6.
	self assert: (PSScanner new nibbleFor: $7) = 7.
	self assert: (PSScanner new nibbleFor: $8) = 8.
	self assert: (PSScanner new nibbleFor: $9) = 9.
	self assert: (PSScanner new nibbleFor: $A) = 10.
	self assert: (PSScanner new nibbleFor: $B) = 11.
	self assert: (PSScanner new nibbleFor: $C) = 12.
	self assert: (PSScanner new nibbleFor: $D) = 13.
	self assert: (PSScanner new nibbleFor: $E) = 14.
	self assert: (PSScanner new nibbleFor: $F) = 15.
	self assert: (PSScanner new nibbleFor: $a) = 10.
	self assert: (PSScanner new nibbleFor: $b) = 11.
	self assert: (PSScanner new nibbleFor: $c) = 12.
	self assert: (PSScanner new nibbleFor: $d) = 13.
	self assert: (PSScanner new nibbleFor: $e) = 14.
	self assert: (PSScanner new nibbleFor: $f) = 15.
	self should: [PSScanner new nibbleFor: $g] raise: PSSyntaxerror.
]

{ #category : #Testing }
PSScannerStringTests >> testOctalCharacterPrinting [
	| object |
	object := (PSScanner on: '(\034)') nextPostScriptObject.
	self assert: object = (String with: 28 asCharacter).
	self assert: object printPostScript = '(\034)'.
]

{ #category : #Testing }
PSScannerStringTests >> testString [
	| scanner object |
	scanner := PSScanner on: '(This is a string)'.
	object := scanner nextPostScriptObject.
	self assert: (object isKindOf: String).
	self assert: object = 'This is a string'.
]

{ #category : #Testing }
PSScannerStringTests >> testStringAndNumber [
	| scanner object |
	scanner := PSScanner on: '(This is a string) 123'.
	object := scanner nextPostScriptObject.
	self assert: (object isKindOf: String).
	self assert: object = 'This is a string'.
	object := scanner nextPostScriptObject.
	self assert: (object isKindOf: Integer).
	self assert: object = 123.
]

{ #category : #Testing }
PSScannerStringTests >> testStrings [
	self assert: (PSScanner on: '(This is a string)') nextPostScriptObject = 'This is a string'.
	self assert: (PSScanner on: '(Strings may contain newlines
and such)') nextPostScriptObject = 'Strings may contain newlines
and such'.
	self assert: (PSScanner on: '(Strings may contain special characters *!&}^% and
balanced parentheses () (and so on).)') nextPostScriptObject = 'Strings may contain special characters *!&}^% and
balanced parentheses () (and so on).'.
	self assert: (PSScanner on: '(The following is an empty string)') nextPostScriptObject = 'The following is an empty string'.
	self assert: (PSScanner on: '()') nextPostScriptObject size isZero.
	self assert: (PSScanner on: '(It has 0 (zero) length.)') nextPostScriptObject = 'It has 0 (zero) length.'.
]

{ #category : #Testing }
PSScannerStringTests >> testStringsWithBackSlash [
	self assert: (PSScanner on: '(These \
two strings \
are the same.)') nextPostScriptObject = 'These two strings are the same.'.
	self assert: (PSScanner on: '(This string has a newline at the end of it.
)') nextPostScriptObject = 'This string has a newline at the end of it.
'.
	self assert: (PSScanner on: '(So does this one.\n)
)') nextPostScriptObject = 'So does this one.
'.
	self assert: (PSScanner on: '(\tAfter a tab and before a cr.\n)') nextPostScriptObject = '	After a tab and before a cr.
'.
]

{ #category : #Testing }
PSScannerStringTests >> testStringsWithEscapes [
	self assert: (PSScanner on: '(\\)') nextPostScriptObject = '\'.
	self assert: (PSScanner on: '(\/)') nextPostScriptObject = '/'.
	self assert: (PSScanner on: '(\()') nextPostScriptObject = '('.
	self assert: (PSScanner on: '(\))') nextPostScriptObject = ')'.
	self assert: (PSScanner on: '(\\\/\(\))') nextPostScriptObject = '\/()'
]

{ #category : #Testing }
PSScannerStringTests >> testStringsWithOctalCharacters [
	self assert: (PSScanner on: '(\0533)') nextPostScriptObject = '+3'.
	self assert: (PSScanner on: '(\53)') nextPostScriptObject = '+'.
	self assert: (PSScanner on: '(\053)') nextPostScriptObject = '+'
]
