"
Show one or more text strings, allowing individual glyph positioning. 
Each element of array shall be either a string or a number. 
If the element is a string, this operator shall show the string. 
If it is a number, the operator shall adjust the text position by that amount; that is, it shall translate the text matrix, Tm. 
The number shall be expressed in thousandths of a unit of text space. 
This amount shall be subtracted from the current horizontal or vertical coordinate, depending on the writing mode. 
In the default coordinate system, a positive adjustment has the effect of moving the next glyph painted either to the left or down by the given amount
"
Class {
	#name : #PtShowTextPositioned,
	#superclass : #PtTextShowingOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #accessing }
PtShowTextPositioned class >> documentation [
	^'Show one or more text strings, allowing individual glyph positioning. Each element of array shall be either a string or a number. If the element is a string, this operator shall show the string. If it is a number, the operator shall adjust the text position by that amount; that is, it shall translate the text matrix, Tm. The number shall be expressed in thousandths of a unit of text space. This amount shall be subtracted from the current horizontal or vertical coordinate, depending on the writing mode. In the default coordinate system, a positive adjustment has the effect of moving the next glyph painted either to the left or down by the given amount'
]

{ #category : #accessing }
PtShowTextPositioned class >> operandTypes [
	^#(#('array' #Array))
]

{ #category : #accessing }
PtShowTextPositioned class >> operatorName [
	^#TJ
]

{ #category : #accessing }
PtShowTextPositioned >> gaps [
	"<Array of: Number>
	the adjustments in font space"

	^self stringsAndGaps reject: #isString
]

{ #category : #accessing }
PtShowTextPositioned >> string [
	| wst |
	wst := String new writeStream.
	(self stringsAndGaps select: #isString) do: [:s | wst nextPutAll: s].
	^wst contents
]

{ #category : #accessing }
PtShowTextPositioned >> stringBytes [
	| wst |
	wst := ByteArray new writeStream.
	(self stringOperand content select: [:arg | arg content isSequenceable]) do: [:s |
		wst nextPutAll: s content].
	^wst contents
]

{ #category : #accessing }
PtShowTextPositioned >> stringsAndGaps [
	"<Array of: (String | Number)>
	the string parts and adjustments as Smalltalk objects"

	^self stringOperand content collect: #asSmalltalkValue
]

{ #category : #accessing }
PtShowTextPositioned >> widthInFont: aFont inState: aGraphicsState [
	| rst width bytes |
	width := 0.
	rst := self stringOperand content readStream.
	bytes := #[].
	[rst atEnd] whileFalse: [
		| pdfStringOrNumber |
		pdfStringOrNumber := rst next.
		bytes := pdfStringOrNumber content isSequenceable
			ifTrue: [
			bytes , pdfStringOrNumber content]
			ifFalse: [
			| stringWidth adjustment |
			stringWidth := aGraphicsState widthOfString: (PtPDF String content: bytes) inFont: aFont.
			adjustment := aGraphicsState widthOfAdjustment: pdfStringOrNumber asSmalltalkValue.
			width := width + (stringWidth + adjustment).
			#[]]].
	bytes notEmpty ifTrue: [
		width := width + (aGraphicsState widthOfString: (PtPDF String content: bytes) inFont: aFont)].
	^width
]
