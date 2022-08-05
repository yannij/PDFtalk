"
PDF External Objects as defined in PDF 32000_2008.pdf, section 8.8, pp. 201.

An external object (commonly called an XObject) is a graphics object whose contents are defined by a self-contained stream, 
separate from the content stream in which it is used. 
There are three types of external objects:
	•	An image XObject represents a sampled visual image such as a photograph.
	•	A form XObject is a self-contained description of an arbitrary sequence of graphics objects.
	•	A PostScript XObject contains a fragment of code expressed in the PostScript page description language. 
		PostScript XObjects should not be used.

Two further categories of external objects, group XObjects and reference XObjects (both PDF 1.4), 
are actually specialized types of form XObjects with additional properties.

Any XObject can be painted as part of another content stream by means of the Do operator. 
This operator applies to any type of XObject—image, form, or PostScript. 
The syntax is the same in all cases, although details of the operator’s behaviour differ depending on the type.
"
Class {
	#name : #PtXObjectOperation,
	#superclass : #PtOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #actions }
PtXObjectOperation >> processWith: aProcessor at: indexInteger [
	aProcessor addXObjectOperation: self
]
