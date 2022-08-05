"
factored out from PostScriptFontBody class
This comment is from PostScriptFontBody class>>parseGenericEntry:stack:modify:
	Generic parsing algorithm for keeping track of the
	StartFoo / EndFoo delimiters that we encounter as we
	parse the file.  Each StartFoo pushes on the stack the
	name of the EndFoo line that terminates it, and a
	message selector to use to parse the file until that
	line is reached.  When the EndFoo line is reached, the
	stack is popped, and the line checked to make sure
	that it's the correct terminator--i.e., that it's an
	EndFoo and not an EndBar, if an EndFoo was expected.

	This stack maintenance is all that's needed for many
	sections.  If information has to be extracted from a
	section of the file, a different method selector should
	be used to parse that part of the file.
"
Class {
	#name : #PtFAfmParser,
	#superclass : #Object,
	#instVars : [
		'fontMetric',
		'stream',
		'stack'
	],
	#category : #'PDFtalk-Fonts Type1'
}

{ #category : #'instance creation' }
PtFAfmParser class >> parseFrom: readstream into: aFontMetric [
	self new parseFrom: readstream into: aFontMetric
]

{ #category : #'parsing utils' }
PtFAfmParser >> asSetter: key [
	| setter |
	setter := key copy , ':'.
	setter at: 1 put: key first asLowercase.
	^setter asSymbol
]

{ #category : #parsing }
PtFAfmParser >> charMetricEntriesFrom: string [
	| tokens rawTokens |
	tokens := string substrings: (String with: $;).
	rawTokens := tokens reject: [:token |
		token isEmpty or: [
		token allSatisfy: [:c | c isSeparator]]].
	^rawTokens collect: [:token | self keyAndValue: token]
]

{ #category : #parsing }
PtFAfmParser >> charMetricFrom: line [
	| entries charMetric |
	entries := self charMetricEntriesFrom: line.
	entries isEmpty ifTrue: [
		^nil].
	charMetric := PtFCharacterMetric new.
	entries do: [:entry |
		[charMetric perform: (self asSetter: entry key) with: entry value] on: MessageNotUnderstood do: [
			self error: (#errBadAFMProperty << #dialogs >> '<1p> not recognized' expandMacrosWith: entry)]].
	charMetric isValid ifFalse: [
		self error: #errCharacterNameAndCode << #dialogs >> 'Character with no name and no code?'].
	^charMetric
]

{ #category : #parsing }
PtFAfmParser >> kernPairFrom: line [
	| entry kernPair |
	entry := self keyAndValue: line.
	kernPair := PtFKernPair new.
	kernPair perform: (self asSetter: entry key) with: entry value.
	kernPair isValid ifFalse: [
		self error: 'kern pair is not valid'].
	^kernPair
]

{ #category : #'parsing utils' }
PtFAfmParser >> keyAndValue: line [
	"<Association key: String value: String>"

	| rst |
	rst := line readStream.
	^(self token: rst) -> (self trimLine: rst upToEnd)
]

{ #category : #'parsing utils' }
PtFAfmParser >> nextLine [
	"<String>
	a line should not contain more than 255 characters"

	^self trimLine: (stream upTo: Character cr)
]

{ #category : #parsing }
PtFAfmParser >> parse [
	| line lastline |
	line := self nextLine.
	(self keyAndValue: line) key = 'StartFontMetrics' ifFalse: [
		^self error: 'wrong header! StartFontMetrics was expected'].
	self perform: stack last value with: line.
	[stream atEnd] whileFalse: [
		line := self nextLine.
		line notEmpty ifTrue: [
			self perform: stack last value with: line.
			lastline := line]].
	(self keyAndValue: lastline) key = 'EndFontMetrics' ifFalse: [
		^self error: 'wrong trailer! EndFontMetrics expected']
]

{ #category : #parsing }
PtFAfmParser >> parseAfmEntry: line [
	| keyAndValue setter |
	(self tryParseSectionStartEndEntry: line) ifTrue: [^self].
	keyAndValue := self keyAndValue: line.
	setter := self asSetter: keyAndValue key.
	fontMetric perform: setter with: keyAndValue value
]

{ #category : #parsing }
PtFAfmParser >> parseCharMetric: line [
	"(Required if individual character metrics are present.) These keywords delimit the character metrics section of the file. The integer value indicates how many entries to expect."

	| charMetric |
	(self tryParseSectionStartEndEntry: line) ifTrue: [
		^self].
	(self tryParseComment: line) ifTrue: [
		^self].
	charMetric := self charMetricFrom: line.
	charMetric ifNil: [
		^self].
	fontMetric charMetrics add: charMetric
]

{ #category : #parsing }
PtFAfmParser >> parseComposite: line [
	(self tryParseSectionStartEndEntry: line) ifTrue: [^self].
	(self tryParseComment: line) ifTrue: [^self].
	fontMetric addComposite: line
]

{ #category : #parsing }
PtFAfmParser >> parseEndSectionEntry: line [
	stack removeLast key = line ifFalse: [
		self error: #errAFMBadNests << #dialogs >> 'AFM file contains badly nested Start / End clauses']
]

{ #category : #parsing }
PtFAfmParser >> parseFrom: readstream into: aFontMetric [
	fontMetric := aFontMetric.
	stream := readstream.
	stack := OrderedCollection with: 'AFM' -> #parseAfmEntry:.
	self parse
]

{ #category : #parsing }
PtFAfmParser >> parseKernPair: line [
	| kernPair |
	(self tryParseSectionStartEndEntry: line) ifTrue: [^self].
	(self tryParseComment: line) ifTrue: [^self].
	kernPair := self kernPairFrom: line.
	kernPair ifNil: [^self].
	fontMetric addKernPair: kernPair
]

{ #category : #parsing }
PtFAfmParser >> parseStartSectionEntry: line [
	| keyAndValue selector endToken |
	keyAndValue := self keyAndValue: line.
	selector := self subparserFor: keyAndValue.
	selector ifNil: [
		self error: #errUnrecognizedAMF << #dialogs >> 'Unrecognized AFM section'].
	endToken := keyAndValue key copyReplaceAll: 'Start' with: 'End'.
	stack add: endToken -> selector
]

{ #category : #parsing }
PtFAfmParser >> parseTrackKern: line [
	| kernPair |
	(self tryParseSectionStartEndEntry: line) ifTrue: [^self].
	(self tryParseComment: line) ifTrue: [^self].
	kernPair := self trackKernFrom: line.
	kernPair ifNil: [^self].
	fontMetric addTrackKern: kernPair
]

{ #category : #parsing }
PtFAfmParser >> subparserFor: keyAndValue [
	"<Symbol>"

	| key |
	key := keyAndValue key.
	key = 'StartFontMetrics' ifTrue: [
		fontMetric fileFormatVersion: keyAndValue value.
		^#parseAfmEntry:].
	key = 'StartCharMetrics' ifTrue: [
		fontMetric charMetricsSize: keyAndValue value.
		^#parseCharMetric:].
	key = 'StartKernData' ifTrue: [
		fontMetric kernDataSize: keyAndValue value.
		^#tryParseSectionStartEndEntry:].
	key = 'StartTrackKern' ifTrue: [
		fontMetric trackKernSize: keyAndValue value.
		^#parseTrackKern:].
	key = 'StartKernPairs' ifTrue: [
		fontMetric kernPairsSize: keyAndValue value.
		^#parseKernPair:].
	key = 'StartComposites' ifTrue: [
		fontMetric compositesSize: keyAndValue value.
		^#parseComposite:].
	key = 'StartDirection' ifTrue: [
		| direction |
		direction := keyAndValue value asNumber.
		direction = 0 ifTrue: [^#parseAfmEntry:].
		direction = 1 ifTrue: [^self error: 'vertical direction is not supported yet'].
		direction = 2 ifTrue: [^self error: 'multiple directions are not supported yet'].
		^self error: 'unknown for Direction'].
	^nil
]

{ #category : #'parsing utils' }
PtFAfmParser >> token: s [
	"<String>
	leaves the stream after the following whitespace"

	| s1 c |
	s skipSeparators.
	s1 := (String new: 10) writeStream.
	[c := nil.
	s atEnd or: [(c := s next) isSeparator]]
		whileFalse: [s1 nextPut: c].
	c ifNotNil: [s skip: -1].
	s skipSeparators.
	^s1 contents
]

{ #category : #parsing }
PtFAfmParser >> trackKernFrom: line [
	"<String> for now"
	"TrackKern degree min-ptsize min-kern max-ptsize max-kern"

	| entry |
	entry := self keyAndValue: line.
	entry key = 'TrackKern' ifFalse: [
		self error: 'no track kerning specification'].
	^entry value
]

{ #category : #'parsing utils' }
PtFAfmParser >> trimLine: line [
	^self withoutTrailingSeparators: (self withoutLeadingSeparators: line)
]

{ #category : #parsing }
PtFAfmParser >> tryParseComment: line [
	^'Comment*' match: line
]

{ #category : #parsing }
PtFAfmParser >> tryParseSectionStartEndEntry: line [
	('Start*' match: line) ifTrue: [
		self parseStartSectionEntry: line.
		^true].
	('End*' match: line) ifTrue: [
		self parseEndSectionEntry: line.
		^true].
	^false
]

{ #category : #'parsing utils' }
PtFAfmParser >> withoutLeadingSeparators: raw [
	"<String>"

	^raw readStream skipSeparators upToEnd
]

{ #category : #'parsing utils' }
PtFAfmParser >> withoutTrailingSeparators: raw [
	"<String>"

	^(self withoutLeadingSeparators: raw reverse) reverse
]
