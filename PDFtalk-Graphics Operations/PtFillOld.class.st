"
Equivalent to f; included only for compatibility. 
Although PDF reader applications shall be able to accept this operator, PDF writer applications should use f instead
"
Class {
	#name : #PtFillOld,
	#superclass : #PtPathPaintingOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #accessing }
PtFillOld class >> documentation [
	^'Equivalent to f; included only for compatibility. Although PDF reader applications shall be able to accept this operator, PDF writer applications should use f instead'
]

{ #category : #accessing }
PtFillOld class >> operatorName [
	^#F
]
