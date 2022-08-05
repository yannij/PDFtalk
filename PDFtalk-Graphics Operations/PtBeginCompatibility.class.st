"
Begin a compatibility section. 
Unrecognized operators (along with their operands) shall be ignored without error until the balancing EX operator is encountered.
"
Class {
	#name : #PtBeginCompatibility,
	#superclass : #PtCompatibilityOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #accessing }
PtBeginCompatibility class >> documentation [
	^'Begin a compatibility section. Unrecognized operators (along with their operands) shall be ignored without error until the balancing EX operator is encountered'
]

{ #category : #accessing }
PtBeginCompatibility class >> end [
	^PtEndCompatibility
]

{ #category : #accessing }
PtBeginCompatibility class >> operatorName [
	^#BX
]

{ #category : #accessing }
PtBeginCompatibility class >> pdfVersion [
	^PtVersion pdf1_1
]
