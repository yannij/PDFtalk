"
Modify the current clipping path by intersecting it with the current path, 
using the nonzero winding number rule to determine which regions lie inside the clipping path.

"
Class {
	#name : #PtClip,
	#superclass : #PtClippingPathOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #accessing }
PtClip class >> documentation [
	^'Modify the current clipping path by intersecting it with the current path, using the nonzero winding number rule to determine which regions lie inside the clipping path'
]

{ #category : #accessing }
PtClip class >> operatorName [
	^#W
]

{ #category : #accessing }
PtClip >> rule [
	^#NonzeroWindingNumber
]
