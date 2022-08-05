"
PDF Printer's Mark Annotations as defined in PDF 32000_2008.pdf, section 12.5.6.20, pp. 410.
and 
PDF Printer's Marks as defined in PDF 32000_2008.pdf, section 14.11.3, pp. 630.

A printer’s mark annotation represents a graphic symbol, such as a registration target, colour bar, or cut mark, that may be added to a page to assist production personnel in identifying components of a multiple-plate job and maintaining consistent output during production.

"
Class {
	#name : #PtPrinterMarkAnnotation,
	#superclass : #PtAnnot,
	#category : #'PDFtalk-Interactive Features'
}

{ #category : #accessing }
PtPrinterMarkAnnotation class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #PrinterMarkAnnotation
		supertype: #Annot
		version: #(1 4)
		section: '12.5.6.20'
		documentation: 'A printer’s mark annotation represents a graphic symbol, such as a registration target, colour bar, or cut mark, that may be added to a page to assist production personnel in identifying components of a multiple-plate job and maintaining consistent output during production.'
]

{ #category : #accessing }
PtPrinterMarkAnnotation class >> subtype [
	^#PrinterMark
]

{ #category : #'accessing entries' }
PtPrinterMarkAnnotation >> MN [
	<type: #Name>
	<attribute: 1 documentation: 'An arbitrary name identifying the type of printer’s mark, such as ColorBar or RegistrationTarget.'>
	^self objectAt: #MN ifAbsent: [nil]
]
