"
Append a cubic Bézier curve to the current path. 
The curve shall extend from the current point to the point (x3, y3), using (x1, y1) and (x3, y3) as the Bézier control points. 
The new current point shall be (x3, y3)
"
Class {
	#name : #PtAppendCurveWithoutC2,
	#superclass : #PtPathConstructionOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #accessing }
PtAppendCurveWithoutC2 class >> documentation [
	^'Append a cubic Bézier curve to the current path. The curve shall extend from the current point to the point (x3, y3), using (x1, y1) and (x3, y3) as the Bézier control points. The new current point shall be (x3, y3)'
]

{ #category : #accessing }
PtAppendCurveWithoutC2 class >> operandTypes [
	^#(#('x1' Number) #('y1' Number) #('x3' Number) #('y3' Number))
]

{ #category : #accessing }
PtAppendCurveWithoutC2 class >> operatorName [
	^#y
]
