"
MATH - The mathematical typesetting table

Mathematical formulas are complex text objects in which multiple elements with various metric, style or positioning attributes are combined. In order for a math handling engine to support layout of mathematical formulas, several types of font-specific information particular to the layout of formulas are required. The MATH table format defines data structures for font-specific information necessary for math formula layout.

General structure of math formulas is hierarchical, with formulas composed of smaller sub-formula components, where each sub-formula may be composed of even simpler sub-formulas, and so on down to individual characters, e.g. letters or numbers. 
"
Class {
	#name : #PtOTMath,
	#superclass : #PtOTTable,
	#category : #'PDFtalk-Fonts OpenType'
}

{ #category : #accessing }
PtOTMath class >> tag [
	^'MATH'
]
