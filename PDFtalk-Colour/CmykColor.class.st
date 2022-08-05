"
CmykColor used for printing.

This class is defined in the Smalltalk.Graphics namespace, because it is widely used elsewhere.

Instance Variables
	name		<String>		the color name
	cyan		<Number>		between 0 and 1
	magenta	<Number>		between 0 and 1
	yellow		<Number>		between 0 and 1
	black		<Number>		the k component. Between 0 and 1
	rgb			<ByteArray>	optional explicit screen color. ByteArray with 3 bytes (RGB)

"
Class {
	#name : #CmykColor,
	#superclass : #Value,
	#instVars : [
		'name',
		'cyan',
		'magenta',
		'yellow',
		'black',
		'rgb'
	],
	#category : #'PDFtalk-Colour'
}

{ #category : #'named instances' }
CmykColor class >> black [
	^self name: 'Black' cyan: 0 magenta: 0 yellow: 0 black: 1
]

{ #category : #'instance creation optional' }
CmykColor class >> cyan: cyanNumber magenta: magentaNumber yellow: yellowNumber black: blackNumber [
	| inst |
	inst := self new.
	inst
		initializeName: nil
		cyan: cyanNumber
		magenta: magentaNumber
		yellow: yellowNumber
		black: blackNumber
		rgb: nil.
	^inst
]

{ #category : #'instance creation optional' }
CmykColor class >> cyan: cyanNumber magenta: magentaNumber yellow: yellowNumber black: blackNumber rgb: rgbByteArray [
	| inst |
	inst := self new.
	inst
		initializeName: nil
		cyan: cyanNumber
		magenta: magentaNumber
		yellow: yellowNumber
		black: blackNumber
		rgb: rgbByteArray.
	^inst
]

{ #category : #'instance creation' }
CmykColor class >> fromColorValue: aColorValue [
	aColorValue = ColorValue black ifTrue: [
		^self black].
	aColorValue isGray ifTrue: [
		^self gray: 1 - aColorValue brightness].
	^self
		cyan: aColorValue cyan
		magenta: aColorValue magenta
		yellow: aColorValue yellow
		black: 1 - aColorValue brightness
		rgb: aColorValue asByteArray
]

{ #category : #'instance creation' }
CmykColor class >> gray: colorValueBrightness [
	colorValueBrightness <= 0 ifTrue: [
		^self white].
	colorValueBrightness >= 1 ifTrue: [
		^self black].
	^self cyan: 0 magenta: 0 yellow: 0 black: colorValueBrightness
]

{ #category : #specification }
CmykColor class >> localSpecification [
	<optional: #name class: #String default: 'String new'>
	<constant: #cyan class: #Number>
	<constant: #magenta class: #Number>
	<constant: #yellow class: #Number>
	<constant: #black class: #Number>
	<optional: #rgb class: #ByteArray default: 'self computedRGB'>
]

{ #category : #'instance creation optional' }
CmykColor class >> name: nameString cyan: cyanNumber magenta: magentaNumber yellow: yellowNumber black: blackNumber [
	| inst |
	inst := self new.
	inst
		initializeName: nameString
		cyan: cyanNumber
		magenta: magentaNumber
		yellow: yellowNumber
		black: blackNumber
		rgb: nil.
	^inst
]

{ #category : #'instance creation' }
CmykColor class >> name: nameString cyan: cyanNumber magenta: magentaNumber yellow: yellowNumber black: blackNumber rgb: rgbByteArray [
	| inst |
	inst := self new.
	inst
		initializeName: nameString
		cyan: cyanNumber
		magenta: magentaNumber
		yellow: yellowNumber
		black: blackNumber
		rgb: rgbByteArray.
	^inst
]

{ #category : #'named instances' }
CmykColor class >> white [
	^self name: 'White' cyan: 0 magenta: 0 yellow: 0 black: 0
]

{ #category : #converting }
CmykColor >> asArray [
	"<Array4 of: Number>
	Array of 4 numbers between 0.0 (zero concentration) and 1.0 (maximum concentration) suitable for PDF DeviceCMYK"

	^Array
		with: self cyan
		with: self magenta
		with: self yellow
		with: self black
]

{ #category : #converting }
CmykColor >> asCMY [
	"<Array3 of: Number [0..1]>"

	| c blackInv m y |
	blackInv := 1 - self black.
	self isMonochrome ifTrue: [
		^Array
			with: blackInv
			with: blackInv
			with: blackInv].
	self black = 1.0 ifTrue: [
		^#(0 0 0)].
	c := self cyan * blackInv.
	m := self magenta * blackInv.
	y := self yellow * blackInv.
	^Array
		with: c + self black
		with: m + self black
		with: y + self black
]

{ #category : #converting }
CmykColor >> asCmykColor [
	"<CmykColor>"

	^self
]

{ #category : #converting }
CmykColor >> asColorRef [
	"<Integer>"

	^self asColorValue asColorRef
]

{ #category : #converting }
CmykColor >> asColorValue [
	"<ColorValue>"

	| cmy |
	rgb ifNotNil: [:rgbBytes |
		^ColorValue red: (rgbBytes at: 1) green: (rgbBytes at: 2) blue: (rgbBytes at: 3) range: 255].
	self cyan + self magenta + self yellow = 0 ifTrue: [
		^ColorValue brightness: 1 - self black].
	self black = 1.0 ifTrue: [
		^ColorValue black].
	cmy := self asCMY.
	^ColorValue red: 1 - (cmy at: 1) green: 1 - (cmy at: 2) blue: 1 - (cmy at: 3)
]

{ #category : #converting }
CmykColor >> asGrayValue [
	"<Number>
	between 0.0 (Black) and 1.0 (White) suitable for PDF DeviceGray"

	self isMonochrome ifFalse: [
		^self error: 'no grayscale color'].
	^1.0 - self black
]

{ #category : #converting }
CmykColor >> asPDFArray [
	"<Array4 of: Number>
	Array of 4 numbers between 0.0 (zero concentration) and 1.0 (maximum concentration) suitable for PDF DeviceCMYK"

	^Array
		with: self cyan
		with: self magenta
		with: self yellow
		with: self black
]

{ #category : #converting }
CmykColor >> asPsComment [
	"<String>
	a string suitable for eps header"

	| wst |
	wst := WriteStream on: (String new: 20).
	wst
		nextPutAll: (self asPsNumber: self cyan);
		space;
		nextPutAll: (self asPsNumber: self magenta);
		space;
		nextPutAll: (self asPsNumber: self yellow);
		space;
		nextPutAll: (self asPsNumber: self black);
		space;
		nextPutAll: self psName.
	^wst contents
]

{ #category : #converting }
CmykColor >> asPsNumber: aNumber [
	"<String>
	a string suitable for eps header"

	^(aNumber isInteger
		ifTrue: [aNumber]
		ifFalse: [aNumber asFloat]) asSource
]

{ #category : #accessing }
CmykColor >> black [
	"<Number[0..1]>"

	^black
]

{ #category : #converting }
CmykColor >> blendWith: aCmykColor [
	"DOES NOT WORK - need to study CMYK math"
	"Answer a new CmykColor which is a 50% blend of the receiver and the
	supplied CmykColor."
	"Simply interpolates in CMYK space."

	^self class
		cyan: (self cyan + aCmykColor cyan) / 2
		magenta: (self magenta + aCmykColor magenta) / 2
		yellow: (self yellow + aCmykColor yellow) / 2
		black: (self black + aCmykColor black) / 2
]

{ #category : #converting }
CmykColor >> computedRGB [
	"<ByteArray3 of: Number [0..255]>"

	^self asColorValue asByteArray
]

{ #category : #accessing }
CmykColor >> cyan [
	"<Number[0..1]>"

	^cyan
]

{ #category : #'initialize-release' }
CmykColor >> initializeName: nameString cyan: cyanNumber magenta: magentaNumber yellow: yellowNumber black: blackNumber rgb: rgbByteArray [
	(nameString notNil and: [
	self name ~= nameString]) ifTrue: [
			name := nameString].
	cyan := cyanNumber.
	magenta := magentaNumber.
	yellow := yellowNumber.
	black := blackNumber.
	(rgbByteArray notNil and: [
	self rgb ~= rgbByteArray]) ifTrue: [
			rgb := rgbByteArray].
	self beImmutable
]

{ #category : #testing }
CmykColor >> isMonochrome [
	^self cyan isZero and: [
	self magenta isZero and: [
	self yellow isZero]]
]

{ #category : #accessing }
CmykColor >> magenta [
	"<Number[0..1]>"

	^magenta
]

{ #category : #accessing }
CmykColor >> name [
	"<String>"

	^name ifNil: [String new]
]

{ #category : #accessing }
CmykColor >> nameForPostScript [
	"<String>"

	self name isEmpty ifTrue: [
		^self syntheticName].
	^self name
]

{ #category : #printing }
CmykColor >> printOn: stream [
	stream
		nextPutAll: self class name asString;
		space;
		nextPutAll: self asPsComment
]

{ #category : #printing }
CmykColor >> printvalueWith: printer [
	| args |
	args := OrderedCollection new.
	args add: (printer optional: 'name' value: name).
	args add: (printer constant: 'cyan' value: self cyan).
	args add: (printer constant: 'magenta' value: self magenta).
	args add: (printer constant: 'yellow' value: self yellow).
	args add: (printer constant: 'black' value: self black).
	args add: (printer optional: 'rgb' value: rgb).
	^printer printvalue: self arguments: args
]

{ #category : #converting }
CmykColor >> psName [
	"<String>
	a string suitable for PostScript sources"

	| wst |
	wst := WriteStream on: (String new: 10).
	wst
		nextPut: $(;
		nextPutAll: self nameForPostScript;
		nextPut: $).
	^wst contents
]

{ #category : #accessing }
CmykColor >> rgb [
	"<ByteArray3>
	optional - can have a custom RGB color attached"

	^rgb ifNil: [self computedRGB]
]

{ #category : #accessing }
CmykColor >> syntheticName [
	"<String>"

	| wst |
	wst := WriteStream on: (String new: 10).
	wst
		nextPutAll: (self cyan * 100) rounded printString;
		nextPut: $c;
		nextPutAll: (self magenta * 100) rounded printString;
		nextPut: $m;
		nextPutAll: (self yellow * 100) rounded printString;
		nextPut: $y;
		nextPutAll: (self black * 100) rounded printString;
		nextPut: $k.
	^wst contents
]

{ #category : #accessing }
CmykColor >> yellow [
	"<Number[0..1]>"

	^yellow
]
