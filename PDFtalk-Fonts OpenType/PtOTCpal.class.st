"
CPAL - Color Palette Table

The palette table is a set of one or more palettes, each containing a predefined number of RGBA values arranged consecutively by palette index value. It may also contain name table IDs describing the palettes and their entries.

The first palette, number 0, is the default palette. The palettes are referenced by colorRecordIndices, this is the index into the array of color records where the palette starts. Multiple colorRecordIndices may refer to the same palette, therefore the number of actual palettes in the table may be less than the numPalettes entry. A minimum of one palette, the default, must be provided in the table if the table is present. Each palette must have the same number of entries as defined by numPaletteEntries, which must be at least one entry. Any empty CPAL table, with no palettes and no color records is not permissible. It is permissible for palettes to overlap and share data; therefore, the total number of color records in the CPAL table may be less than the number of palette entries multiplied by the number of palettes.

For each of the palettes, the first color record is index zero. There can be no more than numPaletteEntries of RGBA values.
"
Class {
	#name : #PtOTCpal,
	#superclass : #PtOTTable,
	#category : #'PDFtalk-Fonts OpenType'
}

{ #category : #accessing }
PtOTCpal class >> tag [
	^'CPAL'
]
