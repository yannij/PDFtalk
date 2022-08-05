"
Paint the shape and colour shading described by a shading dictionary, subject to the current clipping path. 
The current colour in the graphics state is neither used nor altered. 
The effect is different from that of painting a path using a shading pattern as the current colour.

name is the name of a shading dictionary resource in the Shading subdictionary of the current resource dictionary. 
All coordinates in the shading dictionary are interpreted relative to the current user space. 
(By contrast, when a shading dictionary is used in a type 2 pattern, the coordinates are expressed in pattern space.) 
All colours are interpreted in the colour space identified by the shading dictionary’s ColorSpace entry. 
The Background entry, if present, is ignored.

This operator should be applied only to bounded or geometrically defined shadings. 
If applied to an unbounded shading, it paints the shading’s gradient fill across the entire clipping region, which may be time-consuming
"
Class {
	#name : #PtPaintShading,
	#superclass : #PtShadingOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #accessing }
PtPaintShading class >> documentation [
	^'Paint the shape and colour shading described by a shading dictionary, subject to the current clipping path. The current colour in the graphics state is neither used nor altered. The effect is different from that of painting a path using a shading pattern as the current colour.

name is the name of a shading dictionary resource in the Shading subdictionary of the current resource dictionary. All coordinates in the shading dictionary are interpreted relative to the current user space. (By contrast, when a shading dictionary is used in a type 2 pattern, the coordinates are expressed in pattern space.) All colours are interpreted in the colour space identified by the shading dictionary’s ColorSpace entry. The Background entry, if present, is ignored.

This operator should be applied only to bounded or geometrically defined shadings. If applied to an unbounded shading, it paints the shading’s gradient fill across the entire clipping region, which may be time-consuming'
]

{ #category : #accessing }
PtPaintShading class >> operandTypes [
	^#(#('name' Name))
]

{ #category : #accessing }
PtPaintShading class >> operatorName [
	^#sh
]

{ #category : #accessing }
PtPaintShading class >> pdfVersion [
	^PtVersion pdf1_3
]

{ #category : #accessing }
PtPaintShading >> resourceIn: aPageGraphics [
	^aPageGraphics resources Shading objectAt: self operands first content
]
