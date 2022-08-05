"
Begin a new subpath by moving the current point to coordinates (x, y), omitting any connecting line segment. 
If the previous path construction operator in the current path was also m, the new m overrides it; no vestige of the previous m operation remains in the path
"
Class {
	#name : #PtMove,
	#superclass : #PtPathConstructionOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #accessing }
PtMove class >> documentation [
	^'Begin a new subpath by moving the current point to coordinates (x, y), omitting any connecting line segment. If the previous path construction operator in the current path was also m, the new m overrides it; no vestige of the previous m operation remains in the path'
]

{ #category : #accessing }
PtMove class >> operandTypes [
	^#(#('x' Number) #('y' Number))
]

{ #category : #accessing }
PtMove class >> operatorName [
	^#m
]

{ #category : #accessing }
PtMove >> point [
	^self operands first asSmalltalkValue @ self operands last asSmalltalkValue
]
