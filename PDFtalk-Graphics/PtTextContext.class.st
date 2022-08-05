"
A PDF text object consists of operators that may show text strings, move the text position, and set text state and certain other parameters. In addition, three parameters may be specified only within a text object and shall not persist from one text object to the next:
• Tm, the text matrix
• Tlm, the text line matrix
• Trm, the text rendering matrix, which is actually just an intermediate result that combines the effects of text state parameters, the text matrix (Tm), and the current transformation matrix.

A text object begins with the BT operator and ends with the ET operator.
"
Class {
	#name : #PtTextContext,
	#superclass : #PtContext,
	#category : #'PDFtalk-Graphics'
}

{ #category : #writing }
PtTextContext >> postfix [

	^'ET'
]

{ #category : #writing }
PtTextContext >> prefix [
	^'BT'
]
