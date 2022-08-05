"
PDF Watermark Annotations as defined in PDF 32000_2008.pdf, section 12.5.6.22, pp. 410.

A watermark annotation shall be used to represent graphics that shall be printed at a fixed size and position on a page, regardless of the dimensions of the printed page.
The FixedPrint entry of a watermark annotation dictionary shall be a dictionary that contains values for specifying the size and position of the annotation.

Watermark annotations shall have no pop-up window or other interactive elements.
When displaying a watermark annotation on-screen, conforming readers shall use the dimensions of the media box as the page size so that the scroll and zoom behaviour is the same as for other annotations.

	NOTE	Since many printing devices have non printable margins, such margins should be taken into consideration when positioning watermark annotations near the edge of a page.
"
Class {
	#name : #PtWatermarkAnnotation,
	#superclass : #PtAnnot,
	#category : #'PDFtalk-Interactive Features'
}

{ #category : #accessing }
PtWatermarkAnnotation class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #WatermarkAnnotation
		supertype: #Annot
		version: #(1 6)
		section: '12.5.6.21'
		documentation: 'A watermark annotation shall be used to represent graphics that shall be printed at a fixed size and position on a page, regardless of the dimensions of the printed page.
The FixedPrint entry of a watermark annotation dictionary shall be a dictionary that contains values for specifying the size and position of the annotation.

Watermark annotations shall have no pop-up window or other interactive elements.
When displaying a watermark annotation on-screen, conforming readers shall use the dimensions of the media box as the page size so that the scroll and zoom behaviour is the same as for other annotations.

	NOTE	Since many printing devices have non printable margins, such margins should be taken into consideration when positioning watermark annotations near the edge of a page.'
]

{ #category : #accessing }
PtWatermarkAnnotation class >> subtype [
	^#Watermark
]

{ #category : #'accessing entries' }
PtWatermarkAnnotation >> FixedPrint [
	<type: #FixedPrint>
	<attribute: 1 documentation: 'A fixed print dictionary that specifies how this annotation shall be drawn relative to the dimensions of the target media.
If this entry is not present, the annotation shall be drawn without any special consideration for the dimensions of the target media.

If the dimensions of the target media are not known at the time of drawing, drawing shall be done relative to the dimensions specified by the page’s MediaBox entry.'>
	^self objectAt: #FixedPrint ifAbsent: [(PtPDF classAt: #FixedPrint) empty]
]
