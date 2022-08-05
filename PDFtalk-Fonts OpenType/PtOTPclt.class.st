"
The 'PCLT' table is strongly discouraged for OpenType™ fonts with TrueType outlines. Extra information on many of these fields can be found in the HP PCL 5 Printer Language Technical Reference Manual  available from Hewlett-Packard Boise Printer Division.
"
Class {
	#name : #PtOTPclt,
	#superclass : #PtOTTable,
	#category : #'PDFtalk-Fonts OpenType'
}

{ #category : #accessing }
PtOTPclt class >> tag [
	^'PCLT'
]
