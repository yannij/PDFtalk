"
Fill the path, using the nonzero winding number rule to determine the region to fill. 
Any subpaths that are open shall be implicitly closed before being filled
"
Class {
	#name : #PtFill,
	#superclass : #PtPathPaintingOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #accessing }
PtFill class >> documentation [
	^'Fill the path, using the nonzero winding number rule to determine the region to fill. Any subpaths that are open shall be implicitly closed before being filled'
]

{ #category : #accessing }
PtFill class >> operatorName [
	^#f
]
