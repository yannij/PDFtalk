"
Paint the specified XObject. 
The operand name shall appear as a key in the XObject subdictionary of the current resource dictionary. 
The associated value shall be a stream whose Type entry, if present, is XObject. 
The effect of Do depends on the value of the XObject’s Subtype entry, which may be Image, Form, or PS
"
Class {
	#name : #PtPaintXObject,
	#superclass : #PtXObjectOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #accessing }
PtPaintXObject class >> documentation [
	^'Paint the specified XObject. The operand name shall appear as a key in the XObject subdictionary of the current resource dictionary. The associated value shall be a stream whose Type entry, if present, is XObject. The effect of Do depends on the value of the XObject’s Subtype entry, which may be Image, Form, or PS'
]

{ #category : #accessing }
PtPaintXObject class >> operandTypes [
	^#(#('name' Name))
]

{ #category : #accessing }
PtPaintXObject class >> operatorName [
	^#Do
]

{ #category : #accessing }
PtPaintXObject >> resourceIn: aPageGraphics [
	^aPageGraphics resources XObject objectAt: self operands first content
]
