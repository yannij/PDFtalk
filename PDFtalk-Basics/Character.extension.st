Extension { #name : #Character }

{ #category : #'*PDFtalk-Basics-PDF' }
Character class >> illegalCode [
	^16rFFFF
]

{ #category : #'*PDFtalk-Basics-testing' }
Character >> isAscii [
	^self asInteger < 128
]

{ #category : #'*PDFtalk-Basics-testing' }
Character >> isPdfDelimiter [
	^self class pdfDelimiters includes: self
]

{ #category : #'*PDFtalk-Basics-testing' }
Character >> isPdfNumeric [
	^self class pdfNumeric includes: self
]

{ #category : #'*PDFtalk-Basics-testing' }
Character >> isPdfRegular [
	^self isPdfDelimiter not and: [
	self isPostScriptWhitespace not]
]

{ #category : #'*PDFtalk-Basics-PDF' }
Character class >> pdfDelimiters [
	"<SequenceableCollection of Character>"

	^'()<>[]{}/%'
]

{ #category : #'*PDFtalk-Basics-PDF' }
Character class >> pdfNumeric [
	"<SequenceableCollection of Character>"

	^'+-.0123456789'
]
