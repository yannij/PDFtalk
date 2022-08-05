"
PDF Transformation Matrices as defined in PDF 32000_2008.pdf, section 8.3.4, pp. 119.

To understand the mathematics of coordinate transformations in PDF, it is vital to remember two points:
	• Transformations alter coordinate systems, not graphics objects.
	All objects painted before a transformation is applied shall be unaffected by the transformation.
	Objects painted after the transformation is applied shall be interpreted in the transformed coordinate system.
	• Transformation matrices specify the transformation from the new (transformed) coordinate system to the original (untransformed) coordinate system.
	All coordinates used after the transformation shall be expressed in the transformed coordinate system.
	PDF applies the transformation matrix to find the equivalent coordinates in the untransformed coordinate system.

NOTE 1
Many computer graphics textbooks consider transformations of graphics objects rather than of coordinate systems.
Although either approach is correct and self-consistent, some details of the calculations differ depending on which point of view is taken.

PDF represents coordinates in a two-dimensional space.
The point (x, y) in such a space can be expressed in vector form as [x y 1].
The constant third element of this vector (1) is needed so that the vector can be used with 3-by-3 matrices in the calculations described below.

The transformation between two coordinate systems can be represented by a 3-by-3 transformation matrix written as follows:
[a b 0]
[c d 0]
[e f 1]

Because a transformation matrix has only six elements that can be changed, in most cases in PDF it shall be specified as the six-element array [a b c d e f]
"
Class {
	#name : #PtMatrix,
	#superclass : #PDFArray,
	#category : #'PDFtalk-Graphics'
}

