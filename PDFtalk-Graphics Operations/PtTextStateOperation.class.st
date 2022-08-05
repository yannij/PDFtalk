"
PDF Text State Operator as defined in PDF 32000_2008.pdf, section 9.3.1, pp. 243.

The text state comprises those graphics state parameters that only affect text. 
There are nine parameters in the text state.
	Tc		Character spacing
	Tw		Word spacing
	Th		Horizontal scaling
	Tl		Leading
	Tf		Text font
	Tfs		Text font size
	Tmode	Text rendering mode
	Trise	Text rise
	Tk		Text knockout

Except for the previously described Tf and Tfs, these parameters are discussed further in subsequent sub-clauses. 
(three additional text-related parameters may occur only within a text object: 
	Tm, the text matrix; 
	Tlm, the text line matrix; and 
	Trm, the text rendering matrix.) 
The values of the text state parameters shall be consulted when text is positioned and shown. 
In particular, the spacing and scaling parameters shall be used in a computation. 

The text knockout parameter, Tk, shall be set through the TK entry in a graphics state parameter dictionary by using the gs operator. 
There is no specific operator for setting this parameter.

The text state operators may appear outside text objects, and the values they set are retained across text objects in a single content stream. 
Like other graphics state parameters, these parameters shall be initialized to their default values at the beginning of each page
"
Class {
	#name : #PtTextStateOperation,
	#superclass : #PtOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #actions }
PtTextStateOperation >> processWith: aProcessor at: indexInteger [
	aProcessor addTextStateOperation: self
]
