Extension { #name : #Number }

{ #category : #'*PDFtalk-Basic Objects-printing' }
Number >> pdfSignificantDecimals [
	"Number of significant decimal digits of precision in fractional part (approximate)."

	^5
]

{ #category : #'*PDFtalk-Basic Objects-printing' }
Number >> writePDFOn: aWriter indent: anInteger [
	| precision rounded integer fraction wst |
	self abs < self postScriptEpsilon ifTrue: [
		aWriter nextPutByte: $0 asInteger.
		^self].
	self negative ifTrue: [
		| writer |
		writer := aWriter class new.
		self negated writePDFOn: writer indent: 0.
		writer contents asString = '0' ifTrue: [
			aWriter nextPutByte: $0 asInteger.
			^self].
		aWriter nextPutByte: $- asInteger.
		aWriter nextPutAll: writer contents.
		^self].
	precision := 10 raisedTo: self pdfSignificantDecimals.
	rounded := (self * precision) rounded / precision.
	integer := rounded truncated.
	integer writePDFOn: aWriter indent: anInteger.
	fraction := rounded - integer.
	fraction strictlyPositive ifFalse: [
		^self].
	aWriter nextPutByte: $. asInteger.
	wst := WriteStream on: String new.
	fraction writeFractionDecimalsOn: wst.
	aWriter nextPutAll: wst contents asByteArray
]
