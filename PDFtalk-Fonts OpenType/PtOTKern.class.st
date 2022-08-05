"
NOTE: Apple has extended the definition of the 'kern' table to provide additional functionality. The Apple extensions are not supported on Windows. Fonts intended for cross-platform use or for the Windows platform in general should conform to the 'kern' table format specified here.

The kerning table contains the values that control the intercharacter spacing for the glyphs in a font. There is currently no system level support for kerning (other than returning the kern pairs and kern values). OpenType™ fonts containing CFF outlines are not supported by the 'kern' table and must use the 'GPOS' OpenType Layout table.

Each subtable varies in format, and can contain information for vertical or horizontal text, and can contain kerning values or minimum values. Kerning values are used to adjust inter-character spacing, and minimum values are used to limit the amount of adjustment that the scaler applies by the combination of kerning and tracking. Because the adjustments are additive, the order of the subtables containing kerning values is not important. However, tables containing minimum values should usually be placed last, so that they can be used to limit the total effect of other subtables.
"
Class {
	#name : #PtOTKern,
	#superclass : #PtOTTable,
	#category : #'PDFtalk-Fonts OpenType'
}

{ #category : #accessing }
PtOTKern class >> tag [
	^'kern'
]
