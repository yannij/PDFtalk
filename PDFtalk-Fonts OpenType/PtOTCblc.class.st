"
CBLC - Color Bitmap Location Table

Two new tables are used to embed color bitmaps in OFF fonts. They are the 'CBLC' table, backward compatible with the existing EBLC table for embedded bitmap locators, and the 'CBDT' table for embedded color bitmap data.

The 'CBLC' table begins with a header containing the table version and number of strikes. An OFF font may have one or more strikes embedded in the 'CBDT' table.

"
Class {
	#name : #PtOTCblc,
	#superclass : #PtOTTable,
	#category : #'PDFtalk-Fonts OpenType'
}

{ #category : #accessing }
PtOTCblc class >> tag [
	^'CBLC'
]
