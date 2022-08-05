"
Append a rectangle to the current path as a complete subpath, with lower-left corner (x, y) and dimensions width and height in user space. 
The operation
	x y width height re
is equivalent to
	x y m
	(x + width) y l
	(x + width) (y + height) l
	x (y + height) l
	h
"
Class {
	#name : #PtAppendRectangle,
	#superclass : #PtPathConstructionOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #accessing }
PtAppendRectangle class >> documentation [
	^'Append a rectangle to the current path as a complete subpath, with lower-left corner (x, y) and dimensions width and height in user space. The operation
	x y width height re
is equivalent to
	x y m
	(x + width) y l
	(x + width) (y + height) l
	x (y + height) l
	h'
]

{ #category : #accessing }
PtAppendRectangle class >> operandTypes [
	^#(#('x' Number) #('y' Number) #('width' Number) #('height' Number))
]

{ #category : #accessing }
PtAppendRectangle class >> operatorName [
	^#re
]

{ #category : #accessing }
PtAppendRectangle >> extent [
	"<Point>"

	| w h |
	w := self operands at: 3.
	h := self operands last.
	^(w asSmalltalkValue @ h asSmalltalkValue) abs
]

{ #category : #accessing }
PtAppendRectangle >> frame [
	"<Rectangle>"

	^self origin extent: self extent
]

{ #category : #accessing }
PtAppendRectangle >> origin [
	"<Point>"

	| x y |
	x := self operands first.
	y := self operands at: 2.
	^x asSmalltalkValue @ y asSmalltalkValue
]

{ #category : #accessing }
PtAppendRectangle >> rectangle [
	"<Rectangle>"

	^self origin extent: self extent
]
