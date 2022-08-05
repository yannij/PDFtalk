"
PDF border effect dictionary as defined in PDF 32000_2008.pdf, section 12.5.4, pp. 387.

Beginning with PDF 1.5, some annotations (square, circle, and polygon) may have a BE entry, which is a border effect dictionary that specifies an effect that shall be applied to the border of the annotations.
Beginning with PDF 1.6, the free text annotation may also have a BE entry. Table 167 describes the entries in a border effect dictionary.
"
Class {
	#name : #PtBorderEffect,
	#superclass : #PDFDictionary,
	#category : #'PDFtalk-Interactive Features'
}

{ #category : #accessing }
PtBorderEffect class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #BorderEffect
		supertype: #Dictionary
		version: #(1 5)
		section: '12.5.4'
		documentation: 'Beginning with PDF 1.5, some annotations (square, circle, and polygon) may have a BE entry, which is a border effect dictionary that specifies an effect that shall be applied to the border of the annotations.
Beginning with PDF 1.6, the free text annotation may also have a BE entry. Table 167 describes the entries in a border effect dictionary.'
]

{ #category : #'accessing entries' }
PtBorderEffect >> I [
	<type: #Number>
	<attribute: 2 documentation: '(valid only if the value of S is C)
A number describing the intensity of the effect, in the range 0 to 2.'>
	^self objectAt: #I ifAbsent: [0 asPDF]
]

{ #category : #'accessing entries' }
PtBorderEffect >> S [
	<type: #Name>
	<attribute: 1 documentation: 'A name representing the border effect to apply.
Possible values are:
	S 	No effect: the border shall be as described by the annotation dictionary’s BS entry.
	C 	The border should appear “cloudy”. The width and dash array specified by BS shall be honored.'>
	^self objectAt: #S ifAbsent: [#S asPDF]
]
