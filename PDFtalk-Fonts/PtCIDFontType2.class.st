"
PDF Glyph Selection in CIDFonts as defined in PDF 32000_2008.pdf, clause 9.7.4.2, pp. 270.

Type 0 and Type 2 CIDFonts handle the mapping from CIDs to glyph descriptions in somewhat different ways.

For Type 2, the CIDFont program is actually a TrueType font program, which has no native notion of CIDs. 
In a TrueType font program, glyph descriptions are identified by glyph index values. 
Glyph indices are internal to the font and are not defined consistently from one font to another. 
Instead, a TrueType font program contains a “cmap” table that provides mappings directly from character codes to glyph indices for one or more predefined encodings.

TrueType font programs are integrated with the CID-keyed font architecture in one of two ways, 
depending on whether the font program is embedded in the PDF file:

	•	If the TrueType font program is embedded, the Type 2 CIDFont dictionary shall contain a CIDToGIDMap entry 
		that maps CIDs to the glyph indices for the appropriate glyph descriptions in that font program.

	•	If the TrueType font program is not embedded but is referenced by name, the Type 2 CIDFont dictionary shall not 
		contain a CIDToGIDMap entry, since it is not meaningful to refer to glyph indices in an external font program. 
		In this case, CIDs shall not participate in glyph selection, and only predefined CMaps may be used with this CIDFont. 
		The conforming reader shall select glyphs by translating characters from the encoding specified by the 
		predefined CMap to one of the encodings in the TrueType font’s “cmap” table. 
		The means by which this is accomplished are implementation-dependent.

Even though the CIDs are not used to select glyphs in a Type 2 CIDFont, they shall always be used to determine the glyph metrics, as described in the next sub-clause.

Every CIDFont shall contain a glyph description for CID 0, which is analogous to the .notdef character name in simple fonts.
"
Class {
	#name : #PtCIDFontType2,
	#superclass : #PtCIDFont,
	#category : #'PDFtalk-Fonts'
}

{ #category : #accessing }
PtCIDFontType2 class >> pdfTypeDefinition [

	^PDFTypeDefinition
		name: #CIDFontType2
		supertype: #CIDFont
		section: '9.7.4.2'
		documentation: 'Type 0 and Type 2 CIDFonts handle the mapping from CIDs to glyph descriptions in somewhat different ways.

For Type 2, the CIDFont program is actually a TrueType font program, which has no native notion of CIDs. 
In a TrueType font program, glyph descriptions are identified by glyph index values. 
Glyph indices are internal to the font and are not defined consistently from one font to another. 
Instead, a TrueType font program contains a “cmap” table that provides mappings directly from character codes to glyph indices for one or more predefined encodings.

TrueType font programs are integrated with the CID-keyed font architecture in one of two ways, 
depending on whether the font program is embedded in the PDF file:

	•	If the TrueType font program is embedded, the Type 2 CIDFont dictionary shall contain a CIDToGIDMap entry 
		that maps CIDs to the glyph indices for the appropriate glyph descriptions in that font program.

	•	If the TrueType font program is not embedded but is referenced by name, the Type 2 CIDFont dictionary shall not 
		contain a CIDToGIDMap entry, since it is not meaningful to refer to glyph indices in an external font program. 
		In this case, CIDs shall not participate in glyph selection, and only predefined CMaps may be used with this CIDFont. 
		The conforming reader shall select glyphs by translating characters from the encoding specified by the 
		predefined CMap to one of the encodings in the TrueType font’s “cmap” table. 
		The means by which this is accomplished are implementation-dependent.

Even though the CIDs are not used to select glyphs in a Type 2 CIDFont, they shall always be used to determine the glyph metrics, as described in the next sub-clause.

Every CIDFont shall contain a glyph description for CID 0, which is analogous to the .notdef character name in simple fonts.'
]

{ #category : #'accessing entries' }
PtCIDFontType2 >> CIDToGIDMap [
	<type: #Stream>
	<typeName: #Identity>
	<attribute: 1 documentation: 'A specification of the mapping from CIDs to glyph indices.
If the value is a stream, the bytes in the stream shall contain the mapping from CIDs to glyph indices: the glyph index for a particular CID value c shall be a 2-byte value stored in bytes 2 × c and 2 × c + 1, where the first byte shall be the high-order byte.
If the value of CIDToGIDMap is a name, it shall be Identity, indicating that the mapping between CIDs and glyph indices is the identity mapping.
This entry may appear only in a Type 2 CIDFont whose associated TrueType font program is embedded in the PDF file'>
	^self objectAt: #CIDToGIDMap ifAbsent: [#Identity asPDF]
]
