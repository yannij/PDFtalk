"
The Glyph Definition (GDEF) table contains four types of information in four independent tables:

    * The GlyphClassDef table classifies the different types of glyphs in the font.
    * The AttachmentList table identifies all attachment points on the glyphs, which streamlines data access and bitmap caching.
    * The LigatureCaretList table contains positioning data for ligature carets, which the text-processing client uses on screen to select and highlight the individual components of a ligature glyph.
    * The MarkAttachClassDef table classifies mark glyphs, to help group together marks that are positioned similarly.
    * The MarkGlyphSetsTable allows the enumeration of an arbitrary number of glyph sets that can be used as an extension of the mark attachment class definition to allow lookups to filter mark glyphs by arbitrary sets of marks.

The GSUB and GPOS tables may reference certain GDEF table information. See, for example, the LookupFlag bit enumeration in “OpenType Layout Common Table Formats”.
"
Class {
	#name : #PtOTGdef,
	#superclass : #PtOTTable,
	#category : #'PDFtalk-Fonts OpenType'
}

{ #category : #accessing }
PtOTGdef class >> tag [
	^'GDEF'
]
