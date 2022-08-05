"
Context to assemble an inline image
"
Class {
	#name : #PtInlineImageContext,
	#superclass : #PtContext,
	#category : #'PDFtalk-Graphics'
}

{ #category : #writing }
PtInlineImageContext >> postfix [
	^'EI'
]

{ #category : #writing }
PtInlineImageContext >> prefix [
	^'BI'
]
