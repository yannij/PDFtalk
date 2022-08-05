"
a character from a CFF
"
Class {
	#name : #PtOTGlyph,
	#superclass : #Value,
	#instVars : [
		'id',
		'name',
		'charString',
		'code',
		'hMetric'
	],
	#category : #'PDFtalk-Fonts OpenType'
}

{ #category : #'instance creation' }
PtOTGlyph class >> id: idInteger name: nameSymbol charString: charStringCharstring code: codeInteger hMetric: hMetricHorMetric [
	| inst |
	inst := self new.
	inst
		initializeId: idInteger
		name: nameSymbol
		charString: charStringCharstring
		code: codeInteger
		hMetric: hMetricHorMetric.
	^inst
]

{ #category : #specification }
PtOTGlyph class >> localSpecification [
	<constant: #id class: #Integer>
	<constant: #name class: #Symbol>
	<constant: #charString class: #CFFCharstring>
	<constant: #code class: #Integer>
	<constant: #hMetric class: #PtOTHorMetric>
]

{ #category : #accessing }
PtOTGlyph >> asCharacter [
	"<Character | nil>"

	^PSCharacterNames characterNamed: self name
]

{ #category : #accessing }
PtOTGlyph >> charString [
	"<Charstring>"

	^charString
]

{ #category : #accessing }
PtOTGlyph >> code [
	"<Integer>"

	^code
]

{ #category : #accessing }
PtOTGlyph >> hMetric [
	"<HorMetric>"

	^hMetric
]

{ #category : #accessing }
PtOTGlyph >> id [
	"<Integer>"

	^id
]

{ #category : #'initialize-release' }
PtOTGlyph >> initializeId: idInteger name: nameSymbol charString: charStringCharstring code: codeInteger hMetric: hMetricHorMetric [
	id := idInteger.
	name := nameSymbol.
	charString := charStringCharstring.
	code := codeInteger.
	hMetric := hMetricHorMetric.
	self beImmutable
]

{ #category : #accessing }
PtOTGlyph >> leftSideBearing [
	"<Number> in font space"

	^self hMetric lsb
]

{ #category : #accessing }
PtOTGlyph >> name [
	"<Symbol>"

	^name
]

{ #category : #accessing }
PtOTGlyph >> postScriptName [
	"<Symbol>"

	^self name
]

{ #category : #printing }
PtOTGlyph >> printvalueWith: printer [
	| args |
	args := OrderedCollection new.
	args add: (printer constant: 'id' value: self id).
	args add: (printer constant: 'name' value: self name).
	args add: (printer constant: 'charString' value: self charString).
	args add: (printer constant: 'code' value: self code).
	args add: (printer constant: 'hMetric' value: self hMetric).
	^printer printvalue: self arguments: args
]

{ #category : #accessing }
PtOTGlyph >> unicode [
	"<Integer>
	System code for this character. Can be two byte big"

	^self asCharacter ifNil: [Character illegalCode] ifNotNil: [:char | char asInteger]
]

{ #category : #accessing }
PtOTGlyph >> width [
	^self hMetric advanceWidth
]
