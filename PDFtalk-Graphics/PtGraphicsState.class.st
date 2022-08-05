"
PDF Graphics State as defined in PDF 32000_2008.pdf, section 8.4, pp. 121.

A conforming reader shall maintain an internal data structure called the graphics state that holds current graphics control parameters. 
These parameters define the global framework within which the graphics operators execute.

EXAMPLE 1
The f (fill) operator implicitly uses the current colour parameter, and the S (stroke) operator additionally uses the current line width parameter from the graphics state.

A conforming reader shall initialize the graphic state at the beginning of each page with the values specified. 
Table 52 lists those graphics state parameters that are device-independent and are appropriate to specify in page descriptions. 
The parameters listed in Table 53 control details of the rendering (scan conversion) process and are device-dependent; 
a page description that is intended to be device-independent should not be written to modify these parameters.
"
Class {
	#name : #PtGraphicsState,
	#superclass : #PDFDictionary,
	#category : #'PDFtalk-Graphics'
}

{ #category : #pragmas }
PtGraphicsState class >> pragmas [
	<pragmas: #instance>
	^#(#type: #typeArrayOf: #deviceDependent #modifiedBy: #version:dot: #attribute:documentation:)
]

{ #category : #'accessing entries' }
PtGraphicsState >> CTM [
	<type: #Matrix>
	<modifiedBy: #(#cm)>
	<attribute: 1 documentation: 'The current transformation matrix, which maps positions from user coordinates to device coordinates. 
This matrix is modified by each application of the coordinate transformation operator, cm.'>
	^self objectAt: #CTM ifAbsent: [(PtPDF classAt: #Matrix) identity]
]

{ #category : #actions }
PtGraphicsState >> advanceTextMatrixBy: aWidthNumber [
	self at: #textMatrix put: (self textMatrix translatedByTransformedDelta: aWidthNumber @ 0)
]

{ #category : #'accessing entries' }
PtGraphicsState >> alphaConstantNonstroking [
	<type: #Number>
	<version: 1 dot: 4>
	<attribute: 26 documentation: 'The constant shape or constant opacity value to be used in the transparent imaging model. 
There are two separate alpha constant parameters: one for stroking and one for all other painting operations. 
A conforming reader shall implicitly reset this parameter to its initial value at the beginning of execution of a transparency group XObject.'>
	^self objectAt: #alphaConstantNonstroking ifAbsent: [1.0 asPDF]
]

{ #category : #'accessing entries' }
PtGraphicsState >> alphaConstantStroking [
	<type: #Number>
	<version: 1 dot: 4>
	<attribute: 25 documentation: 'The constant shape or constant opacity value to be used in the transparent imaging model. 
There are two separate alpha constant parameters: one for stroking and one for all other painting operations. 
A conforming reader shall implicitly reset this parameter to its initial value at the beginning of execution of a transparency group XObject.'>
	^self objectAt: #alphaConstantStroking ifAbsent: [1.0 asPDF]
]

{ #category : #'accessing entries' }
PtGraphicsState >> alphaSource [
	<type: #Boolean>
	<version: 1 dot: 4>
	<attribute: 27 documentation: 'A flag specifying whether the current soft mask and alpha constant parameters 
shall be interpreted as shape values (true) or opacity values (false). 
This flag also governs the interpretation of the SMask entry, if any, in an image dictionary.'>
	^self objectAt: #alphaSource ifAbsent: [false]
]

{ #category : #'accessing entries' }
PtGraphicsState >> blackGeneration [
	<type: #Function>
	<type: #Name>
	<deviceDependent>
	<version: 1 dot: 2>
	<attribute: 31 documentation: 'A function that calculates the level of the black colour component to use when converting RGB colours to CMYK. 
Initial value: a conforming reader shall initialize this to a suitable device dependent value.'>
	^self objectAt: #blackGeneration ifAbsent: nil
]

{ #category : #'accessing entries' }
PtGraphicsState >> blendMode [
	<type: #Name>
	<typeArrayOf: #Name>
	<version: 1 dot: 4>
	<attribute: 23 documentation: 'The current blend mode to be used in the transparent imaging model. 
A conforming reader shall implicitly reset this parameter to its initial value at the beginning of execution of a transparency group XObject.'>
	^self objectAt: #blendMode ifAbsent: [#Normal asPDF]
]

{ #category : #accessing }
PtGraphicsState >> characterSpace [
	"<Number> in text space
	extra space between each character"

	^self characterSpacing asSmalltalkValue
]

{ #category : #'accessing entries' }
PtGraphicsState >> characterSpacing [
	<type: #Number>
	<attribute: 7 documentation: 'Set the character spacing, Tc, to charSpace, which shall be a number expressed in unscaled text space units.
Character spacing shall be used by the Tj, TJ, and '' operators'>
	^self objectAt: #characterSpacing ifAbsent: [0 asPDF]
]

{ #category : #accessing }
PtGraphicsState >> classesForAttributes [
	^Array with: self class
]

{ #category : #'accessing entries' }
PtGraphicsState >> clippingPath [
	<attribute: 2 documentation: 'The current clipping path, which defines the boundary against which all output shall be cropped. 
Initial value: the boundary of the entire imageable portion of the output page.'>
	^self objectAt: #clippingPath ifAbsent: nil
]

{ #category : #'accessing entries' }
PtGraphicsState >> colorNonstroking [
	<type: #Array>
	<attribute: 6 documentation: 'The current colour to be used during painting operations. 
The type and interpretation of this parameter depend on the current colour space; for most colour spaces, a colour value consists of one to four numbers.'>
	^self objectAt: #colorNonstroking ifAbsent: [self colorSpaceNonstroking defaultBlack]
]

{ #category : #'accessing entries' }
PtGraphicsState >> colorSpaceNonstroking [
	<type: #ColourSpace>
	<attribute: 4 documentation: 'The current colour space in which colour values shall beinterpreted.'>
	^self objectAt: #colorSpaceNonstroking ifAbsent: [(PtPDF classAt: #DeviceGray) new]
]

{ #category : #'accessing entries' }
PtGraphicsState >> colorSpaceStroking [
	<type: #ColourSpace>
	<attribute: 3 documentation: 'The current colour space in which colour values shall beinterpreted.'>
	^self objectAt: #colorSpaceStroking ifAbsent: [(PtPDF classAt: #DeviceGray) new]
]

{ #category : #'accessing entries' }
PtGraphicsState >> colorStroking [
	<type: #Array>
	<attribute: 5 documentation: 'The current colour to be used during painting operations. 
The type and interpretation of this parameter depend on the current colour space; for most colour spaces, a colour value consists of one to four numbers.'>
	^self objectAt: #colorStroking ifAbsent: [self colorSpaceStroking defaultBlack]
]

{ #category : #copying }
PtGraphicsState >> copy [
	"bypasses the type checking - optimized for speed.
	The GraphicsState is used only internally, therefore copying an existing GraphicsState should be save"

	^self class new initializeDirectWithContent: self content copy
]

{ #category : #'accessing entries' }
PtGraphicsState >> dashPattern [
	<type: #Dash>
	<modifiedBy: #(#d)>
	<attribute: 20 documentation: 'A description of the dash pattern to be used when paths are stroked'>
	^self objectAt: #dashPattern ifAbsent: [(PtPDF classAt: #Dash) empty]
]

{ #category : #accessing }
PtGraphicsState >> defaultAt: aSymbol [

	^[self class new perform: aSymbol] on: PtError do: [:ex | ex return: nil]
]

{ #category : #'accessing entries' }
PtGraphicsState >> flatness [
	<type: #Number>
	<deviceDependent>
	<attribute: 35 documentation: 'The precision with which curves shall be rendered on the output device. 
The value of this parameter (positive number) gives the maximum error tolerance, measured in output device pixels; 
smaller numbers give smoother curves at the expense of more computation and memory use.'>
	^self objectAt: #flatness ifAbsent: [1.0 asPDF]
]

{ #category : #accessing }
PtGraphicsState >> fontSize [
	"<Number>"

	^self textFontSize asSmalltalkValue
]

{ #category : #'accessing entries' }
PtGraphicsState >> halftone [
	<type: #Dictionary>
	<type: #Stream>
	<type: #Name>
	<deviceDependent>
	<version: 1 dot: 2>
	<attribute: 34 documentation: 'A halftone screen for gray and colour rendering, specified as a halftone dictionary or stream. 
Initial value: a conforming reader shall initialize this to a suitable device dependent value.'>
	^self objectAt: #halftone ifAbsent: nil
]

{ #category : #accessing }
PtGraphicsState >> horizontalScale [
	^self horizontalScaling asSmalltalkValue / 100
]

{ #category : #'accessing entries' }
PtGraphicsState >> horizontalScaling [
	<type: #Number>
	<attribute: 9 documentation: 'Set the horizontal scaling, Th, to (scale ÷ 100).
scale shall be a number specifying the percentage of the normal width'>
	^self objectAt: #horizontalScaling ifAbsent: [100 asPDF]
]

{ #category : #'accessing entries' }
PtGraphicsState >> leading [
	<type: #Number>
	<attribute: 10 documentation: 'Set the text leading, Tl, to leading, which shall be a number expressed in unscaled text space units.
Text leading shall be used only by the T*, '', and " operators'>
	^self objectAt: #leading ifAbsent: [0 asPDF]
]

{ #category : #'accessing entries' }
PtGraphicsState >> lineCap [
	<type: #Integer>
	<attribute: 17 documentation: 'A code specifying the shape of the endpoints for any open path that is stroked.'>
	^self objectAt: #lineCap ifAbsent: [PtLineCap butt value asPDF]
]

{ #category : #'accessing entries' }
PtGraphicsState >> lineJoin [
	<type: #Integer>
	<attribute: 18 documentation: 'A code specifying the shape of joints between connected segments of a stroked path.'>
	^self objectAt: #lineJoin ifAbsent: [PtLineJoin miter value asPDF]
]

{ #category : #'accessing entries' }
PtGraphicsState >> lineWidth [
	<type: #Number>
	<modifiedBy: #(#w)>
	<attribute: 16 documentation: 'The thickness, in user space units, of paths to be stroked.'>
	^self objectAt: #lineWidth ifAbsent: [1.0 asPDF]
]

{ #category : #'accessing entries' }
PtGraphicsState >> miterLimit [
	<type: #Number>
	<attribute: 19 documentation: 'The maximum length of mitered line joins for stroked paths. 
This parameter limits the length of “spikes” produced when line segments join at sharp angles. 
Initial value: 10.0, for a miter cutoff below approximately 11.5 degrees.'>
	^self objectAt: #miterLimit ifAbsent: [10.0 asPDF]
]

{ #category : #actions }
PtGraphicsState >> nextLineBy: aPoint [
	self at: #textLineMatrix put: (self textLineMatrix translatedByTransformedDelta: aPoint).
	self at: #textMatrix put: self textLineMatrix
]

{ #category : #'accessing entries' }
PtGraphicsState >> overprintMode [
	<type: #Number>
	<deviceDependent>
	<version: 1 dot: 3>
	<attribute: 30 documentation: 'A code specifying whether a colour component value of 0 in a DeviceCMYK colour space 
should erase that component (0) or leave it unchanged (1) when overprinting.'>
	^self objectAt: #overprintMode ifAbsent: [0 asPDF]
]

{ #category : #'accessing entries' }
PtGraphicsState >> overprintNonstroking [
	<type: #Boolean>
	<deviceDependent>
	<version: 1 dot: 3>
	<attribute: 29 documentation: 'A flag specifying (on output devices that support the overprint control feature) 
whether painting in one set of colorants should cause the corresponding areas of other colorants to be erased (false) or left unchanged (true).'>
	^self objectAt: #overprintNonstroking ifAbsent: [false]
]

{ #category : #'accessing entries' }
PtGraphicsState >> overprintStroking [
	<type: #Boolean>
	<deviceDependent>
	<version: 1 dot: 3>
	<attribute: 28 documentation: 'A flag specifying (on output devices that support the overprint control feature) 
whether painting in one set of colorants should cause the corresponding areas of other colorants to be erased (false) or left unchanged (true).'>
	^self objectAt: #overprintStroking ifAbsent: [false]
]

{ #category : #'accessing entries' }
PtGraphicsState >> renderingIntent [
	<type: #Name>
	<attribute: 21 documentation: 'The rendering intent to be used when converting CIE-based colours to device colours. 
Initial value: RelativeColorimetric.'>
	^self objectAt: #renderingIntent ifAbsent: [#RelativeColorimetric asPDF]
]

{ #category : #accessing }
PtGraphicsState >> scaledFontSize [
	"<Number>"

	^self fontSize * self horizontalScale
]

{ #category : #accessing }
PtGraphicsState >> scaledSpacingForString: aString [
	"<Number>
	char and word spacing scaled horizontally"

	| charsSpacing wordsSpacing |
	charsSpacing := self characterSpace * aString size.
	wordsSpacing := self wordSpace * aString numberOfSpaces.
	^(charsSpacing + wordsSpacing) * self horizontalScale
]

{ #category : #'accessing entries' }
PtGraphicsState >> smoothness [
	<type: #Number>
	<deviceDependent>
	<version: 1 dot: 3>
	<attribute: 36 documentation: 'The precision with which colour gradients are to be rendered on the output device. 
The value of this parameter (0 to 1.0) gives the maximum error tolerance, expressed as a fraction of the range of each colour component; 
smaller numbers give smoother colour transitions at the expense of more computation and memory use. 
Initial value: a conforming reader shall initialize this to a suitable device dependent value.'>
	^self objectAt: #smoothness ifAbsent: nil
]

{ #category : #'accessing entries' }
PtGraphicsState >> softMask [
	<type: #Name>
	<type: #Dictionary>
	<version: 1 dot: 4>
	<attribute: 24 documentation: 'A soft-mask dictionary specifying the mask shape or mask opacity values to be used in the transparent imaging model, 
or the name None if no such mask is specified. 
A conforming reader shall implicitly reset this parameter to its initial value at the beginning of execution of a transparency group XObject.'>
	^self objectAt: #softMask ifAbsent: [#None asPDF]
]

{ #category : #'accessing entries' }
PtGraphicsState >> strokeAdjustment [
	<type: #Boolean>
	<version: 1 dot: 2>
	<attribute: 22 documentation: 'A flag specifying whether to compensate for possible rasterization effects 
when stroking a path with a line width that is small relative to the pixel resolution of the output device.
NOTE
This is considered a device-independent parameter, even though the details of its effects are device-dependent.'>
	^self objectAt: #strokeAdjustment ifAbsent: [false]
]

{ #category : #'accessing entries' }
PtGraphicsState >> textFont [
	<type: #Name>
	<attribute: 11 documentation: 'Set the text font, Tf, to font.
font shall be the name of a font resource in the Font subdictionary of the current resource dictionary.
There is no initial value for font; it shall be specified explicitly by using Tf before any text is shown'>
	^self objectAt: #textFont ifAbsent: nil
]

{ #category : #'accessing entries' }
PtGraphicsState >> textFontSize [
	<type: #Number>
	<attribute: 12 documentation: 'Set the text font size, Tfs, to size.
size shall be a number representing a scale factor.
There is no initial value for size; it shall be specified explicitly by using Tf before any text is shown'>
	^self objectAt: #textFontSize ifAbsent: nil
]

{ #category : #'accessing entries' }
PtGraphicsState >> textKnockout [
	<type: #Boolean>
	<version: 1 dot: 4>
	<attribute: 15 documentation: 'The text knockout flag, 
shall determine the behaviour of overlapping glyphs within a text object in the transparent imaging model.'>
	^self objectAt: #textKnockout ifAbsent: [true]
]

{ #category : #'accessing entries' }
PtGraphicsState >> textLineMatrix [
	<type: #Matrix>
	<attribute: 38 documentation: 'The text line matrix'>
	^self objectAt: #textLineMatrix ifAbsent: [(PtPDF classAt: #Matrix) identity]
]

{ #category : #'accessing entries' }
PtGraphicsState >> textMatrix [
	<type: #Matrix>
	<attribute: 37 documentation: 'The text matrix'>
	^self objectAt: #textMatrix ifAbsent: [(PtPDF classAt: #Matrix) identity]
]

{ #category : #'accessing entries' }
PtGraphicsState >> textRenderingMode [
	<type: #Integer>
	<attribute: 13 documentation: 'Set the text rendering mode, Tmode, to render, which shall be an integer'>
	^self objectAt: #textRenderingMode ifAbsent: [0 asPDF]
]

{ #category : #'accessing entries' }
PtGraphicsState >> textRise [
	<type: #Number>
	<attribute: 14 documentation: 'Set the text rise, Trise, to rise, which shall be a number expressed in unscaled text space units'>
	^self objectAt: #textRise ifAbsent: [0 asPDF]
]

{ #category : #accessing }
PtGraphicsState >> trailingCharacterSpace [
	"<Number> in text space
	character space after the last character"

	^self characterSpace * self horizontalScale
]

{ #category : #'accessing entries' }
PtGraphicsState >> transfer [
	<type: #Function>
	<typeArrayOf: #Name>
	<type: #Name>
	<deviceDependent>
	<version: 1 dot: 2>
	<attribute: 33 documentation: 'A function that adjusts device gray or colour component levels to compensate for nonlinear response in a particular output device. 
Initial value: a conforming reader shall initialize this to a suitable device dependent value.'>
	^self objectAt: #transfer ifAbsent: nil
]

{ #category : #'accessing entries' }
PtGraphicsState >> undercolorRemoval [
	<type: #Function>
	<type: #Name>
	<deviceDependent>
	<version: 1 dot: 2>
	<attribute: 32 documentation: 'A function that calculates the reduction in the levels 
of the cyan, magenta, and yellow colour components to compensate for the amount of black added by black generation. 
Initial value: a conforming reader shall initialize this to a suitable device dependent value.'>
	^self objectAt: #undercolorRemoval ifAbsent: nil
]

{ #category : #accessing }
PtGraphicsState >> widthOfAdjustment: aNumber [
	"<Number>"

	^aNumber negated / 1000 * self scaledFontSize
]

{ #category : #accessing }
PtGraphicsState >> widthOfString: aString inFont: aFont [
	"<Number>"

	| stringWidth spacing |
	stringWidth := aFont stringWidth: aString.
	spacing := self scaledSpacingForString: aString.
	^stringWidth / 1000 * self scaledFontSize + spacing
]

{ #category : #accessing }
PtGraphicsState >> wordSpace [
	"<Number> in text space
	extra space between each word (separated by a space)"

	^self wordSpacing asSmalltalkValue
]

{ #category : #'accessing entries' }
PtGraphicsState >> wordSpacing [
	<type: #Number>
	<attribute: 8 documentation: 'Set the word spacing, Tw, to wordSpace, which shall be a number expressed in unscaled text space units.
Word spacing shall be used by the Tj, TJ, and '' operators'>
	^self objectAt: #wordSpacing ifAbsent: [0 asPDF]
]
