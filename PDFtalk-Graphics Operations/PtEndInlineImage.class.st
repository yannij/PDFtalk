"
End an inline image object
"
Class {
	#name : #PtEndInlineImage,
	#superclass : #PtInlineImageOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #accessing }
PtEndInlineImage class >> documentation [
	^'End an inline image object'
]

{ #category : #accessing }
PtEndInlineImage class >> operatorName [
	^#EI
]

{ #category : #actions }
PtEndInlineImage >> processWith: aProcessor at: indexInteger [
	aProcessor addEndInlineImage: self
]