{ #category : #'instance creation' }
PtMatrix class >> empty [
	^self identity
]

{ #category : #'instance creation' }
PtMatrix class >> identity [
	^self on: #(1 0 0 1 0 0)
]

{ #category : #accessing }
PtMatrix class >> numberOfAttributes [
	^6
]

{ #category : #accessing }
PtMatrix class >> pdfTypeDefinition [

	^PDFTypeDefinition
		name: #Matrix
		supertype: #Object
		section: '8.3.4'
		documentation: 'To understand the mathematics of coordinate transformations in PDF, it is vital to remember two points:
	• Transformations alter coordinate systems, not graphics objects.
	All objects painted before a transformation is applied shall be unaffected by the transformation.
	Objects painted after the transformation is applied shall be interpreted in the transformed coordinate system.
	• Transformation matrices specify the transformation from the new (transformed) coordinate system to the original (untransformed) coordinate system.
	All coordinates used after the transformation shall be expressed in the transformed coordinate system.
	PDF applies the transformation matrix to find the equivalent coordinates in the untransformed coordinate system.

NOTE 1
Many computer graphics textbooks consider transformations of graphics objects rather than of coordinate systems.
Although either approach is correct and self-consistent, some details of the calculations differ depending on which point of view is taken.

PDF represents coordinates in a two-dimensional space.
The point (x, y) in such a space can be expressed in vector form as [x y 1].
The constant third element of this vector (1) is needed so that the vector can be used with 3-by-3 matrices in the calculations described below.

The transformation between two coordinate systems can be represented by a 3-by-3 transformation matrix written as follows:
[a b 0]
[c d 0]
[e f 1]

Because a transformation matrix has only six elements that can be changed, in most cases in PDF it shall be specified as the six-element array [a b c d e f]'
]

{ #category : #'instance creation' }
PtMatrix class >> rotation: radians [
	"<Matrix>
	rotate counter-clock wise.
	0 is to the right"

	| cos sin matrix |
	cos := radians cos.
	sin := radians sin.
	matrix := self identity.
	matrix at: 1 put: cos.
	matrix at: 2 put: sin.
	matrix at: 3 put: sin negated.
	matrix at: 4 put: cos.
	^matrix
]

{ #category : #'instance creation' }
PtMatrix class >> rotationDegrees: degrees [
	"<Matrix>
	rotate counter-clock wise.
	0 is to the right"

	^self rotation: degrees degreesToRadians
]

{ #category : #'instance creation' }
PtMatrix class >> scaling: aPoint [
	| m |
	m := self identity.
	m at: 1 put: aPoint x.
	m at: 4 put: aPoint y.
	^m
]

{ #category : #'instance creation' }
PtMatrix class >> translation: aPoint [
	| m |
	m := self identity.
	m at: 5 put: aPoint x.
	m at: 6 put: aPoint y.
	^m
]

{ #category : #'instance creation' }
PtMatrix class >> xFrom: fromPoint to: toPoint [
	"<Matrix>
	a coordinate system defined by two points.
	The x-axis starts at fromPoint progresses towards toPoint"

	| diff dist |
	diff := toPoint - fromPoint.
	dist := diff r.
	^((self rotation: diff theta) scaledBy: dist @ dist) translatedBy: fromPoint
]

{ #category : #'accessing entries' }
PtMatrix >> a [
	<type: #Number>
	<required>
	<attribute: 1 documentation: 'Matrix element'>
	^self objectAt: 1 ifNil: [0 asPDF]
]

{ #category : #'accessing entries' }
PtMatrix >> b [
	<type: #Number>
	<required>
	<attribute: 2 documentation: 'Matrix element'>
	^self objectAt: 2 ifNil: [0 asPDF]
]

{ #category : #'accessing entries' }
PtMatrix >> c [
	<type: #Number>
	<required>
	<attribute: 3 documentation: 'Matrix element'>
	^self objectAt: 3 ifNil: [0 asPDF]
]

{ #category : #operations }
PtMatrix >> concatenatedWith: otherMatrix [
	"<Matrix>"

	| a b c d e f a2 b2 c2 d2 e2 f2 new |
	a := self a asSmalltalkValue. b := self b asSmalltalkValue.
	c := self c asSmalltalkValue. d := self d asSmalltalkValue.
	e := self e asSmalltalkValue. f := self f asSmalltalkValue.
	a2 := otherMatrix a asSmalltalkValue. b2 := otherMatrix b asSmalltalkValue.
	c2 := otherMatrix c asSmalltalkValue. d2 := otherMatrix d asSmalltalkValue.
	e2 := otherMatrix e asSmalltalkValue. f2 := otherMatrix f asSmalltalkValue.
	new := Array new: 6.
	new at: 1 put: a * a2 + (b * c2).
	new at: 2 put: a * b2 + (b * d2).
	new at: 3 put: c * a2 + (d * c2).
	new at: 4 put: c * b2 + (d * d2).
	new at: 5 put: e * a2 + (f * c2) + e2.
	new at: 6 put: e * b2 + (f * d2) + f2.
	^self class on: new
]

{ #category : #'accessing entries' }
PtMatrix >> d [
	<type: #Number>
	<required>
	<attribute: 4 documentation: 'Matrix element'>
	^self objectAt: 4 ifNil: [0 asPDF]
]

{ #category : #'accessing entries' }
PtMatrix >> e [
	<type: #Number>
	<required>
	<attribute: 5 documentation: 'Matrix element'>
	^self objectAt: 5 ifNil: [0 asPDF]
]

{ #category : #'accessing entries' }
PtMatrix >> f [
	<type: #Number>
	<required>
	<attribute: 6 documentation: 'Matrix element'>
	^self objectAt: 6 ifNil: [0 asPDF]
]

{ #category : #operations }
PtMatrix >> rotatedBy: radian [
	^self concatenatedWith: (self class rotation: radian)
]

{ #category : #operations }
PtMatrix >> rotatedByDegrees: degrees [
	^self concatenatedWith: (self class rotationDegrees: degrees)
]

{ #category : #operations }
PtMatrix >> scaledBy: aPoint [
	^self concatenatedWith: (self class scaling: aPoint)
]

{ #category : #operations }
PtMatrix >> transformed: aPoint [
	"<Point>"

	| x y |
	x := self a asSmalltalkValue * aPoint x + (self c asSmalltalkValue * aPoint y) + self e asSmalltalkValue.
	y := self b asSmalltalkValue * aPoint x + (self d asSmalltalkValue * aPoint y) + self f asSmalltalkValue.
	^x @ y
]

{ #category : #operations }
PtMatrix >> transformedDelta: aPoint [
	"<Point>
	the translated delta from zero to aPoint.
	same as"
	"(self transformed: aPoint) - self transformedZero"

	| x y |
	x := self a asSmalltalkValue * aPoint x + (self c asSmalltalkValue * aPoint y).
	y := self b asSmalltalkValue * aPoint x + (self d asSmalltalkValue * aPoint y).
	^x @ y
]

{ #category : #operations }
PtMatrix >> transformedZero [
	"<Point>
	the origin transformed.
	Same as "
	"self transformed: 0 @ 0"
	""

	^self e asSmalltalkValue @ self f asSmalltalkValue
]

{ #category : #operations }
PtMatrix >> translatedBy: aPoint [
	"<Matrix>
	new matrix translated by aPoint"

	^self concatenatedWith: (self class translation: aPoint)
]

{ #category : #actions }
PtMatrix >> translatedByTransformedDelta: point [
	^self translatedBy: (self transformedDelta: point)
]
