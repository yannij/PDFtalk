"
Bitmapped image or external graphics object
"
Class {
	#name : #PtPicture,
	#superclass : #PtGraphicelement,
	#category : #'PDFtalk-Graphics'
}

{ #category : #printing }
PtPicture >> printOn: stream [
	stream
		nextPutAll: self class name;
		nextPut: $(;
		nextPutAll: self operation class name;
		nextPut: $)
]
