Class {
	#name : #ColorValueTest,
	#superclass : #TestCase,
	#instVars : [
		'black',
		'white'
	],
	#category : #'Values-Testing'
}

{ #category : #running }
ColorValueTest >> setUp [
	super setUp.
	white := ColorValue white.
	black := ColorValue black
]

{ #category : #testing }
ColorValueTest >> testAccessing [
	self
		assert: ColorValue yellow yellow equals: 1.0;
		assert: ColorValue cyan cyan equals: 1.0;
		assert: ColorValue magenta magenta equals: 1.0
]

{ #category : #testing }
ColorValueTest >> testBridgedNamedColors [
	self assert: ColorValue black class equals: ColorValue.
	ColorValue namedValueNames do: [:selector |
		self assert: (ColorValue perform: selector) equals: (Color perform: selector) asColorValue]
]

{ #category : #testing }
ColorValueTest >> testConversionToByteArray [
	self
		assert: black asByteArray equals: #[0 0 0];
		assert: white asByteArray equals: #[255 255 255]
]

{ #category : #testing }
ColorValueTest >> testConversionToColorValue [
	self
		assert: black asColorValue == black;
		assert: white asColorValue == white
]

{ #category : #testing }
ColorValueTest >> testConversionToColorValueFromColor [
	self
		assert: black asColorValue equals: (ColorValue red: 0 green: 0 blue: 0);
		assert: white asColorValue equals: (ColorValue red: 1 green: 1 blue: 1)
]

{ #category : #testing }
ColorValueTest >> testConversionToGrayValue [
	self
		assert: black asGrayValue equals: 0.0;
		assert: white asGrayValue equals: 1.0
]

{ #category : #testing }
ColorValueTest >> testNamedColors [
	self
		assert: ColorValue namedValueNames size equals: 8;
		assert: Object namedValueNames size equals: 0
]

{ #category : #testing }
ColorValueTest >> testNamesByValues [
	self assert: ColorValue namesByValues size equals: 8.
	self assert: ColorValue namesByValues values asArray equals: ColorValue namedValueNames
]

{ #category : #testing }
ColorValueTest >> testRGBIndex [
	self
		assert: black rgbIndex equals: 0;
		assert: white rgbIndex equals: 2r111111111111111111111111
]
