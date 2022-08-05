"
two byte operator occuring in CharStrings

"
Class {
	#name : #CFFTwoByteCharstringOperator,
	#superclass : #CFFTwoByteOperator,
	#category : #'PDFtalk-Fonts CompactFontFormat'
}

{ #category : #accessing }
CFFTwoByteCharstringOperator class >> namesDictionary [
	| dict |
	dict := Dictionary new.
	dict at: 0 put: 'dotsection'.
	"1 2 reserved"
	dict at: 3 put: 'and'.
	dict at: 4 put: 'or'.
	dict at: 5 put: 'not'.
	"6 7 8 reserved"
	dict at: 9 put: 'abs'.
	dict at: 10 put: 'add'.
	dict at: 11 put: 'sub'.
	dict at: 12 put: 'div'.
	"13 reserved"
	dict at: 14 put: 'neg'.
	dict at: 15 put: 'eq'.
	"16 17 reserved"
	dict at: 18 put: 'drop'.
	"19 reserved"
	dict at: 20 put: 'put'.
	dict at: 21 put: 'get'.
	dict at: 22 put: 'ifelse'.
	dict at: 23 put: 'random'.
	dict at: 24 put: 'mul'.
	"25 reserved"
	dict at: 26 put: 'sqrt'.
	dict at: 27 put: 'dup'.
	dict at: 28 put: 'exch'.
	dict at: 29 put: 'index'.
	dict at: 30 put: 'roll'.
	"31 32 33 reserved"
	dict at: 34 put: 'hflex'.
	dict at: 35 put: 'flex'.
	dict at: 36 put: 'hflex1'.
	dict at: 37 put: 'flex1'.
	"38 - 255 reserved"
	^dict
]
