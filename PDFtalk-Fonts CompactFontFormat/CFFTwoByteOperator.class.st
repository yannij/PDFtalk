"
An Operator encoded with two bytes (first byte is 12)
"
Class {
	#name : #CFFTwoByteOperator,
	#superclass : #CFFOperator,
	#category : #'PDFtalk-Fonts CompactFontFormat'
}

{ #category : #testing }
CFFTwoByteOperator >> isExtended: integer [
	^self value = integer
]

{ #category : #testing }
CFFTwoByteOperator >> isSimple: integer [
	^false
]
