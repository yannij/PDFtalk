"
PDF Glyph Selection in CIDFonts as defined in PDF 32000_2008.pdf, clause 9.7.4.2, pp. 270.

Type 0 and Type 2 CIDFonts handle the mapping from CIDs to glyph descriptions in somewhat different ways.

For Type 0, the CIDFont program contains glyph descriptions that are identified by CIDs. 
The CIDFont program identifies the character collection by a CIDSystemInfo dictionary, which should be copied into the PDF CIDFont dictionary. 
CIDs shall be interpreted uniformly in all CIDFont programs supporting a given character collection, 
whether the program is embedded in the PDF file or obtained from an external source.

When the CIDFont contains an embedded font program that is represented in the Compact Font Format (CFF), 
the FontFile3 entry in the font descriptor may be CIDFontType0C or OpenType. 
There are two cases, depending on the contents of the font program:
	•	The “CFF” font program has a Top DICT that uses CIDFont operators: 
		The CIDs shall be used to determine the GID value for the glyph procedure using the charset table in the CFF program. 
		The GID value shall then be used to look up the glyph procedure using the CharStrings INDEX table.

NOTE	Although in many fonts the CID value and GID value are the same, the CID and GID values may differ.

	•	The “CFF” font program has a Top DICT that does not use CIDFont operators: 
		The CIDs shall be used directly as GID values, and the glyph procedure shall be retrieved using the CharStrings INDEX.
"
Class {
	#name : #PtCIDFontType0,
	#superclass : #PtCIDFont,
	#category : #'PDFtalk-Fonts'
}

{ #category : #accessing }
PtCIDFontType0 class >> pdfTypeDefinition [

	^PDFTypeDefinition
		name: #CIDFontType0
		supertype: #CIDFont
		section: '9.7.4.2'
		documentation: 'Type 0 and Type 2 CIDFonts handle the mapping from CIDs to glyph descriptions in somewhat different ways.

For Type 0, the CIDFont program contains glyph descriptions that are identified by CIDs. 
The CIDFont program identifies the character collection by a CIDSystemInfo dictionary, which should be copied into the PDF CIDFont dictionary. 
CIDs shall be interpreted uniformly in all CIDFont programs supporting a given character collection, 
whether the program is embedded in the PDF file or obtained from an external source.

When the CIDFont contains an embedded font program that is represented in the Compact Font Format (CFF), 
the FontFile3 entry in the font descriptor may be CIDFontType0C or OpenType. 
There are two cases, depending on the contents of the font program:
	•	The “CFF” font program has a Top DICT that uses CIDFont operators: 
		The CIDs shall be used to determine the GID value for the glyph procedure using the charset table in the CFF program. 
		The GID value shall then be used to look up the glyph procedure using the CharStrings INDEX table.

NOTE	Although in many fonts the CID value and GID value are the same, the CID and GID values may differ.

	•	The “CFF” font program has a Top DICT that does not use CIDFont operators: 
		The CIDs shall be used directly as GID values, and the glyph procedure shall be retrieved using the CharStrings INDEX.'
]
