"
PDF Rectangle as defined in PDF 32000_2008.pdf, section 7.9.5, pp. 88.

Rectangles are used to describe locations on a page and bounding boxes for a variety of objects.
A rectangle shall be written as an array of four numbers giving the coordinates of a pair of diagonally opposite corners.

NOTE
Although rectangles are conventionally specified by their lower-left and upper-right corners, it is acceptable to specify any two diagonally opposite corners.
Applications that process PDF should be prepared to normalize such rectangles in situations where specific corners are required.

Typically, the array takes the form
	[llx lly urx ury]
specifying the lower-left x, lower-left y, upper-right x, and upper-right y coordinates of the rectangle, in that order.
The other two corners of the rectangle are then assumed to have coordinates (llx, ury) and (urx, lly).

"
Class {
	#name : #PtRectangle,
	#superclass : #PDFArray,
	#category : #'PDFtalk-Data Structures'
}

{ #category : #'instance creation' }
PtRectangle class >> fromRectangle: aRectangle [
	^self
		with: aRectangle left
		with: aRectangle origin y
		with: aRectangle right
		with: aRectangle corner y
]

{ #category : #accessing }
PtRectangle class >> numberOfAttributes [
	^4
]

{ #category : #accessing }
PtRectangle class >> pdfTypeDefinition [

	^PDFTypeDefinition
		name: #Rectangle
		supertype: #Object
		section: '7.9.5'
		documentation: 'Rectangles are used to describe locations on a page and bounding boxes for a variety of objects.
A rectangle shall be written as an array of four numbers giving the coordinates of a pair of diagonally opposite corners.

NOTE
Although rectangles are conventionally specified by their lower-left and upper-right corners, it is acceptable to specify any two diagonally opposite corners.
Applications that process PDF should be prepared to normalize such rectangles in situations where specific corners are required.

Typically, the array takes the form
	[llx lly urx ury]
specifying the lower-left x, lower-left y, upper-right x, and upper-right y coordinates of the rectangle, in that order.
The other two corners of the rectangle are then assumed to have coordinates (llx, ury) and (urx, lly).'
]

{ #category : #converting }
PtRectangle >> asRectangle [
	"<Rectangle>"

	| norm |
	norm := self normalized.
	^norm llx asSmalltalkValue @ norm lly asSmalltalkValue corner: norm urx asSmalltalkValue @ norm ury asSmalltalkValue
]

{ #category : #'accessing entries' }
PtRectangle >> llx [
	<type: #Number>
	<required>
	<attribute: 1 documentation: 'lower-left x'>
	^self objectAt: 1
]

{ #category : #'accessing entries' }
PtRectangle >> lly [
	<type: #Number>
	<required>
	<attribute: 2 documentation: 'lower-left y'>
	^self objectAt: 2
]

{ #category : #converting }
PtRectangle >> normalized [
	"<Rectangle>
	where llx @ lly is the lower left corner and urx @ ury is the upper right corner"

	| new |
	new := self class empty.
	self llx asSmalltalkValue <= self urx asSmalltalkValue
		ifTrue: [
		new at: 1 put: (self at: 1).
		new at: 3 put: (self at: 3)]
		ifFalse: [
		new at: 1 put: (self at: 3).
		new at: 3 put: (self at: 1)].
	self lly asSmalltalkValue <= self ury asSmalltalkValue
		ifTrue: [
		new at: 2 put: (self at: 2).
		new at: 4 put: (self at: 4)]
		ifFalse: [
		new at: 2 put: (self at: 4).
		new at: 4 put: (self at: 2)].
	^new
]

{ #category : #'accessing entries' }
PtRectangle >> urx [
	<type: #Number>
	<required>
	<attribute: 3 documentation: 'upper-right x'>
	^self objectAt: 3
]

{ #category : #'accessing entries' }
PtRectangle >> ury [
	<type: #Number>
	<required>
	<attribute: 4 documentation: 'upper-right y'>
	^self objectAt: 4
]
