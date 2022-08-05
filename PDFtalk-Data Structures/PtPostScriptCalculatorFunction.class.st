"
PDF Function as defined in PDF 32000_2008.pdf pp. 97.

A type 4 function, also called a PostScript calculator function, shall be represented as a stream containing code written in a small subset of the PostScript language.

Errors in Type 4 Functions
The part of a conforming reader that reads a type 4 function (analogous to the PostScript scanner) shall detect and report syntax errors.
Any errors detected by the conforming reader shall be errors in the PDF file and shall be handled like other errors in the file.

The part of a conforming reader that executes a type 4 function (analogous to the PostScript interpreter) shall detect and report errors.
This specification does not define a representation for the errors; those details shall be provided by the conforming reader that processes the PDF file.
The following types of errors can occur (among others):
	• Stack overflow
	• Stack underflow
	• A type error (for example, applying not to a real number)
	• A range error (for example, applying sqrt to a negative number)
	• An undefined result (for example, dividing by 0)
"
Class {
	#name : #PtPostScriptCalculatorFunction,
	#superclass : #PtFunctionStream,
	#category : #'PDFtalk-Data Structures'
}

{ #category : #accessing }
PtPostScriptCalculatorFunction class >> allowedOperators [
	| arithmetic relationalBooleanBitwise conditional stack |
	arithmetic := #(#abs #add #atan #ceiling #cos #cvi #cvr #div #exp #floor #idiv #ln #log #mod #mul #neg #round #sin #sqrt #sub #truncate).
	relationalBooleanBitwise := #(#and #bitshift #eq false #ge #gt #le #lt #ne #not #or true #xor).
	conditional := #(#if #ifelse).
	stack := #(#copy #dup #exch #index #pop #roll).
	^arithmetic , relationalBooleanBitwise , conditional , stack
]

{ #category : #accessing }
PtPostScriptCalculatorFunction class >> functionType [
	^4
]

{ #category : #accessing }
PtPostScriptCalculatorFunction class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #PostScriptCalculatorFunction
		supertype: #Function
		version: #(1 2)
		section: '7.10.5'
		documentation: 'A type 4 function, also called a PostScript calculator function, shall be represented as a stream containing code written in a small subset of the PostScript language.

Errors in Type 4 Functions
The part of a conforming reader that reads a type 4 function (analogous to the PostScript scanner) shall detect and report syntax errors.
Any errors detected by the conforming reader shall be errors in the PDF file and shall be handled like other errors in the file.

The part of a conforming reader that executes a type 4 function (analogous to the PostScript interpreter) shall detect and report errors.
This specification does not define a representation for the errors; those details shall be provided by the conforming reader that processes the PDF file.
The following types of errors can occur (among others):
	• Stack overflow
	• Stack underflow
	• A type error (for example, applying not to a real number)
	• A range error (for example, applying sqrt to a negative number)
	• An undefined result (for example, dividing by 0)'
]
