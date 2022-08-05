"
single byte operator occuring in CharStrings
"
Class {
	#name : #CFFCharstringOperator,
	#superclass : #CFFOperator,
	#category : #'PDFtalk-Fonts CompactFontFormat'
}

{ #category : #accessing }
CFFCharstringOperator class >> namesDictionary [
	| dict |
	dict := Dictionary new.
	"0 reserverd"
	dict at: 1 put: 'hstem'.
	"2 reserverd"
	dict at: 3 put: 'vstem'.
	dict at: 4 put: 'vmoveto'.
	dict at: 5 put: 'rlineto'.
	dict at: 6 put: 'hlineto'.
	dict at: 7 put: 'vlineto'.
	dict at: 8 put: 'rrcurveto'.
	"9 reserverd"
	dict at: 10 put: 'callsubr'.
	dict at: 11 put: 'return'.
	"12 escape for TwoByteOperators"
	"13 reserverd"
	dict at: 14 put: 'endchar'.
	"15 - 17 reserverd"
	dict at: 18 put: 'hstemhm'.
	dict at: 19 put: 'hintmask'.
	dict at: 20 put: 'cntrmask'.
	dict at: 21 put: 'rmoveto'.
	dict at: 22 put: 'hmoveto'.
	dict at: 23 put: 'vstemhm'.
	dict at: 24 put: 'rcurveline'.
	dict at: 25 put: 'rlinecurve'.
	dict at: 26 put: 'vvcurveto'.
	dict at: 27 put: 'hhcurveto'.
	"28 shortint"
	dict at: 29 put: 'callgsubr'.
	dict at: 30 put: 'vhcurveto'.
	dict at: 31 put: 'hvcurveto'.
	^dict
]
