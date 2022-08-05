"
Close the current subpath by appending a straight line segment from the current point to the starting point of the subpath. 
If the current subpath is already closed, h shall do nothing.

This operator terminates the current subpath. 
Appending another segment to the current path shall begin a new subpath, even if the new segment begins at the endpoint reached by the h operation
"
Class {
	#name : #PtClosePath,
	#superclass : #PtPathConstructionOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #accessing }
PtClosePath class >> documentation [
	^'Close the current subpath by appending a straight line segment from the current point to the starting point of the subpath. If the current subpath is already closed, h shall do nothing.

This operator terminates the current subpath. Appending another segment to the current path shall begin a new subpath, even if the new segment begins at the endpoint reached by the h operation'
]

{ #category : #accessing }
PtClosePath class >> operatorName [
	^#h
]
