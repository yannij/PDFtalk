"
Begin an inline image object
"
Class {
	#name : #PtBeginInlineImage,
	#superclass : #PtInlineImageOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #accessing }
PtBeginInlineImage class >> documentation [
	^'Begin an inline image object'
]

{ #category : #accessing }
PtBeginInlineImage class >> end [
	^PtEndInlineImage
]

{ #category : #accessing }
PtBeginInlineImage class >> operatorName [
	^#BI
]

{ #category : #actions }
PtBeginInlineImage >> processWith: aProcessor at: indexInteger [
	aProcessor addBeginInlineImage: self
]
