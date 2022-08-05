"
PDF Number object as defined in PDF 32000_2008.pdf p. 14.

A real value shall be written as one or more decimal digits with an optional sign and a leading, trailing, or embedded PERIOD (2Eh) (decimal point).
The value shall be interpreted as a real number and shall be converted to a real object.
"
Class {
	#name : #PtReal,
	#superclass : #PtNumber,
	#category : #'PDFtalk-Basic Objects'
}

{ #category : #'implementation limits' }
PtReal class >> epsilon [
	"Nonzero real values closest to the next integer (approximate).
Values closer than these are automatically converted to the integer."
	"Float fmin is 1.4013e-45"
 
	^1.175d-38
]

{ #category : #'instance creation' }
PtReal class >> on: aFloat [
	(aFloat between: self epsilon negated and: self epsilon) ifTrue: [
		^PtInteger on: 0].
	^self content: aFloat
]

{ #category : #accessing }
PtReal class >> pdfTypeDefinition [

	^PDFTypeDefinition
		name: #Real
		supertype: #Number
		section: '7.3.3'
		documentation: 'A real value shall be written as one or more decimal digits with an optional sign and a leading, trailing, or embedded PERIOD (2Eh) (decimal point).
The value shall be interpreted as a real number and shall be converted to a real object.'
]

{ #category : #'implementation limits' }
PtReal class >> significantDecimals [
	"Number of significant decimal digits of precision in fractional part (approximate)."

	^5
]
