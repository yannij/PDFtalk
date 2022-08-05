"
Designate a marked-content point. 
tag shall be a name object indicating the role or significance of the point
"
Class {
	#name : #PtMarkedContentPoint,
	#superclass : #PtMarkedContentOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #accessing }
PtMarkedContentPoint class >> documentation [
	^'Designate a marked-content point. tag shall be a name object indicating the role or significance of the point'
]

{ #category : #accessing }
PtMarkedContentPoint class >> operandTypes [
	^#(#('tag' Name))
]

{ #category : #accessing }
PtMarkedContentPoint class >> operatorName [
	^#MP
]

{ #category : #accessing }
PtMarkedContentPoint class >> pdfVersion [
	^PtVersion pdf1_2
]
