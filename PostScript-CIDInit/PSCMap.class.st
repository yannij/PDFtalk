"
Value representing a CMap for code lookup

Created from the PostScript dictionary produced by the CIDInit procedures


"
Class {
	#name : #PSCMap,
	#superclass : #Value,
	#instVars : [
		'name',
		'characterCollection',
		'properties',
		'coderanges',
		'bfMappings',
		'cidMappings',
		'notdefMappings'
	],
	#category : #'PostScript-CIDInit'
}

{ #category : #'instance creation' }
PSCMap class >> fromPostScriptString: aString [
	^self newWith: ((PSInterpreter run: aString) categoryAt: #CMap) instances first value
]

{ #category : #specification }
PSCMap class >> localSpecification [
	<constant: #name class: #Symbol comment: 'name of the CMap'>
	<constant: #characterCollection class: #PSRegisteredCharacterCollection comment: 'the character collection defining the order of character IDs'>
	<map: #properties comment: 'the regular entries from the CMap dictionary except of the attributes used for encoding'>
	<sequence: #coderanges comment: 'sorted, non overlapping and not neighboring ranges of allowed source codes'>
	<optional: #bfMappings class: #PSBfMappings default: 'BfMappings new' comment: 'Maps from character codes to Unicodes'>
	<optional: #cidMappings class: #PSCIDMappings default: 'CIDMappings new' comment: 'Maps from source codes to CIDs'>
	<optional: #notdefMappings class: #PSNotdefMappings default: 'NotdefMappings new' comment: 'Maps notdefs from source codes to CIDs'>
]

{ #category : #'instance creation optional' }
PSCMap class >> name: nameSymbol characterCollection: characterCollectionCharacterCollection [
	^self
		name: nameSymbol
		characterCollection: characterCollectionCharacterCollection
		properties: nil
		coderanges: nil
		bfMappings: nil
		cidMappings: nil
		notdefMappings: nil
]

{ #category : #'instance creation optional' }
PSCMap class >> name: nameSymbol characterCollection: characterCollectionCharacterCollection bfMappings: bfMappingsBfMappings [
	^self
		name: nameSymbol
		characterCollection: characterCollectionCharacterCollection
		properties: nil
		coderanges: nil
		bfMappings: bfMappingsBfMappings
		cidMappings: nil
		notdefMappings: nil
]

{ #category : #'instance creation optional' }
PSCMap class >> name: nameSymbol characterCollection: characterCollectionCharacterCollection bfMappings: bfMappingsBfMappings cidMappings: cidMappingsCIDMappings [
	^self
		name: nameSymbol
		characterCollection: characterCollectionCharacterCollection
		properties: nil
		coderanges: nil
		bfMappings: bfMappingsBfMappings
		cidMappings: cidMappingsCIDMappings
		notdefMappings: nil
]

{ #category : #'instance creation optional' }
PSCMap class >> name: nameSymbol characterCollection: characterCollectionCharacterCollection bfMappings: bfMappingsBfMappings cidMappings: cidMappingsCIDMappings notdefMappings: notdefMappingsNotdefMappings [
	^self
		name: nameSymbol
		characterCollection: characterCollectionCharacterCollection
		properties: nil
		coderanges: nil
		bfMappings: bfMappingsBfMappings
		cidMappings: cidMappingsCIDMappings
		notdefMappings: notdefMappingsNotdefMappings
]

{ #category : #'instance creation optional' }
PSCMap class >> name: nameSymbol characterCollection: characterCollectionCharacterCollection bfMappings: bfMappingsBfMappings notdefMappings: notdefMappingsNotdefMappings [
	^self
		name: nameSymbol
		characterCollection: characterCollectionCharacterCollection
		properties: nil
		coderanges: nil
		bfMappings: bfMappingsBfMappings
		cidMappings: nil
		notdefMappings: notdefMappingsNotdefMappings
]

{ #category : #'instance creation optional' }
PSCMap class >> name: nameSymbol characterCollection: characterCollectionCharacterCollection cidMappings: cidMappingsCIDMappings [
	^self
		name: nameSymbol
		characterCollection: characterCollectionCharacterCollection
		properties: nil
		coderanges: nil
		bfMappings: nil
		cidMappings: cidMappingsCIDMappings
		notdefMappings: nil
]

{ #category : #'instance creation optional' }
PSCMap class >> name: nameSymbol characterCollection: characterCollectionCharacterCollection cidMappings: cidMappingsCIDMappings notdefMappings: notdefMappingsNotdefMappings [
	^self
		name: nameSymbol
		characterCollection: characterCollectionCharacterCollection
		properties: nil
		coderanges: nil
		bfMappings: nil
		cidMappings: cidMappingsCIDMappings
		notdefMappings: notdefMappingsNotdefMappings
]

{ #category : #'instance creation optional' }
PSCMap class >> name: nameSymbol characterCollection: characterCollectionCharacterCollection coderanges: coderangesArray [
	^self
		name: nameSymbol
		characterCollection: characterCollectionCharacterCollection
		properties: nil
		coderanges: coderangesArray
		bfMappings: nil
		cidMappings: nil
		notdefMappings: nil
]

{ #category : #'instance creation optional' }
PSCMap class >> name: nameSymbol characterCollection: characterCollectionCharacterCollection coderanges: coderangesArray bfMappings: bfMappingsBfMappings [
	^self
		name: nameSymbol
		characterCollection: characterCollectionCharacterCollection
		properties: nil
		coderanges: coderangesArray
		bfMappings: bfMappingsBfMappings
		cidMappings: nil
		notdefMappings: nil
]

{ #category : #'instance creation optional' }
PSCMap class >> name: nameSymbol characterCollection: characterCollectionCharacterCollection coderanges: coderangesArray bfMappings: bfMappingsBfMappings cidMappings: cidMappingsCIDMappings [
	^self
		name: nameSymbol
		characterCollection: characterCollectionCharacterCollection
		properties: nil
		coderanges: coderangesArray
		bfMappings: bfMappingsBfMappings
		cidMappings: cidMappingsCIDMappings
		notdefMappings: nil
]

{ #category : #'instance creation optional' }
PSCMap class >> name: nameSymbol characterCollection: characterCollectionCharacterCollection coderanges: coderangesArray bfMappings: bfMappingsBfMappings cidMappings: cidMappingsCIDMappings notdefMappings: notdefMappingsNotdefMappings [
	^self
		name: nameSymbol
		characterCollection: characterCollectionCharacterCollection
		properties: nil
		coderanges: coderangesArray
		bfMappings: bfMappingsBfMappings
		cidMappings: cidMappingsCIDMappings
		notdefMappings: notdefMappingsNotdefMappings
]

{ #category : #'instance creation optional' }
PSCMap class >> name: nameSymbol characterCollection: characterCollectionCharacterCollection coderanges: coderangesArray bfMappings: bfMappingsBfMappings notdefMappings: notdefMappingsNotdefMappings [
	^self
		name: nameSymbol
		characterCollection: characterCollectionCharacterCollection
		properties: nil
		coderanges: coderangesArray
		bfMappings: bfMappingsBfMappings
		cidMappings: nil
		notdefMappings: notdefMappingsNotdefMappings
]

{ #category : #'instance creation optional' }
PSCMap class >> name: nameSymbol characterCollection: characterCollectionCharacterCollection coderanges: coderangesArray cidMappings: cidMappingsCIDMappings [
	^self
		name: nameSymbol
		characterCollection: characterCollectionCharacterCollection
		properties: nil
		coderanges: coderangesArray
		bfMappings: nil
		cidMappings: cidMappingsCIDMappings
		notdefMappings: nil
]

{ #category : #'instance creation optional' }
PSCMap class >> name: nameSymbol characterCollection: characterCollectionCharacterCollection coderanges: coderangesArray cidMappings: cidMappingsCIDMappings notdefMappings: notdefMappingsNotdefMappings [
	^self
		name: nameSymbol
		characterCollection: characterCollectionCharacterCollection
		properties: nil
		coderanges: coderangesArray
		bfMappings: nil
		cidMappings: cidMappingsCIDMappings
		notdefMappings: notdefMappingsNotdefMappings
]

{ #category : #'instance creation optional' }
PSCMap class >> name: nameSymbol characterCollection: characterCollectionCharacterCollection coderanges: coderangesArray notdefMappings: notdefMappingsNotdefMappings [
	^self
		name: nameSymbol
		characterCollection: characterCollectionCharacterCollection
		properties: nil
		coderanges: coderangesArray
		bfMappings: nil
		cidMappings: nil
		notdefMappings: notdefMappingsNotdefMappings
]

{ #category : #'instance creation optional' }
PSCMap class >> name: nameSymbol characterCollection: characterCollectionCharacterCollection notdefMappings: notdefMappingsNotdefMappings [
	^self
		name: nameSymbol
		characterCollection: characterCollectionCharacterCollection
		properties: nil
		coderanges: nil
		bfMappings: nil
		cidMappings: nil
		notdefMappings: notdefMappingsNotdefMappings
]

{ #category : #'instance creation optional' }
PSCMap class >> name: nameSymbol characterCollection: characterCollectionCharacterCollection properties: propertiesDictionary [
	^self
		name: nameSymbol
		characterCollection: characterCollectionCharacterCollection
		properties: propertiesDictionary
		coderanges: nil
		bfMappings: nil
		cidMappings: nil
		notdefMappings: nil
]

{ #category : #'instance creation optional' }
PSCMap class >> name: nameSymbol characterCollection: characterCollectionCharacterCollection properties: propertiesDictionary bfMappings: bfMappingsBfMappings [
	^self
		name: nameSymbol
		characterCollection: characterCollectionCharacterCollection
		properties: propertiesDictionary
		coderanges: nil
		bfMappings: bfMappingsBfMappings
		cidMappings: nil
		notdefMappings: nil
]

{ #category : #'instance creation optional' }
PSCMap class >> name: nameSymbol characterCollection: characterCollectionCharacterCollection properties: propertiesDictionary bfMappings: bfMappingsBfMappings cidMappings: cidMappingsCIDMappings [
	^self
		name: nameSymbol
		characterCollection: characterCollectionCharacterCollection
		properties: propertiesDictionary
		coderanges: nil
		bfMappings: bfMappingsBfMappings
		cidMappings: cidMappingsCIDMappings
		notdefMappings: nil
]

{ #category : #'instance creation optional' }
PSCMap class >> name: nameSymbol characterCollection: characterCollectionCharacterCollection properties: propertiesDictionary bfMappings: bfMappingsBfMappings cidMappings: cidMappingsCIDMappings notdefMappings: notdefMappingsNotdefMappings [
	^self
		name: nameSymbol
		characterCollection: characterCollectionCharacterCollection
		properties: propertiesDictionary
		coderanges: nil
		bfMappings: bfMappingsBfMappings
		cidMappings: cidMappingsCIDMappings
		notdefMappings: notdefMappingsNotdefMappings
]

{ #category : #'instance creation optional' }
PSCMap class >> name: nameSymbol characterCollection: characterCollectionCharacterCollection properties: propertiesDictionary bfMappings: bfMappingsBfMappings notdefMappings: notdefMappingsNotdefMappings [
	^self
		name: nameSymbol
		characterCollection: characterCollectionCharacterCollection
		properties: propertiesDictionary
		coderanges: nil
		bfMappings: bfMappingsBfMappings
		cidMappings: nil
		notdefMappings: notdefMappingsNotdefMappings
]

{ #category : #'instance creation optional' }
PSCMap class >> name: nameSymbol characterCollection: characterCollectionCharacterCollection properties: propertiesDictionary cidMappings: cidMappingsCIDMappings [
	^self
		name: nameSymbol
		characterCollection: characterCollectionCharacterCollection
		properties: propertiesDictionary
		coderanges: nil
		bfMappings: nil
		cidMappings: cidMappingsCIDMappings
		notdefMappings: nil
]

{ #category : #'instance creation optional' }
PSCMap class >> name: nameSymbol characterCollection: characterCollectionCharacterCollection properties: propertiesDictionary cidMappings: cidMappingsCIDMappings notdefMappings: notdefMappingsNotdefMappings [
	^self
		name: nameSymbol
		characterCollection: characterCollectionCharacterCollection
		properties: propertiesDictionary
		coderanges: nil
		bfMappings: nil
		cidMappings: cidMappingsCIDMappings
		notdefMappings: notdefMappingsNotdefMappings
]

{ #category : #'instance creation optional' }
PSCMap class >> name: nameSymbol characterCollection: characterCollectionCharacterCollection properties: propertiesDictionary coderanges: coderangesArray [
	^self
		name: nameSymbol
		characterCollection: characterCollectionCharacterCollection
		properties: propertiesDictionary
		coderanges: coderangesArray
		bfMappings: nil
		cidMappings: nil
		notdefMappings: nil
]

{ #category : #'instance creation optional' }
PSCMap class >> name: nameSymbol characterCollection: characterCollectionCharacterCollection properties: propertiesDictionary coderanges: coderangesArray bfMappings: bfMappingsBfMappings [
	^self
		name: nameSymbol
		characterCollection: characterCollectionCharacterCollection
		properties: propertiesDictionary
		coderanges: coderangesArray
		bfMappings: bfMappingsBfMappings
		cidMappings: nil
		notdefMappings: nil
]

{ #category : #'instance creation optional' }
PSCMap class >> name: nameSymbol characterCollection: characterCollectionCharacterCollection properties: propertiesDictionary coderanges: coderangesArray bfMappings: bfMappingsBfMappings cidMappings: cidMappingsCIDMappings [
	^self
		name: nameSymbol
		characterCollection: characterCollectionCharacterCollection
		properties: propertiesDictionary
		coderanges: coderangesArray
		bfMappings: bfMappingsBfMappings
		cidMappings: cidMappingsCIDMappings
		notdefMappings: nil
]

{ #category : #'instance creation' }
PSCMap class >> name: nameSymbol characterCollection: characterCollectionCharacterCollection properties: propertiesDictionary coderanges: coderangesArray bfMappings: bfMappingsBfMappings cidMappings: cidMappingsCIDMappings notdefMappings: notdefMappingsNotdefMappings [
	| inst |
	inst := self new.
	inst
		initializeName: nameSymbol
		characterCollection: characterCollectionCharacterCollection
		properties: propertiesDictionary
		coderanges: coderangesArray
		bfMappings: bfMappingsBfMappings
		cidMappings: cidMappingsCIDMappings
		notdefMappings: notdefMappingsNotdefMappings.
	^inst
]

{ #category : #'instance creation optional' }
PSCMap class >> name: nameSymbol characterCollection: characterCollectionCharacterCollection properties: propertiesDictionary coderanges: coderangesArray bfMappings: bfMappingsBfMappings notdefMappings: notdefMappingsNotdefMappings [
	^self
		name: nameSymbol
		characterCollection: characterCollectionCharacterCollection
		properties: propertiesDictionary
		coderanges: coderangesArray
		bfMappings: bfMappingsBfMappings
		cidMappings: nil
		notdefMappings: notdefMappingsNotdefMappings
]

{ #category : #'instance creation optional' }
PSCMap class >> name: nameSymbol characterCollection: characterCollectionCharacterCollection properties: propertiesDictionary coderanges: coderangesArray cidMappings: cidMappingsCIDMappings [
	^self
		name: nameSymbol
		characterCollection: characterCollectionCharacterCollection
		properties: propertiesDictionary
		coderanges: coderangesArray
		bfMappings: nil
		cidMappings: cidMappingsCIDMappings
		notdefMappings: nil
]

{ #category : #'instance creation optional' }
PSCMap class >> name: nameSymbol characterCollection: characterCollectionCharacterCollection properties: propertiesDictionary coderanges: coderangesArray cidMappings: cidMappingsCIDMappings notdefMappings: notdefMappingsNotdefMappings [
	^self
		name: nameSymbol
		characterCollection: characterCollectionCharacterCollection
		properties: propertiesDictionary
		coderanges: coderangesArray
		bfMappings: nil
		cidMappings: cidMappingsCIDMappings
		notdefMappings: notdefMappingsNotdefMappings
]

{ #category : #'instance creation optional' }
PSCMap class >> name: nameSymbol characterCollection: characterCollectionCharacterCollection properties: propertiesDictionary coderanges: coderangesArray notdefMappings: notdefMappingsNotdefMappings [
	^self
		name: nameSymbol
		characterCollection: characterCollectionCharacterCollection
		properties: propertiesDictionary
		coderanges: coderangesArray
		bfMappings: nil
		cidMappings: nil
		notdefMappings: notdefMappingsNotdefMappings
]

{ #category : #'instance creation optional' }
PSCMap class >> name: nameSymbol characterCollection: characterCollectionCharacterCollection properties: propertiesDictionary notdefMappings: notdefMappingsNotdefMappings [
	^self
		name: nameSymbol
		characterCollection: characterCollectionCharacterCollection
		properties: propertiesDictionary
		coderanges: nil
		bfMappings: nil
		cidMappings: nil
		notdefMappings: notdefMappingsNotdefMappings
]

{ #category : #'instance creation' }
PSCMap class >> newWith: aDictionary [
	| dict cmapname chars coderanges bfchars bfranges cidchars cidranges notdefchars notdefranges |
	dict := aDictionary copy.
	cmapname := (dict removeKey: #CMapName) object.
	chars := PSRegisteredCharacterCollection newWith: (dict removeKey: #CIDSystemInfo ifAbsent: [
		PSDictionary new]).
	coderanges := self sortedCodespaceranges: (dict removeKey: #codespacerange).
	bfchars := dict removeKey: #bfchar ifAbsent: [#()].
	bfranges := dict removeKey: #bfrange ifAbsent: [#()].
	cidchars := dict removeKey: #cidchar ifAbsent: [#()].
	cidranges := dict removeKey: #cidrange ifAbsent: [#()].
	notdefchars := dict removeKey: #notdefchar ifAbsent: [#()].
	notdefranges := dict removeKey: #notdefrange ifAbsent: [#()].
	(dict includesKey: #CMapVersion) ifTrue: [
		dict at: #CMapVersion put: (dict at: #CMapVersion) asFloat].
	^self
		name: cmapname
		characterCollection: chars
		properties: dict
		coderanges: coderanges
		bfMappings: (PSBfMappings fromChars: bfchars andRanges: bfranges in: coderanges)
		cidMappings: (PSCIDMappings fromChars: cidchars andRanges: cidranges in: coderanges)
		notdefMappings: (PSNotdefMappings fromChars: notdefchars andRanges: notdefranges in: coderanges)
]

{ #category : #'instance creation' }
PSCMap class >> sortedCodespaceranges: someRanges [
	"<Array of: Range>
	sorted, non-overlapping ranges.
	neighboring ranges are joined"

	| sorted ranges current |
	sorted := someRanges asSortedCollection.
	ranges := OrderedCollection new: someRanges size.
	current := nil.
	sorted inject: nil into: [:previous :follower |
		previous ifNil: [current := follower] ifNotNil: [
			(previous overlaps: follower) ifTrue: [
				^self error: 'code space is invalid: ranges overlap'].
			current := (previous joinedRange: follower) ifNil: [
				ranges add: current.
				follower]].
		follower].
	ranges add: current.
	^ranges asArray
]

{ #category : #'accessing attributes' }
PSCMap >> attributeDocumentation: aMethod [
	| object |
	object := self performMethod: aMethod.
	^object class comment
]

{ #category : #accessing }
PSCMap >> bfMappings [
	"<BfMappings>
	Maps from character codes to Unicodes"

	^bfMappings ifNil: [PSBfMappings new]
]

{ #category : #accessing }
PSCMap >> characterCollection [
	"<CharacterCollection>
	the character collection defining the order of character IDs"

	^characterCollection
]

{ #category : #accessing }
PSCMap >> characterFrom: aByteStream [
	"<Character | nil>"

	| position code found |
	position := aByteStream position.
	code := PSCode withByte: aByteStream next.
	found := false.
	[found] whileFalse: [
		(self coderanges detect: [:range | code isInRange: range] ifNone: [nil])
			ifNil: [
			code length = (self coderanges inject: 0 into: [:max :range | max max: range length]) ifTrue: [
				aByteStream position: position.
				^nil].
			code := code withByte: aByteStream next]
			ifNotNil: [:foundCodespace |
			foundCodespace length > code length ifTrue: [
				code := code withBytes: (aByteStream next: foundCodespace length - code length)].
			found := true]].
	(self bfMappings characterAt: code) ifNotNil: [:character |
		^character].
	aByteStream position: position.
	"here we need to find out how many bytes we have to read and discard as invalid"
	^nil
]

{ #category : #accessing }
PSCMap >> cidAt: aCode [
	"<Integer | nil>"

	(self cidMappings cidAt: aCode) ifNotNil: [:cid |
		^cid].
	(self notdefMappings cidAt: aCode) ifNotNil: [:cid |
		^cid].
	^nil
]

{ #category : #accessing }
PSCMap >> cidFrom: aByteStream [
	"<Code | nil>"

	| position code found |
	position := aByteStream position.
	code := PSCode withByte: aByteStream next.
	found := false.
	[found] whileFalse: [
		(self coderanges codespaceFor: code)
			ifNil: [
			code size = self coderanges maxLength ifTrue: [
				aByteStream position: position.
				^nil].
			code := code withByte: aByteStream next]
			ifNotNil: [:foundCodespace |
			foundCodespace codeLength > code length ifTrue: [
				code := code withBytes: (aByteStream next: foundCodespace codeLength - code length)].
			found := true]].
	(self cidAt: code) ifNotNil: [:cid |
		^cid].
	aByteStream position: position.
	"here we need to find out how many bytes we have to read and discard as invalid"
	^nil
]

{ #category : #accessing }
PSCMap >> cidMappings [
	"<CIDMappings>
	Maps from source codes to CIDs"

	^cidMappings ifNil: [PSCIDMappings new]
]

{ #category : #accessing }
PSCMap >> coderanges [
	"<Array>
	sorted, non overlapping and not neighboring ranges of allowed source codes"

	^coderanges ifNil: [#()]
]

{ #category : #testing }
PSCMap >> hasTreeChildren [
	^false
]

{ #category : #'initialize-release' }
PSCMap >> initializeName: nameSymbol characterCollection: characterCollectionCharacterCollection properties: propertiesDictionary coderanges: coderangesArray bfMappings: bfMappingsBfMappings cidMappings: cidMappingsCIDMappings notdefMappings: notdefMappingsNotdefMappings [
	name := nameSymbol.
	characterCollection := characterCollectionCharacterCollection.
	(propertiesDictionary notNil and: [
	propertiesDictionary notEmpty]) ifTrue: [
			properties := (Valuemap withAll: propertiesDictionary) beImmutable].
	(coderangesArray notNil and: [
	coderangesArray notEmpty]) ifTrue: [
			coderanges := (Array withAll: coderangesArray) beImmutable].
	(bfMappingsBfMappings notNil and: [
	self bfMappings ~= bfMappingsBfMappings]) ifTrue: [
			bfMappings := bfMappingsBfMappings].
	(cidMappingsCIDMappings notNil and: [
	self cidMappings ~= cidMappingsCIDMappings]) ifTrue: [
			cidMappings := cidMappingsCIDMappings].
	(notdefMappingsNotdefMappings notNil and: [
	self notdefMappings ~= notdefMappingsNotdefMappings]) ifTrue: [
			notdefMappings := notdefMappingsNotdefMappings].
	self beImmutable
]

{ #category : #testing }
PSCMap >> isBfType [
	"maps to characters"

	^(self properties at: #CMapType ifAbsent: [nil]) ifNotNil: [:type | type = 2] ifNil: [
		self bfMappings notEmpty]
]

{ #category : #testing }
PSCMap >> isValid [
	^self bfMappings isValid and: [
	self cidMappings isValid and: [
	self notdefMappings isValid]]
]

{ #category : #accessing }
PSCMap >> name [
	"<Symbol>
	name of the CMap"

	^name
]

{ #category : #accessing }
PSCMap >> notdefMappings [
	"<NotdefMappings>
	Maps notdefs from source codes to CIDs"

	^notdefMappings ifNil: [PSNotdefMappings new]
]

{ #category : #accessing }
PSCMap >> numberOfMappedCodes [
	"<Integer>"

	^self bfMappings numberOfMappedCodes + self cidMappings numberOfMappedCodes + self notdefMappings numberOfMappedCodes
]

{ #category : #printing }
PSCMap >> printvalueWith: printer [
	| args |
	args := OrderedCollection new.
	args add: (printer constant: 'name' value: self name).
	args add: (printer constant: 'characterCollection' value: self characterCollection).
	args add: (printer dictionary: 'properties' value: self properties).
	args add: (printer array: 'coderanges' value: self coderanges).
	args add: (printer optional: 'bfMappings' value: bfMappings).
	args add: (printer optional: 'cidMappings' value: cidMappings).
	args add: (printer optional: 'notdefMappings' value: notdefMappings).
	^printer printvalue: self arguments: args
]

{ #category : #accessing }
PSCMap >> properties [
	"<Dictionary>
	the regular entries from the CMap dictionary except of the attributes used for encoding"

	^properties ifNil: [Dictionary new beImmutable]
]
