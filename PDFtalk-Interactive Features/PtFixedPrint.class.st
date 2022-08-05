"
PDF Watermark Annotations as defined in PDF 32000_2008.pdf, section 12.5.6.22, pp. 410.

A watermark annotation shall be used to represent graphics that shall be printed at a fixed size and position on a page, regardless of the dimensions of the printed page.
The FixedPrint entry of a watermark annotation dictionary shall be a dictionary that contains values for specifying the size and position of the annotation.

Watermark annotations shall have no pop-up window or other interactive elements.
When displaying a watermark annotation on-screen, conforming readers shall use the dimensions of the media box as the page size so that the scroll and zoom behaviour is the same as for other annotations.

	NOTE	Since many printing devices have non printable margins, such margins should be taken into consideration when positioning watermark annotations near the edge of a page.

"
Class {
	#name : #PtFixedPrint,
	#superclass : #PtTypedDictionary,
	#category : #'PDFtalk-Interactive Features'
}

{ #category : #accessing }
PtFixedPrint class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #FixedPrint
		supertype: #Dictionary
		version: #(1 6)
		section: '12.5.6.22'
		documentation: 'A watermark annotation shall be used to represent graphics that shall be printed at a fixed size and position on a page, regardless of the dimensions of the printed page.
The FixedPrint entry of a watermark annotation dictionary shall be a dictionary that contains values for specifying the size and position of the annotation.

Watermark annotations shall have no pop-up window or other interactive elements.
When displaying a watermark annotation on-screen, conforming readers shall use the dimensions of the media box as the page size so that the scroll and zoom behaviour is the same as for other annotations.

	NOTE	Since many printing devices have non printable margins, such margins should be taken into consideration when positioning watermark annotations near the edge of a page.'
]

{ #category : #'accessing entries' }
PtFixedPrint >> H [
	<type: #Number>
	<attribute: 2 documentation: 'The amount to translate the associated content horizontally, as a percentage of the width of the target media (or if unknown, the width of the page’s MediaBox).
1.0 represents 100% and 0.0 represents 0%.
Negative values should not be used, since they may cause content to be drawn off the page.'>
	^self objectAt: #H ifAbsent: [0 asPDF]
]

{ #category : #'accessing entries' }
PtFixedPrint >> Matrix [
	<type: #Matrix>
	<attribute: 1 documentation: 'The matrix used to transform the annotation’s rectangle before rendering.
When positioning content near the edge of a page, this entry should be used to provide a reasonable offset to allow for nonburnable margins.'>
	^self objectAt: #Matrix ifAbsent: [(PtPDF classAt: #Matrix) identity]
]

{ #category : #'accessing entries' }
PtFixedPrint >> V [
	<type: #Number>
	<attribute: 3 documentation: 'The amount to translate the associated content vertically, as a percentage of the height of the target media (or if unknown, the height of the page’s MediaBox).
1.0 represents 100% and 0.0 represents 0%.
Negative values should not be used, since they may cause content to be drawn off the page.'>
	^self objectAt: #V ifAbsent: [0 asPDF]
]
