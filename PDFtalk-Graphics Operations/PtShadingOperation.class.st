"
PDF Shading Operator as defined in PDF 32000_2008.pdf, section 8.7.4.2, pp. 181.

When the area to be painted is a relatively simple shape whose geometry is the same as that of the gradient fill itself, 
the sh operator may be used instead of the usual painting operators. 
sh accepts a shading dictionary as an operand and applies the corresponding gradient fill directly to current user space. 
This operator does not require the creation of a pattern dictionary or a path and works without reference to the current colour in the graphics state.

NOTE	Patterns defined by type 2 pattern dictionaries do not tile. 
		To create a tiling pattern containing a gradient fill, invoke the sh operator from within the content stream of a type 1 (tiling) pattern.
"
Class {
	#name : #PtShadingOperation,
	#superclass : #PtOperation,
	#category : #'PDFtalk-Graphics Operations'
}
