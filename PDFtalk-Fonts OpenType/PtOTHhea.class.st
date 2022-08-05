"
This table contains information for horizontal layout. The values in the minRightSidebearing, minLeftSideBearing and xMaxExtent should be computed using only glyphs that have contours. Glyphs with no contours should be ignored for the purposes of these calculations. All reserved areas must be set to 0.

"
Class {
	#name : #PtOTHhea,
	#superclass : #PtOTTable,
	#category : #'PDFtalk-Fonts OpenType'
}

{ #category : #accessing }
PtOTHhea class >> tag [
	^'hhea'
]

{ #category : #accessing }
PtOTHhea >> advanceWidthMax [
	"UFWORD 	advanceWidthMax 	Maximum advance width value in 'hmtx' table."

	^self bytes unsignedShortAt: 11
]

{ #category : #accessing }
PtOTHhea >> ascender [
	"FWORD 	Ascender 	Typographic ascent.  (Distance from baseline of highest ascender)"

	^self bytes shortAt: 5
]

{ #category : #accessing }
PtOTHhea >> caretOffset [
	"SHORT 	caretOffset 	The amount by which a slanted highlight on a glyph needs to be shifted to produce the best appearance. Set to 0 for non-slanted fonts"

	^self bytes shortAt: 23
]

{ #category : #accessing }
PtOTHhea >> caretSlopeRise [
	"SHORT 	caretSlopeRise 	Used to calculate the slope of the cursor (rise/run); 1 for vertical."

	^self bytes shortAt: 19
]

{ #category : #accessing }
PtOTHhea >> caretSlopeRun [
	"SHORT 	caretSlopeRun 	0 for vertical."

	^self bytes shortAt: 21
]

{ #category : #accessing }
PtOTHhea >> descender [
	"FWORD 	Descender 	Typographic descent.  (Distance from baseline of lowest descender)"

	^self bytes shortAt: 7
]

{ #category : #accessing }
PtOTHhea >> lineGap [
	"FWORD 	LineGap 	Typographic line gap. Negative LineGap values are treated as zero in Windows 3.1, System 6, and System 7."

	^self bytes shortAt: 9
]

{ #category : #accessing }
PtOTHhea >> metricDataFormat [
	"SHORT 	metricDataFormat 	0 for current format."

	^self bytes shortAt: 33
]

{ #category : #accessing }
PtOTHhea >> minLeftSideBearing [
	"FWORD 	minLeftSideBearing 	Minimum left sidebearing value in 'hmtx' table."

	^self bytes shortAt: 13
]

{ #category : #accessing }
PtOTHhea >> minRightSideBearing [
	"FWORD 	minRightSideBearing 	Minimum right sidebearing value; calculated as Min(aw - lsb - (xMax - xMin))."

	^self bytes shortAt: 15
]

{ #category : #accessing }
PtOTHhea >> numberOfHMetrics [
	"USHORT  	numberOfHMetrics  	Number of hMetric entries in 'hmtx' table"

	^self bytes unsignedShortAt: 35
]

{ #category : #accessing }
PtOTHhea >> versionMajor [
	"Fixed 	Table version number 	0x00010000 for version 1.0."

	^self bytes unsignedShortAt: 1
]

{ #category : #accessing }
PtOTHhea >> versionMinor [
	"Fixed 	Table version number 	0x00010000 for version 1.0."

	^self bytes unsignedShortAt: 3
]

{ #category : #accessing }
PtOTHhea >> xMaxExtent [
	"FWORD 	xMaxExtent 	Max(lsb + (xMax - xMin))."

	^self bytes shortAt: 17
]
