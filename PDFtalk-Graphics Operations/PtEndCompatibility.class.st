"
End a compatibility section begun by a balancing BX operator. 
Ignore any unrecognized operands and operators from previous matching BX onward.
"
Class {
	#name : #PtEndCompatibility,
	#superclass : #PtCompatibilityOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #accessing }
PtEndCompatibility class >> documentation [
	^'End a compatibility section begun by a balancing BX operator. Ignore any unrecognized operands and operators from previous matching BX onward'
]

{ #category : #accessing }
PtEndCompatibility class >> operatorName [
	^#EX
]

{ #category : #accessing }
PtEndCompatibility class >> pdfVersion [
	^PtVersion pdf1_1
]
