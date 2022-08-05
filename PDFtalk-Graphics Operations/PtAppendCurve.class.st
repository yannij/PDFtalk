"
Append a cubic Bézier curve to the current path. 
The curve shall extend from the current point to the point (x3, y3), using (x1, y1) and (x2, y2) as the Bézier control points. 
The new current point shall be (x3, y3)
"
Class {
	#name : #PtAppendCurve,
	#superclass : #PtPathConstructionOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #accessing }
PtAppendCurve class >> documentation [
	^'Append a cubic Bézier curve to the current path. The curve shall extend from the current point to the point (x3, y3), using (x1, y1) and (x2, y2) as the Bézier control points. The new current point shall be (x3, y3)'
]

{ #category : #accessing }
PtAppendCurve class >> operandTypes [
	^#(#('x1' Number) #('y1' Number) #('x2' Number) #('y2' Number) #('x3' Number) #('y3' Number))
]

{ #category : #accessing }
PtAppendCurve class >> operatorName [
	^#c
]
