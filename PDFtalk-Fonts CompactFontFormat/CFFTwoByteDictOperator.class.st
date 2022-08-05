"
two byte operator occuring in DICTs

"
Class {
	#name : #CFFTwoByteDictOperator,
	#superclass : #CFFTwoByteOperator,
	#category : #'PDFtalk-Fonts CompactFontFormat'
}

{ #category : #accessing }
CFFTwoByteDictOperator class >> namesDictionary [
	| dict |
	dict := Dictionary new.
	dict at: 0 put: 'Copyright'.
	dict at: 1 put: 'isFixedPitch'.
	dict at: 2 put: 'ItalicAngle'.
	dict at: 3 put: 'UnderlinePosition'.
	dict at: 4 put: 'UnderlineThickness'.
	dict at: 5 put: 'PaintType'.
	dict at: 6 put: 'CharstringType'.
	dict at: 7 put: 'FontMatrix'.
	dict at: 8 put: 'StrokeWidth'.
	dict at: 9 put: 'BlueScale'.
	dict at: 10 put: 'BlueShift'.
	dict at: 11 put: 'BlueFuzz'.
	dict at: 12 put: 'StemSnapH'.
	dict at: 13 put: 'StemSnapV'.
	dict at: 14 put: 'ForceBold'.
	"15 16 reserved"
	dict at: 17 put: 'LanguageGroup'.
	dict at: 18 put: 'ExpansionFactor'.
	dict at: 19 put: 'initialRandomSeed'.
	dict at: 20 put: 'SyntheticBase'.
	dict at: 21 put: 'PostScript'.
	dict at: 22 put: 'BaseFontName'.
	dict at: 23 put: 'BaseFontBlend'.
	"24 - 29 reserved"
	"required CIDFont top DICT entries"
	dict at: 30 put: 'ROS'.
	dict at: 31 put: 'CIDFontVersion'.
	dict at: 32 put: 'CIDFontRevision'.
	dict at: 33 put: 'CIDFontType'.
	dict at: 34 put: 'CIDCount'.
	dict at: 35 put: 'UIDBase'.
	dict at: 36 put: 'FDArray'.
	dict at: 37 put: 'FDSelect'.
	dict at: 38 put: 'FontName'.
	"39 - 255 reserved"
	^dict
]

{ #category : #accessing }
CFFTwoByteDictOperator >> name [
	| dict |
	dict := Dictionary new.
	dict at: 0 put: 'Copyright'.
	dict at: 1 put: 'isFixedPitch'.
	dict at: 2 put: 'ItalicAngle'.
	dict at: 3 put: 'UnderlinePosition'.
	dict at: 4 put: 'UnderlineThickness'.
	dict at: 5 put: 'PaintType'.
	dict at: 6 put: 'CharstringType'.
	dict at: 7 put: 'FontMatrix'.
	dict at: 8 put: 'StrokeWidth'.
	dict at: 9 put: 'BlueScale'.
	dict at: 10 put: 'BlueShift'.
	dict at: 11 put: 'BlueFuzz'.
	dict at: 12 put: 'StemSnapH'.
	dict at: 13 put: 'StemSnapV'.
	dict at: 14 put: 'ForceBold'.
	"15 16 reserved"
	dict at: 17 put: 'LanguageGroup'.
	dict at: 18 put: 'ExpansionFactor'.
	dict at: 19 put: 'initialRandomSeed'.
	dict at: 20 put: 'SyntheticBase'.
	dict at: 21 put: 'PostScript'.
	dict at: 22 put: 'BaseFontName'.
	dict at: 23 put: 'BaseFontBlend'.
	"24 - 29 reserved"
	"required CIDFont top DICT entries"
	dict at: 30 put: 'ROS'.
	dict at: 31 put: 'CIDFontVersion'.
	dict at: 32 put: 'CIDFontRevision'.
	dict at: 33 put: 'CIDFontType'.
	dict at: 34 put: 'CIDCount'.
	dict at: 35 put: 'UIDBase'.
	dict at: 36 put: 'FDArray'.
	dict at: 37 put: 'FDSelect'.
	dict at: 38 put: 'FontName'.
	"39 - 255 reserved"
	^dict at: self value ifAbsent: ['unknown']
]
