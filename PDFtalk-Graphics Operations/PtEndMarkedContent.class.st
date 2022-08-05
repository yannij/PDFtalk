"
End a marked-content sequence begun by a BMC or BDC operator
"
Class {
	#name : #PtEndMarkedContent,
	#superclass : #PtMarkedContentOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #accessing }
PtEndMarkedContent class >> documentation [
	^'End a marked-content sequence begun by a BMC or BDC operator'
]

{ #category : #accessing }
PtEndMarkedContent class >> operatorName [
	^#EMC
]

{ #category : #accessing }
PtEndMarkedContent class >> pdfVersion [
	^PtVersion pdf1_2
]

{ #category : #actions }
PtEndMarkedContent >> processWith: aProcessor at: indexInteger [
	aProcessor addEndMarkedContent
]
