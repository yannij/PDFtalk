"
CBDT - Color Bitmap Data Table

Two tables are used to embed color bitmaps in OFF fonts. They are the 'CBLC' table for embedded bitmap locators and the 'CBDT' table for embedded color bitmap data. The formats of these two tables are backward compatible with EBLC and EBDT used for embedded monochrome and grayscale bitmaps

"
Class {
	#name : #PtOTCbdt,
	#superclass : #PtOTTable,
	#category : #'PDFtalk-Fonts OpenType'
}

{ #category : #accessing }
PtOTCbdt class >> tag [
	^'CBDT'
]
