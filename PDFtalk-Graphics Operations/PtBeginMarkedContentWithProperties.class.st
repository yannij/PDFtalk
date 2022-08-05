"
Begin a marked-content sequence with an associated property list, terminated by a balancing EMC operator. 
tag shall be a name object indicating the role or significance of the sequence. 
properties shall be either an inline dictionary containing the property list or a name object associated with it in the 
Properties subdictionary of the current resource dictionary
"
Class {
	#name : #PtBeginMarkedContentWithProperties,
	#superclass : #PtMarkedContentOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #accessing }
PtBeginMarkedContentWithProperties class >> documentation [
	^'Begin a marked-content sequence with an associated property list, terminated by a balancing EMC operator. tag shall be a name object indicating the role or significance of the sequence. properties shall be either an inline dictionary containing the property list or a name object associated with it in the 
Properties subdictionary of the current resource dictionary'
]

{ #category : #accessing }
PtBeginMarkedContentWithProperties class >> end [
	^PtEndMarkedContent
]

{ #category : #accessing }
PtBeginMarkedContentWithProperties class >> operandTypes [
	^#(#('tag' Name) #('properties' Dictionary))
]

{ #category : #accessing }
PtBeginMarkedContentWithProperties class >> operatorName [
	^#BDC
]

{ #category : #accessing }
PtBeginMarkedContentWithProperties class >> pdfVersion [
	^PtVersion pdf1_2
]

{ #category : #actions }
PtBeginMarkedContentWithProperties >> processWith: aProcessor at: indexInteger [
	aProcessor addBeginMarkedContentWithProperties: self
]
