"
The Glyph Positioning table (GPOS) provides precise control over glyph placement for sophisticated text layout and rendering in each script and language system that a font supports.
"
Class {
	#name : #PtOTGpos,
	#superclass : #PtOTTable,
	#category : #'PDFtalk-Fonts OpenType'
}

{ #category : #accessing }
PtOTGpos class >> tag [
	^'GPOS'
]

{ #category : #accessing }
PtOTGpos >> FeatureList [
	"Offset 	FeatureList 	Offset to FeatureList table-from beginning of GPOS table"

	^self bytes unsignedShortAt: 7
]

{ #category : #accessing }
PtOTGpos >> LookupList [
	"Offset 	LookupList 	Offset to LookupList table-from beginning of GPOS table"

	^self bytes unsignedShortAt: 9
]

{ #category : #accessing }
PtOTGpos >> ScriptCount [
	"uint16 	ScriptCount 	Number of ScriptRecords"

	^self bytes unsignedShortAt: self ScriptList + 1
]

{ #category : #accessing }
PtOTGpos >> ScriptList [
	"Offset 	ScriptList 	Offset to ScriptList table-from beginning of GPOS table"

	^self bytes unsignedShortAt: 5
]

{ #category : #accessing }
PtOTGpos >> Version [
	"Fixed 	Version 	Version of the GPOS table-initially = 0x00010000"

	| signed fraction |
	signed := self bytes shortAt: 1.
	fraction := self bytes unsignedShortAt: 3.
	^signed + (fraction / 16rFFFF)
]

{ #category : #accessing }
PtOTGpos >> scriptRecords [
	"struct 	ScriptRecord[ScriptCount] 	Array of ScriptRecords - listed alphabetically by ScriptTag"

	| start |
	start := self ScriptList + 3.
	^(1 to: self ScriptCount) collect: [:index |
		| pos |
		pos := start + ((index - 1) * 6).
		PtOTScriptRecord
			tag: (self contents copyFrom: pos to: pos + 3) asString
			offset: (self bytes unsignedShortAt: pos + 4)]
]
