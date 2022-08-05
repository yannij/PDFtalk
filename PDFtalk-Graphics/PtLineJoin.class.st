"
PDF Line Cap Style as defined in PDF 32000_2008.pdf, section 8.4.3.4, pp. 125.

The line join style shall specify the shape to be used at the corners of paths that are stroked. Table 55 shows the possible values. Join styles shall be significant only at points where consecutive segments of a path connect at an angle; segments that meet or intersect fortuitously shall receive no special treatment.

0	Miter join	The outer edges of the strokes for the two segments shall beextended until they meet at an angle, as in a picture frame. 
				If the segments meet at too sharp an angle (as defined by the miter limit parameter), a bevel join shall be used instead.
1	Round join	An arc of a circle with a diameter equal to the line width shall be drawn around the point where the two segments meet, 
				connecting the outer edges of the strokes for the two segments. 
				This pieslice-shaped figure shall be filled in, producing a rounded corner.
2	Bevel join	The two segments shall be finished with butt caps and the resulting notch beyond the ends of the segments shall be filled with a triangle.
"
Class {
	#name : #PtLineJoin,
	#superclass : #Value,
	#instVars : [
		'value'
	],
	#category : #'PDFtalk-Graphics'
}

{ #category : #instances }
PtLineJoin class >> bevel [
	^self value: 2
]

{ #category : #specification }
PtLineJoin class >> localSpecification [
	<constant: #value class: #Integer>
]

{ #category : #instances }
PtLineJoin class >> miter [
	^self value: 0
]

{ #category : #instances }
PtLineJoin class >> round [
	^self value: 1
]

{ #category : #'instance creation' }
PtLineJoin class >> value: valueInteger [
	| inst |
	inst := self new.
	inst initializeValue: valueInteger.
	^inst
]

{ #category : #'initialize-release' }
PtLineJoin >> initializeValue: valueInteger [
	value := valueInteger.
	self beImmutable
]

{ #category : #printing }
PtLineJoin >> printvalueWith: printer [
	| args |
	args := OrderedCollection new.
	args add: (printer constant: 'value' value: self value).
	^printer printvalue: self arguments: args
]

{ #category : #accessing }
PtLineJoin >> value [
	"<Integer>"

	^value
]
