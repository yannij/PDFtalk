"
PDF Text Showing Operator as defined in PDF 32000_2008.pdf, section 9.4.3, pp. 250.

The text-showing operators shall show text on the page, repositioning text space as they do so. 
All of the operators shall interpret the text string and apply the text state parameters.

The text-showing operators shall only appear within text objects.
"
Class {
	#name : #PtTextShowingOperation,
	#superclass : #PtOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #actions }
PtTextShowingOperation >> modify: aProcessor with: aResource [
	"change the graphics state with aResource"

	aProcessor graphicsState advanceTextMatrixBy: (self
		widthInFont: aProcessor currentFont
		inState: aProcessor graphicsState)
]

{ #category : #actions }
PtTextShowingOperation >> processWith: aProcessor at: indexInteger [
	aProcessor addTextShowingOperation: self
]

{ #category : #accessing }
PtTextShowingOperation >> string [
	"<String>"

	^self stringOperand asSmalltalkValue
]

{ #category : #accessing }
PtTextShowingOperation >> stringBytes [
	"<ByteArray>"

	^self stringOperand content
]

{ #category : #accessing }
PtTextShowingOperation >> stringOperand [
	"<PDFString>"

	^self operands first
]

{ #category : #accessing }
PtTextShowingOperation >> widthInFont: aFont inState: aGraphicsState [
	"<Number>
	in text space"

	^aGraphicsState widthOfString: self stringOperand inFont: aFont
]
