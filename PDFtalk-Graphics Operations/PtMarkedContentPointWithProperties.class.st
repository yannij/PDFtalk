"
Designate a marked-content point with an associated property list. 
tag shall be a name object indicating the role or significance of the point. 
properties shall be either an inline dictionary containing the property list or a name object associated with it in the Properties subdictionary of the current resource dictionary
"
Class {
	#name : #PtMarkedContentPointWithProperties,
	#superclass : #PtMarkedContentOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #accessing }
PtMarkedContentPointWithProperties class >> documentation [
	^'Designate a marked-content point with an associated property list. tag shall be a name object indicating the role or significance of the point. properties shall be either an inline dictionary containing the property list or a name object associated with it in the Properties subdictionary of the current resource dictionary'
]

{ #category : #accessing }
PtMarkedContentPointWithProperties class >> operandTypes [
	^#(#('tag' Name) #('properties' Dictionary))
]

{ #category : #accessing }
PtMarkedContentPointWithProperties class >> operatorName [
	^#DP
]

{ #category : #accessing }
PtMarkedContentPointWithProperties class >> pdfVersion [
	^PtVersion pdf1_2
]
