"
Fill and then stroke the path, using the nonzero winding number rule to determine the region to fill. 
This operator shall produce the same result as constructing two identical path objects, painting the first with f and the second with S.

NOTE
The filling and stroking portions of the operation consult different values of several graphics state parameters, such as the current colour
"
Class {
	#name : #PtFillAndStroke,
	#superclass : #PtPathPaintingOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #accessing }
PtFillAndStroke class >> documentation [
	^'Fill and then stroke the path, using the nonzero winding number rule to determine the region to fill. This operator shall produce the same result as constructing two identical path objects, painting the first with f and the second with S.

NOTE
The filling and stroking portions of the operation consult different values of several graphics state parameters, such as the current colour'
]

{ #category : #accessing }
PtFillAndStroke class >> operatorName [
	^#B
]
