"
Charset data is located via the offset operand to the charset operator in the Top DICT.
Each charset is described by a formattype identifier byte followed by format-specific data.
Three formats are currently defined.
"
Class {
	#name : #CFFCharset,
	#superclass : #CFFMapping,
	#category : #'PDFtalk-Fonts CompactFontFormat'
}

{ #category : #accessing }
CFFCharset >> sids [
	"<Array of: SID>"

	^self subclassResponsibility
]
