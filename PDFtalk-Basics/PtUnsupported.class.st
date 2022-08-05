"
Unsupported is raised when a feature of the PDF specification is not (yet) supported
"
Class {
	#name : #PtUnsupported,
	#superclass : #PtError,
	#category : #'PDFtalk-Basics'
}

{ #category : #printing }
PtUnsupported >> printOn: stream [
	stream nextPutAll: self description
]
