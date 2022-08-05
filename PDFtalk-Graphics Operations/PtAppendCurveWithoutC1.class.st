"
Append a cubic Bézier curve to the current path. 
The curve shall extend from the current point to the point (x3, y3), using the current point and (x2, y2) as the Bézier control points. 
The new current point shall be (x3, y3)
"
Class {
	#name : #PtAppendCurveWithoutC1,
	#superclass : #PtPathConstructionOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #accessing }
PtAppendCurveWithoutC1 class >> documentation [
	^'Append a cubic Bézier curve to the current path. The curve shall extend from the current point to the point (x3, y3), using the current point and (x2, y2) as the Bézier control points. The new current point shall be (x3, y3)'
]

{ #category : #accessing }
PtAppendCurveWithoutC1 class >> operandTypes [
	^#(#('x2' Number) #('y2' Number) #('x3' Number) #('y3' Number))
]

{ #category : #accessing }
PtAppendCurveWithoutC1 class >> operatorName [
	^#v
]
