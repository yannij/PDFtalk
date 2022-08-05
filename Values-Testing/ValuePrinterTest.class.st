"
Tests for the source strings of Values
"
Class {
	#name : #ValuePrinterTest,
	#superclass : #TestCase,
	#category : #'Values-Testing'
}

{ #category : #Testing }
ValuePrinterTest >> testArray [
	self assert: Array new asSource = '#()'.
	self assert: #(1 2 3 4) asSource = '#(1 2 3 4)'.
	self assert: #(1 2 3 4 5 6 7 8 9 10) asSource = '#(1 2 3 4 5 6 7 8 9 10)'.
	self assert: (Array with: 1 with: 2 with: 3 with: 4) asSource = '#(1 2 3 4)'.
	self assert: (Array with: 1 with: (Date d: 7 m: 7 y: 2007) with: ColorValue red) asSource = '(Array
	with: 1
	with: (Date d: 7 m: 7 y: 2007)
	with: ColorValue red)'.
	self assert: (#(1 2 3 4) , (Array with: (Date d: 7 m: 7 y: 2007))) asSource = '((OrderedCollection new: 5)
	add: 1;
	add: 2;
	add: 3;
	add: 4;
	add: (Date d: 7 m: 7 y: 2007);
	yourself)'.
	self assert: (Array with: Testvalue example with: (Date d: 7 m: 7 y: 2007) with: ColorValue red) asSource = '(Array
	with: (Testvalue
		constant: #constantSymbol
		optional: #optionalSymbol
		array: #(1 #a $x ''name'')
		dictionary: (Valuemap
			with: 1 -> #symbol
			with: #key -> ''string''))
	with: (Date d: 7 m: 7 y: 2007)
	with: ColorValue red)'.
]

{ #category : #Testing }
ValuePrinterTest >> testArraySource [
	self assert: (Testvalue
		constant: #constantSymbol
		optional: #optionalSymbol
		array: #(1 #a $x 'name')
		dictionary: (Valuemap
			with: 1 -> #symbol
			with: #key -> 'string')) asSource = '(Testvalue
	constant: #constantSymbol
	optional: #optionalSymbol
	array: #(1 #a $x ''name'')
	dictionary: (Valuemap
		with: 1 -> #symbol
		with: #key -> ''string''))'.
]

{ #category : #Testing }
ValuePrinterTest >> testBoolean [
	self assert: true asSource = 'true'.
	self assert: false asSource = 'false'.
]

{ #category : #Testing }
ValuePrinterTest >> testColorValue [
	self assert: ColorValue new isEmpty.
	self assert: ColorValue red asSource = 'ColorValue red'.
	self assert: (ColorValue fromBytesRed: 255 green: 0 blue: 0) asSource = 'ColorValue red'.
	self assert: (ColorValue fromBytesRed: 255 green: 0 blue: 10) asSource = '(ColorValue fromBytesRed: 255 green: 0 blue: 10)'
]

{ #category : #Testing }
ValuePrinterTest >> testDate [
	self assert: (Date d: 7 m: 7 y: 2007) asSource = '(Date d: 7 m: 7 y: 2007)'
]

{ #category : #Testing }
ValuePrinterTest >> testDictionary [
	| dict |
	self assert: Valuemap new asSource = 'Valuemap new'.
	dict := Valuemap
		with: 1 -> 75
		with: #b -> $x.
	self assert: dict asSource = '(Valuemap
	with: 1 -> 75
	with: #b -> $x)'
]

{ #category : #Testing }
ValuePrinterTest >> testDictionarySource [
	self assert: (Testvalue
		constant: #constantSymbol
		optional: #optionalSymbol
		array: #(1 #a $x 'name')
		dictionary: (Valuemap
			with: 1 -> #symbol
			with: #key -> 'string')) asSource = '(Testvalue
	constant: #constantSymbol
	optional: #optionalSymbol
	array: #(1 #a $x ''name'')
	dictionary: (Valuemap
		with: 1 -> #symbol
		with: #key -> ''string''))'.
	self assert: (Testvalue constant: #Haider) asSource = '(Testvalue constant: #Haider)'
]

{ #category : #Testing }
ValuePrinterTest >> testDictionaryWithValues [
	| dict |
	dict := Valuemap
		with: 1 -> Testvalue example
		with: Testvalue example -> $x.
	self assert: dict asSource = '(Valuemap
	with: 1 -> (Testvalue
		constant: #constantSymbol
		optional: #optionalSymbol
		array: #(1 #a $x ''name'')
		dictionary: (Valuemap
			with: 1 -> #symbol
			with: #key -> ''string''))
	with: (Testvalue
		constant: #constantSymbol
		optional: #optionalSymbol
		array: #(1 #a $x ''name'')
		dictionary: (Valuemap
			with: 1 -> #symbol
			with: #key -> ''string'')) -> $x)'
]

{ #category : #Testing }
ValuePrinterTest >> testDuration [
	self assert: 5 minutes asSource = '(Duration nanoseconds: 300000000000)'
]

{ #category : #Testing }
ValuePrinterTest >> testLiteralArrays [
	self assert: #(1 2 10 20 100) asSource = '#(1 2 10 20 100)'
]

{ #category : #Testing }
ValuePrinterTest >> testLongDictionary [
	| dict |
	dict := Valuemap new.
	dict at: 1 put: 75.
	dict at: #b put: $x.
	dict at: 42 put: 'Hello'.
	dict at: 'abc' put: 32.
	dict at: 2 put: #(#String).
	dict at: true put: #hi.
	self assert: dict asSource = '((Valuemap new: 6)
	add: 1 -> 75;
	add: #b -> $x;
	add: 42 -> ''Hello'';
	add: ''abc'' -> 32;
	add: 2 -> #(#String);
	add: true -> #hi;
	yourself)'
]

{ #category : #Testing }
ValuePrinterTest >> testNumbers [
	self assert: 42 asSource = '42'.
	self assert: 429999999939333 asSource = '429999999939333'.
	self assert: 2.5 asSource = '2.5'.
	"only VW, not Gemstone
	self assert: 2.5e7 asSource = '2.5e7'.
	self assert: 2.5e-7 asSource = '2.5e-7'.
	self assert: 2.5d137 asSource = '2.5d137'.
	self assert: 2.5d-137 asSource = '2.5d-137'.
	self assert: 25s7 asSource = '25.0000000s'.
	self assert: (2 / 5) asSource = '(2 / 5)'.
	"
]

{ #category : #Testing }
ValuePrinterTest >> testOptionalConstantSource [
	self assert: (Testvalue
		constant: #constantSymbol
		optional: #optionalSymbol
		array: #(1 #a $x 'name')
		dictionary: (Valuemap
			with: 1 -> #symbol
			with: #key -> 'string')) asSource = '(Testvalue
	constant: #constantSymbol
	optional: #optionalSymbol
	array: #(1 #a $x ''name'')
	dictionary: (Valuemap
		with: 1 -> #symbol
		with: #key -> ''string''))'.
	self assert: (Testvalue
		constant: #constantSymbol
		optional: #optionalSymbol
		array: #(1 #a $x 'name')) asSource = '(Testvalue constant: #constantSymbol optional: #optionalSymbol array: #(1 #a $x ''name''))'.
	self assert: (Testvalue constant: #constantSymbol optional: #optionalSymbol) asSource = '(Testvalue constant: #constantSymbol optional: #optionalSymbol)'.
	self assert: (Testvalue constant: #constantSymbol) asSource = '(Testvalue constant: #constantSymbol)'
]

{ #category : #Testing }
ValuePrinterTest >> testPoint [
	self assert: (1 @ 2) asSource = '1 @ 2'.
	self assert: (1 @ (Date d: 7 m: 7 y: 2007)) asSource = '1 @ (Date d: 7 m: 7 y: 2007)'
]

{ #category : #Testing }
ValuePrinterTest >> testTime [
	self assert: (Time h: 7 m: 27 s: 13) asSource = '(Time h: 7 m: 27 s: 13)'.
	self assert: (Time h: 7 m: 27 s: 0) asSource = '(Time h: 7 m: 27)'.
	self assert: (Time h: 7 m: 27) asSource = '(Time h: 7 m: 27)'.
	self assert: (Time h: 7 m: 0 s: 0) asSource = '(Time h: 7)'.
	self assert: (Time h: 7 m: 0) asSource = '(Time h: 7)'.
	self assert: (Time h: 7) asSource = '(Time h: 7)'.
	self assert: (Time h: 0) asSource = 'Time zero'.
	self assert: Time zero asSource = 'Time zero'
]

{ #category : #Testing }
ValuePrinterTest >> testTimestamp [
	self assert: (Timestamp d: 15 m: 7 y: 2007 h: 7 m: 27 s: 13) asSource = '(Timestamp d: 15 m: 7 y: 2007 h: 7 m: 27 s: 13)'.
	self assert: (Timestamp d: 15 m: 7 y: 2007 h: 7 m: 27 s: 0) asSource = '(Timestamp d: 15 m: 7 y: 2007 h: 7 m: 27)'.
	self assert: (Timestamp d: 15 m: 7 y: 2007 h: 7 m: 27) asSource = '(Timestamp d: 15 m: 7 y: 2007 h: 7 m: 27)'.
	self assert: (Timestamp d: 15 m: 7 y: 2007 h: 7 m: 0 s: 0) asSource = '(Timestamp d: 15 m: 7 y: 2007 h: 7)'.
	self assert: (Timestamp d: 15 m: 7 y: 2007 h: 7 m: 0) asSource = '(Timestamp d: 15 m: 7 y: 2007 h: 7)'.
	self assert: (Timestamp d: 15 m: 7 y: 2007 h: 7) asSource = '(Timestamp d: 15 m: 7 y: 2007 h: 7)'.
	self assert: (Timestamp d: 15 m: 7 y: 2007 h: 0) asSource = '(Timestamp d: 15 m: 7 y: 2007)'.
	self assert: (Timestamp d: 15 m: 7 y: 2007) asSource = '(Timestamp d: 15 m: 7 y: 2007)'
]
