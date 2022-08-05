"
Append a straight line segment from the current point to the point (x, y). 
The new current point shall be (x, y)
"
Class {
	#name : #PtAppendLine,
	#superclass : #PtPathConstructionOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #accessing }
PtAppendLine class >> documentation [
	^'Append a straight line segment from the current point to the point (x, y). The new current point shall be (x, y)'
]

{ #category : #accessing }
PtAppendLine class >> operandTypes [
	^#(#('x' Number) #('y' Number))
]

{ #category : #accessing }
PtAppendLine class >> operatorName [
	^#l
]

{ #category : #accessing }
PtAppendLine >> point [
	^self operands first asSmalltalkValue @ self operands last asSmalltalkValue
]
