"
Mapping from some source codes to some destination codes

The chars and ranges are sorted bytewise

When created via #fromChars:andRanges: a canonical form is created
- neighbouring mappings are joined to range mappings and
- single character range mappings are converted to char mappings
"
Class {
	#name : #PSMappings,
	#superclass : #Value,
	#instVars : [
		'codespaces',
		'unmapped'
	],
	#category : #'PostScript-CIDInit'
}

{ #category : #'instance creation' }
PSMappings class >> charmappingFor: codeArray [
	"<CharMapping>
	convert the last argument to a unicode and use it as destination"

	^codeArray last mappingFrom: codeArray first
]

{ #category : #'instance creation optional' }
PSMappings class >> codespaces: codespacesArray [
	^self codespaces: codespacesArray unmapped: nil
]

{ #category : #'instance creation' }
PSMappings class >> codespaces: codespacesArray unmapped: unmappedArray [
	| inst |
	inst := self new.
	inst initializeCodespaces: codespacesArray unmapped: unmappedArray.
	^inst
]

{ #category : #'instance creation' }
PSMappings class >> fromChars: charsArray andRanges: rangesArray in: orderedCoderanges [
	"from the entries of the PostScript dictionary
	charsArray are arrays of 2, rangesArray of 3 codes"

	| charmaps rangemaps |
	charmaps := charsArray collect: [:array2 | self charmappingFor: array2].
	rangemaps := OrderedCollection new: rangesArray size.
	rangesArray do: [:array3 | rangemaps addAll: (self rangemappingsFor: array3)].
	^self fromMappings: charmaps , rangemaps in: orderedCoderanges
]

{ #category : #'instance creation' }
PSMappings class >> fromMappings: someMappings in: orderedCoderanges [
	"<Dictionary key: Integer value: (Array of: Mapping)>
	The mappings are added one by one to the mappings of their codespace.
	It is assumed that the mappings are sorted in ascending order, as they usually are"

	| codespaces unmappedCodespaces |
	someMappings isEmpty ifTrue: [
		^nil].
	codespaces := orderedCoderanges collect: #asCodespace.
	unmappedCodespaces := Dictionary new.
	someMappings do: [:mapping |
		(codespaces detect: [:codespace | codespace canMap: mapping] ifNone: [nil])
			ifNotNil: [:codespace |
			codespace addMapping: mapping]
			ifNil: [
			| codespace |
			codespace := unmappedCodespaces at: mapping codeLength ifAbsentPut: [
				(PSRange
					from: (ByteArray new: mapping codeLength withAll: 0)
					to: (ByteArray new: mapping codeLength withAll: 255)) asCodespace].
			codespace addMapping: mapping]].
	^self
		codespaces: (codespaces collect: #copyWithArrays)
		unmapped: (unmappedCodespaces keys sorted inject: OrderedCollection new into: [:list :length |
			list addAll: (unmappedCodespaces at: length) mappings.
			list])
]

{ #category : #specification }
PSMappings class >> localSpecification [
	<sequence: #codespaces comment: 'sorted codespaces'>
	<sequence: #unmapped comment: 'invalid mappings not lying inside any codespace'>
]

{ #category : #'instance creation' }
PSMappings class >> rangemappingsFor: rangeArray [
	"<Array of: Mapping>
	convert the last argument to a unicode and use it as destination"

	| source |
	source := rangeArray first = (rangeArray at: 2)
		ifTrue: [rangeArray first]
		ifFalse: [
		rangeArray first to: (rangeArray at: 2)].
	^rangeArray last mappingsFrom: source
]

{ #category : #'instance creation optional' }
PSMappings class >> unmapped: unmappedArray [
	^self codespaces: nil unmapped: unmappedArray
]

{ #category : #accessing }
PSMappings >> codespaces [
	"<Array>
	sorted codespaces"

	^codespaces ifNil: [#()]
]

{ #category : #'initialize-release' }
PSMappings >> initializeCodespaces: codespacesArray unmapped: unmappedArray [
	(codespacesArray notNil and: [
	codespacesArray notEmpty]) ifTrue: [
			codespaces := (Array withAll: codespacesArray) beImmutable].
	(unmappedArray notNil and: [
	unmappedArray notEmpty]) ifTrue: [
			unmapped := (Array withAll: unmappedArray) beImmutable].
	self beImmutable
]

{ #category : #testing }
PSMappings >> isValid [
	^self unmapped isEmpty
]

{ #category : #accessing }
PSMappings >> mappingAt: aCode [
	"<Mapping | nil>"

	^(self codespaces detect: [:codespace | codespace range includesCode: aCode] ifNone: [
		nil]) ifNotNil: [:codespace |
			codespace at: aCode ifAbsent: [nil]]
]

{ #category : #accessing }
PSMappings >> mappings [
	"<SequenceableCollection of: Mapping>
	sorted char and range mappings ordered by codespaces"

	| wst |
	wst := OrderedCollection new writeStream.
	self codespaces do: [:codespace | wst nextPutAll: codespace allMappings].
	^wst contents
]

{ #category : #accessing }
PSMappings >> numberOfChars [
	^self codespaces inject: 0 into: [:sum :codespace | sum + codespace numberOfChars]
]

{ #category : #accessing }
PSMappings >> numberOfCodes [
	^self codespaces inject: 0 into: [:sum :codespace | sum + codespace numberOfCodes]
]

{ #category : #accessing }
PSMappings >> numberOfMappedCodes [
	^self codespaces inject: 0 into: [:sum :codespace | sum + codespace numberOfMappedCodes]
]

{ #category : #accessing }
PSMappings >> numberOfRanges [
	^self codespaces inject: 0 into: [:sum :codespace | sum + codespace numberOfRanges]
]

{ #category : #printing }
PSMappings >> printvalueWith: printer [
	| args |
	args := OrderedCollection new.
	args add: (printer array: 'codespaces' value: self codespaces).
	args add: (printer array: 'unmapped' value: self unmapped).
	^printer printvalue: self arguments: args
]

{ #category : #accessing }
PSMappings >> unmapped [
	"<Array>
	invalid mappings not lying inside any codespace"

	^unmapped ifNil: [#()]
]
