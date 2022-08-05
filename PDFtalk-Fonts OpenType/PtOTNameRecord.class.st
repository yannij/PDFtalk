"
substructure of the NameTable
"
Class {
	#name : #PtOTNameRecord,
	#superclass : #Value,
	#instVars : [
		'platformID',
		'encodingID',
		'languageID',
		'nameID',
		'bytes'
	],
	#category : #'PDFtalk-Fonts OpenType'
}

{ #category : #specification }
PtOTNameRecord class >> localSpecification [
	<constant: #platformID class: #SmallInteger>
	<constant: #encodingID class: #SmallInteger>
	<constant: #languageID class: #SmallInteger>
	<constant: #nameID class: #SmallInteger>
	<constant: #bytes class: #ByteArray>
]

{ #category : #'instance creation' }
PtOTNameRecord class >> platformID: platformIDSmallInteger encodingID: encodingIDSmallInteger languageID: languageIDSmallInteger nameID: nameIDSmallInteger bytes: bytesByteArray [
	| inst |
	inst := self new.
	inst
		initializePlatformID: platformIDSmallInteger
		encodingID: encodingIDSmallInteger
		languageID: languageIDSmallInteger
		nameID: nameIDSmallInteger
		bytes: bytesByteArray.
	^inst
]

{ #category : #accessing }
PtOTNameRecord class >> shortNameIdDescriptions [
	"self shortNameIdDescriptions"

	| dict |
	dict := IdentityDictionary new.
	dict at: 0 put: 'Copyright'.
	dict at: 1 put: 'Font Family'.
	dict at: 2 put: 'Font Subfamily'.
	dict at: 3 put: 'Unique font identifier'.
	dict at: 4 put: 'Full font name'.
	dict at: 5 put: 'Version'.
	dict at: 6 put: 'Postscript name'.
	dict at: 7 put: 'Trademark'.
	dict at: 8 put: 'Manufacturer'.
	dict at: 9 put: 'Designer'.
	dict at: 10 put: 'Description'.
	dict at: 11 put: 'URL Vendor'.
	dict at: 12 put: 'URL Designer'.
	dict at: 13 put: 'License'.
	dict at: 14 put: 'License Info URL'.
	dict at: 15 put: 'Reserved'.
	dict at: 16 put: 'Preferred Family'.
	dict at: 17 put: 'Preferred Subfamily'.
	dict at: 18 put: 'Compatible Full (Macintosh only)'.
	dict at: 19 put: 'Sample text'.
	dict at: 20 put: 'PostScript CID findfont name'.
	^dict
]

{ #category : #accessing }
PtOTNameRecord >> bytes [
	"<ByteArray>"

	^bytes
]

{ #category : #accessing }
PtOTNameRecord >> encodingID [
	"<Integer>"

	^encodingID
]

{ #category : #accessing }
PtOTNameRecord >> encodingString [
	"<String>"

	| strings |
	strings := self encodingStrings.
	strings isEmpty ifTrue: [
		^'(-)'].
	^strings at: self encodingID + 1
]

{ #category : #accessing }
PtOTNameRecord >> encodingStrings [
	"<Array of: String>"

	self platformID = 3 ifTrue: [
		^#('Symbol' 'Unicode BMP only' 'ShiftJIS' 'PRC' 'Big5' 'Wansung' 'Johab' 'Reserved' 'Reserved' 'Reserved' 'Unicode full repertoire')].
	self platformID = 1 ifTrue: [
		^#('Roman' 'Japanese' 'Chinese (Traditional)' 'Korean' 'Arabic' 'Hebrew' 'Greek' 'Russian' 'RSymbol' 'Devanagari' 'Gurmukhi' 'Gujarati' 'Oriya' 'Bengali' 'Tamil' 'Telugu' 'Kannada' 'Malayalam' 'Sinhalese' 'Burmese' 'Khmer' 'Thai' 'Laotian' 'Georgian' 'Armenian' 'Chinese (Simplified)' 'Tibetan' 'Mongolian' 'Geez' 'Slavic' 'Vietnamese' 'Sindhi' 'Uninterpreted')].
	self platformID = 0 ifTrue: [
		^#('Unicode 1.0 semantics' 'Unicode 1.1 semantics' 'ISO 10646:1993 semantics' 'Unicode 2.0 and onwards semantics, Unicode BMP only.' 'Unicode 2.0 and onwards semantics, Unicode full repertoire.')].
	^#()
]

{ #category : #'initialize-release' }
PtOTNameRecord >> initializePlatformID: platformIDSmallInteger encodingID: encodingIDSmallInteger languageID: languageIDSmallInteger nameID: nameIDSmallInteger bytes: bytesByteArray [
	platformID := platformIDSmallInteger.
	encodingID := encodingIDSmallInteger.
	languageID := languageIDSmallInteger.
	nameID := nameIDSmallInteger.
	bytes := bytesByteArray.
	self beImmutable
]

{ #category : #accessing }
PtOTNameRecord >> languageID [
	"<Integer>"

	^languageID
]

{ #category : #accessing }
PtOTNameRecord >> nameID [
	"<Integer>"

	^nameID
]

{ #category : #accessing }
PtOTNameRecord >> platformID [
	"<Integer>"

	^platformID
]

{ #category : #accessing }
PtOTNameRecord >> platformString [
	"<String>"

	^self platformStrings at: self platformID + 1
]

{ #category : #accessing }
PtOTNameRecord >> platformStrings [
	"<Array of: String>"

	^#('Unicode' 'Macintosh' 'ISO' 'Microsoft' 'Custom')
]

{ #category : #printing }
PtOTNameRecord >> printOn: stream [
	stream
		nextPutAll: self class name asString;
		nextPut: $[;
		nextPutAll: self platformString;
		nextPut: $—;
		nextPutAll: self encodingString;
		nextPut: $—;
		nextPutAll: self languageID printString;
		nextPut: $—;
		nextPutAll: self nameID printString;
		nextPut: $(;
		nextPutAll: self shortDescription;
		nextPut: $);
		nextPut: $];
		nextPutAll: self string
]

{ #category : #printing }
PtOTNameRecord >> printvalueWith: printer [
	| args |
	args := OrderedCollection new.
	args add: (printer constant: 'platformID' value: self platformID).
	args add: (printer constant: 'encodingID' value: self encodingID).
	args add: (printer constant: 'languageID' value: self languageID).
	args add: (printer constant: 'nameID' value: self nameID).
	args add: (printer constant: 'bytes' value: self bytes).
	^printer printvalue: self arguments: args
]

{ #category : #accessing }
PtOTNameRecord >> shortDescription [
	"<String>"

	^self class shortNameIdDescriptions at: self nameID ifAbsent: ['no description']
]

{ #category : #accessing }
PtOTNameRecord >> string [
	"<String>"

	(self platformID = 3 and: [
	self encodingID = 1]) ifTrue: [
			| copy |
			copy := self bytes copy.
			copy twoByteEndiannessSwap.
			^copy asStringEncoding: #UTF16].
	(self platformID = 1 and: [
	self encodingID = 0]) ifTrue: [
			^self bytes asStringEncoding: #'iso8859-1'].
	^self bytes asStringEncoding: #default
]
