"
PDF Line Cap Style as defined in PDF 32000_2008.pdf, section 8.4.3.3, pp. 125.

The line cap style shall specify the shape that shall be used at the ends of open subpaths (and dashes, if any) when they are stroked.

0	Butt cap. 				The stroke shall be squared off at the endpoint of the path. There shall be no projection beyond the end of the path.
1	Round cap. 				A semicircular arc with a diameter equal to the line width shall be drawn around the endpoint and shall be filled in.
2	Projecting square cap. 	The stroke shall continue beyond the endpoint of the path for a distance equal to half the line width and shall besquared off.
"
Class {
	#name : #PtLineCap,
	#superclass : #Value,
	#instVars : [
		'value'
	],
	#category : #'PDFtalk-Graphics'
}

{ #category : #instances }
PtLineCap class >> butt [
	^self value: 0
]

{ #category : #specification }
PtLineCap class >> localSpecification [
	<constant: #value class: #Integer>
]

{ #category : #instances }
PtLineCap class >> projectingSquare [
	^self value: 2
]

{ #category : #instances }
PtLineCap class >> round [
	^self value: 1
]

{ #category : #'instance creation' }
PtLineCap class >> value: valueInteger [
	| inst |
	inst := self new.
	inst initializeValue: valueInteger.
	^inst
]

{ #category : #'initialize-release' }
PtLineCap >> initializeValue: valueInteger [
	value := valueInteger.
	self beImmutable
]

{ #category : #printing }
PtLineCap >> printvalueWith: printer [
	| args |
	args := OrderedCollection new.
	args add: (printer constant: 'value' value: self value).
	^printer printvalue: self arguments: args
]

{ #category : #accessing }
PtLineCap >> value [
	"<Integer>"

	^value
]
