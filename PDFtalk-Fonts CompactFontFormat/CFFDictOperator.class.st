"
single byte operator occuring in DICTs

"
Class {
	#name : #CFFDictOperator,
	#superclass : #CFFOperator,
	#category : #'PDFtalk-Fonts CompactFontFormat'
}

{ #category : #accessing }
CFFDictOperator class >> namesDictionary [
	| dict |
	dict := Dictionary new.
	dict at: 0 put: 'version'.
	dict at: 1 put: 'Notice'.
	dict at: 2 put: 'FullName'.
	dict at: 3 put: 'FamilyName'.
	dict at: 4 put: 'Weight'.
	dict at: 5 put: 'FontBBox'.
	dict at: 6 put: 'BlueValues'.
	dict at: 7 put: 'OtherBlues'.
	dict at: 8 put: 'FamilyBlues'.
	dict at: 9 put: 'FamilyOtherBlues'.
	dict at: 10 put: 'StdHW'.
	dict at: 11 put: 'StdVW'.
	"12 escape for TwoByteOperators"
	dict at: 13 put: 'UniqueID'.
	dict at: 14 put: 'XUID'.
	dict at: 15 put: 'charset'.
	dict at: 16 put: 'Encoding'.
	dict at: 17 put: 'CharStrings'.
	dict at: 18 put: 'Private'.
	dict at: 19 put: 'Subrs'.
	dict at: 20 put: 'defaultWidthX'.
	dict at: 21 put: 'nominalWidthX'.
	^dict
]
