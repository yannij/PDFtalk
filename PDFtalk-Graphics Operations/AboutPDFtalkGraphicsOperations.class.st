"
PDF Graphics as defined in PDF 32000_2008.pdf section 8, pp. 127

The graphics operators used in PDF content streams describe the appearance of pages that are to be reproduced on a raster output device. 
The facilities described in this clause are intended for both printer and display applications.

The graphics operators form six main groups:

	•	Graphics state operators manipulate the data structure called the graphics state, the global framework within which the other graphics operators execute. 
The graphics state includes the current transformation matrix (CTM), which maps user space coordinates used within a PDF content stream into output device coordinates. 
It also includes the current colour, the current clipping path, and many other parameters that are implicit operands of the painting operators.
	•	Path construction operators specify paths, which define shapes, line trajectories, and regions of various sorts. 
They include operators for beginning a new path, adding line segments and curves to it, and closing it.
	•	Path-painting operators fill a path with a colour, paint a stroke along it, or use it as a clipping boundary.
	•	Other painting operators paint certain self-describing graphics objects. 
These include sampled images, geometrically defined shadings, and entire content streams that in turn contain sequences of graphics operators.
	•	Text operators select and show character glyphs from fonts (descriptions of typefaces for representing text characters). 
Because PDF treats glyphs as general graphical shapes, many of the text operators could be grouped with the graphics state or painting operators. 
However, the data structures and mechanisms for dealing with glyph and font descriptions are sufficiently specialized that clause 9, ""Text"" focuses on them.
	•	Marked-content operators associate higher-level logical information with objects in the content stream. 
This information does not affect the rendered appearance of the content (although it may determine if the content should be presented at all); 
it is useful to applications that use PDF for document interchange.
"
Class {
	#name : #AboutPDFtalkGraphicsOperations,
	#superclass : #Object,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #properties }
AboutPDFtalkGraphicsOperations class >> creationRules [
	^'Package [Pharo Fileout PDFtalk](1.3.1.1,chaider)'
]

{ #category : #properties }
AboutPDFtalkGraphicsOperations class >> creationTime [
	^'21.06.2022 08:32:13'
]

{ #category : #properties }
AboutPDFtalkGraphicsOperations class >> creator [
	^'Bundle {Smalltalk Transform Project}(2.0.2.0,chaider)'
]

{ #category : #properties }
AboutPDFtalkGraphicsOperations class >> isFunctional [
	^false
]

{ #category : #properties }
AboutPDFtalkGraphicsOperations class >> source [
	^'Package [PDFtalk Graphics Operations](2.3.5.1,chaider)'
]

{ #category : #properties }
AboutPDFtalkGraphicsOperations class >> sourceSmalltalk [
	^'VisualWorks®, 9.2 of 7. Januar 2022'
]

{ #category : #properties }
AboutPDFtalkGraphicsOperations class >> sourceStore [
	^'psql_public_cst_2007'
]

{ #category : #properties }
AboutPDFtalkGraphicsOperations class >> sourceTime [
	^'12.01.2021 17:14:16'
]

{ #category : #properties }
AboutPDFtalkGraphicsOperations class >> targetSmalltalk [
	^'Pharo 10.0'
]
