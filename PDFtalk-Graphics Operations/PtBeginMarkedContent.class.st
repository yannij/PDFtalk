"
Begin a marked-content sequence terminated by a balancing EMC operator. 
tag shall be a name object indicating the role or significance of the sequence
"
Class {
	#name : #PtBeginMarkedContent,
	#superclass : #PtMarkedContentOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #accessing }
PtBeginMarkedContent class >> documentation [
	^'Begin a marked-content sequence terminated by a balancing EMC operator. tag shall be a name object indicating the role or significance of the sequence'
]

{ #category : #accessing }
PtBeginMarkedContent class >> end [
	^PtEndMarkedContent
]

{ #category : #accessing }
PtBeginMarkedContent class >> operandTypes [
	^#(#('tag' Name))
]

{ #category : #accessing }
PtBeginMarkedContent class >> operatorName [
	^#BMC
]

{ #category : #accessing }
PtBeginMarkedContent class >> pdfVersion [
	^PtVersion pdf1_2
]

{ #category : #actions }
PtBeginMarkedContent >> processWith: aProcessor at: indexInteger [
	aProcessor addBeginMarkedContent: self
]
