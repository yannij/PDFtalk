"
An Adobe Type 1 Font Program ascii header

Instances correspond to the header contents of an PFA file (or windows PFB file, which has identical content).

Documented in ""Adobe Type 1 Font Format"", 1990, ISBN 0-201-57044-0
online at http://partners.adobe.com/public/developer/en/font/T1_SPEC.PDF

Parsing the information from these files is provisorial. Needs a proper PostScript interpreter to do it right.
"
Class {
	#name : #PtFFontProgramHeader,
	#superclass : #Value,
	#instVars : [
		'familyName',
		'fontBBox',
		'contents'
	],
	#category : #'PDFtalk-Fonts Type1'
}

{ #category : #'instance creation' }
PtFFontProgramHeader class >> familyName: familyNameString fontBBox: fontBBoxRectangle contents: contentsString [
	| inst |
	inst := self new.
	inst
		initializeFamilyName: familyNameString
		fontBBox: fontBBoxRectangle
		contents: contentsString.
	^inst
]

{ #category : #'instance creation' }
PtFFontProgramHeader class >> familyNameFrom: contentsString [
	"<String>"

	| rst |
	rst := contentsString readStream.
	rst upToAll: '/FamilyName'.
	rst upTo: $(.
	^rst upTo: $)
]

{ #category : #'instance creation' }
PtFFontProgramHeader class >> fontBBoxFrom: contentsString [
	"<Rectangle>
	hack: just extract this piece of information from the header without parsing all PostScript"

	| rst numbersString numbers llx lly urx ury wst numbersStrings |
	rst := contentsString readStream.
	rst upToAll: '/FontBBox'.
	rst next: 10.
	[
	| c |
	c := rst peek.
	c isDigit or: [
	'-+' includes: c]] whileFalse: [rst next].
	wst := String new writeStream.
	[
	| c |
	c := rst peek.
	c isDigit or: [
	c isSeparator or: [
	'-+' includes: c]]] whileTrue: [
			wst nextPut: rst next].
	numbersString := wst contents.
	numbersStrings := numbersString trimBlanks substrings: (String with: Character space).
	numbers := numbersStrings collect: #asNumber.
	llx := numbers at: 1.
	lly := numbers at: 2.
	urx := numbers at: 3.
	ury := numbers at: 4.
	^llx @ lly corner: urx @ ury
]

{ #category : #'instance creation' }
PtFFontProgramHeader class >> fromHeader: contentsString [
	^self
		familyName: (self familyNameFrom: contentsString)
		fontBBox: (self fontBBoxFrom: contentsString)
		contents: contentsString
]

{ #category : #specification }
PtFFontProgramHeader class >> localSpecification [
	<constant: #familyName class: #String comment: 'The name of the typeface family to which the font belongs'>
	<constant: #fontBBox class: #Rectangle comment: 'the font bounding box'>
	<constant: #contents class: #String comment: 'cleartext PostScript code'>
]

{ #category : #accessing }
PtFFontProgramHeader >> contents [
	"<String>
	cleartext PostScript code"

	^contents
]

{ #category : #accessing }
PtFFontProgramHeader >> familyName [
	"<String>
	The name of the typeface family to which the font belongs"

	^familyName
]

{ #category : #accessing }
PtFFontProgramHeader >> fontBBox [
	"<Rectangle>
	the font bounding box"

	^fontBBox
]

{ #category : #'initialize-release' }
PtFFontProgramHeader >> initializeFamilyName: familyNameString fontBBox: fontBBoxRectangle contents: contentsString [
	familyName := familyNameString.
	fontBBox := fontBBoxRectangle.
	contents := contentsString.
	self beImmutable
]

{ #category : #printing }
PtFFontProgramHeader >> printvalueWith: printer [
	| args |
	args := OrderedCollection new.
	args add: (printer constant: 'familyName' value: self familyName).
	args add: (printer constant: 'fontBBox' value: self fontBBox).
	args add: (printer constant: 'contents' value: self contents).
	^printer printvalue: self arguments: args
]
