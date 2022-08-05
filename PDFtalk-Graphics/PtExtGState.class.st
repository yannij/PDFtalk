"
PDF Graphics State Parameter Dictionaries as defined in PDF 32000_2008.pdf, section 8.4.5, pp. 128.

While some parameters in the graphics state may be set with individual operators, others may not. 
The latter may only be set with the generic graphics state operator gs (PDF 1.2). 
The operand supplied to this operator shall be the name of a graphics state parameter dictionary 
whose contents specify the values of one or more graphics state parameters. 
This name shall be looked up in the ExtGState subdictionary of the current resource dictionary.

The graphics state parameter dictionary is also used by type 2 patterns, which do not have a content stream in which the graphics state operators could be invoked.

Each entry in the parameter dictionary shall specify the value of an individual graphics state parameter. 
All entries need not be present for every invocation of the gs operator; the supplied parameter dictionary may include any combination of parameter entries. 
The results of gs shall be cumulative; parameter values established in previous invocations persist until explicitly overridden.

NOTE
Note that some parameters appear in both Tables; 
these parameters can be set either with individual graphics state operators or with gs. 
It is expected that any future extensions to the graphics state will be implemented by 
adding new entries to the graphics state parameter dictionary rather than by introducing new graphics state operators.
"
Class {
	#name : #PtExtGState,
	#superclass : #PDFDictionary,
	#category : #'PDFtalk-Graphics'
}

{ #category : #constants }
PtExtGState class >> blendModes [
	^self separableBlendModes , self nonSeparableBlendModes
]

{ #category : #'instance creation' }
PtExtGState class >> default [
	| inst |
	inst := self empty.
	inst at: #SA put: true.
	inst at: #OP put: false.
	inst at: #op put: false.
	inst at: #OPM put: 1.
	inst at: #FL put: 0.
	inst at: #RI put: #RelativeColorimetric.
	^inst
]

{ #category : #'instance creation' }
PtExtGState class >> forTransparency [
	"<ExtGState>
	a graphics state with (default) transparency attributes"

	| inst |
	inst := self default.
	inst addTransparencyAttributes.
	^inst
]

{ #category : #constants }
PtExtGState class >> nonSeparableBlendModes [
	^#(#Hue #Saturation #Color #Luminosity)
]

{ #category : #accessing }
PtExtGState class >> pdfTypeDefinition [

	^PDFTypeDefinition
		name: #ExtGState
		supertype: #Dictionary
		section: '8.4.5'
		documentation: 'While some parameters in the graphics state may be set with individual operators, others may not. 
The latter may only be set with the generic graphics state operator gs (PDF 1.2). 
The operand supplied to this operator shall be the name of a graphics state parameter dictionary 
whose contents specify the values of one or more graphics state parameters. 
This name shall be looked up in the ExtGState subdictionary of the current resource dictionary.

The graphics state parameter dictionary is also used by type 2 patterns, which do not have a content stream in which the graphics state operators could be invoked.

Each entry in the parameter dictionary shall specify the value of an individual graphics state parameter. 
All entries need not be present for every invocation of the gs operator; the supplied parameter dictionary may include any combination of parameter entries. 
The results of gs shall be cumulative; parameter values established in previous invocations persist until explicitly overridden.

NOTE
Note that some parameters appear in both Tables; 
these parameters can be set either with individual graphics state operators or with gs. 
It is expected that any future extensions to the graphics state will be implemented by 
adding new entries to the graphics state parameter dictionary rather than by introducing new graphics state operators.'
]

{ #category : #accessing }
PtExtGState class >> resourcePrefix [
	^'GS'
]

{ #category : #accessing }
PtExtGState class >> resourceType [
	"<Symbol>
	the name of a /Resources key"

	^#ExtGState
]

{ #category : #constants }
PtExtGState class >> separableBlendModes [
	^#(#Normal #Compatible #Multiply #Screen #Overlay #Darken #Lighten #ColorDodge #ColorBurn #HardLight #SoftLight #Difference #Exclusion)
]

{ #category : #'accessing entries' }
PtExtGState >> AIS [
	<type: #Boolean>
	<version: 1 dot: 4>
	<attribute: 25 documentation: 'The alpha source flag (“alpha is shape”), 
specifying whether the current soft mask and alpha constant shall beinterpreted as shape values (true) or opacity values (false).'>
	^self objectAt: #AIS
]

{ #category : #'accessing entries' }
PtExtGState >> BG [
	<type: #Function>
	<attribute: 11 documentation: 'The black-generation function, which maps the interval [0.0 1.0] to the interval [0.0 1.0].'>
	^self objectAt: #BG
]

{ #category : #'accessing entries' }
PtExtGState >> BG2 [
	<type: #Function>
	<type: #Name>
	<version: 1 dot: 3>
	<attribute: 12 documentation: 'Same as BG except that the value may also be the name Default, 
denoting the black-generation function that was in effect at the start of the page. 
If both BG and BG2 are present in the same graphics state parameter dictionary, BG2 shall take precedence.'>
	^self objectAt: #BG2
]

{ #category : #'accessing entries' }
PtExtGState >> BM [
	<type: #Name>
	<typeArrayOf: #Name>
	<version: 1 dot: 4>
	<attribute: 21 documentation: 'The current blend mode to be used in the transparent imaging model.'>
	^self objectAt: #BM
]

{ #category : #'accessing entries' }
PtExtGState >> CA [
	<type: #Number>
	<version: 1 dot: 4>
	<attribute: 23 documentation: 'The current stroking alpha constant, 
specifying the constant shape or constant opacity value that shall be used for stroking operations in the transparent imaging model.'>
	^self objectAt: #CA
]

{ #category : #'accessing entries' }
PtExtGState >> D [
	<type: #Dash>
	<version: 1 dot: 3>
	<attribute: 5 documentation: 'The line dash pattern, expressed as an array of the form [dashArray dashPhase], 
where dashArray shall be itself an array and dashPhase shall be an integer.'>
	^self objectAt: #D
]

{ #category : #'accessing entries' }
PtExtGState >> FL [
	<type: #Number>
	<version: 1 dot: 3>
	<attribute: 18 documentation: 'The flatness tolerance.'>
	^self objectAt: #FL
]

{ #category : #'accessing entries' }
PtExtGState >> Font [
	<type: #Array>
	<version: 1 dot: 3>
	<attribute: 10 documentation: 'An array of the form [font size], 
where font shall be an indirect reference to a font dictionary and size shall be a number expressed in text space units. 
These two objects correspond to the operands of the Tf operator; 
however, the first operand shall be an indirect object reference instead of a resource name.'>
	^self objectAt: #Font
]

{ #category : #'accessing entries' }
PtExtGState >> HT [
	<type: #Dictionary>
	<type: #Stream>
	<typeName: #Default>
	<attribute: 17 documentation: 'The halftone dictionary or stream or the name Default, 
denoting the halftone that was in effect at the start of the page.'>
	^self objectAt: #HT ifAbsent: [#Default asPDF]
]

{ #category : #'accessing entries' }
PtExtGState >> LC [
	<type: #Integer>
	<version: 1 dot: 3>
	<attribute: 2 documentation: 'The line cap style.'>
	^self objectAt: #LC
]

{ #category : #'accessing entries' }
PtExtGState >> LJ [
	<type: #Integer>
	<version: 1 dot: 3>
	<attribute: 3 documentation: 'The line join style.'>
	^self objectAt: #LJ
]

{ #category : #'accessing entries' }
PtExtGState >> LW [
	<type: #Number>
	<version: 1 dot: 3>
	<attribute: 1 documentation: 'The line width.'>
	^self objectAt: #LW
]

{ #category : #'accessing entries' }
PtExtGState >> ML [
	<type: #Number>
	<version: 1 dot: 3>
	<attribute: 4 documentation: 'The miter limit.'>
	^self objectAt: #ML
]

{ #category : #'accessing entries' }
PtExtGState >> OP [
	<type: #Boolean>
	<version: 1 dot: 3>
	<attribute: 7 documentation: 'A flag specifying whether to apply overprint. 
In PDF 1.2 and earlier, there is a single overprint parameter that applies to all painting operations. 
Beginning with PDF 1.3, there shall be two separate overprint parameters: 
one for stroking and one for all other painting operations. 
Specifying an OP entry shall set both parameters unless there is also an op entry in the same graphics state parameter dictionary, 
in which case the OP entry shall set only the overprint parameter for stroking.'>
	^self objectAt: #OP
]

{ #category : #'accessing entries' }
PtExtGState >> OPM [
	<type: #Integer>
	<version: 1 dot: 3>
	<attribute: 9 documentation: 'The overprint mode.'>
	^self objectAt: #OPM
]

{ #category : #'accessing entries' }
PtExtGState >> RI [
	<type: #Name>
	<version: 1 dot: 3>
	<attribute: 6 documentation: 'The name of the rendering intent.'>
	^self objectAt: #RI
]

{ #category : #'accessing entries' }
PtExtGState >> SA [
	<type: #Boolean>
	<attribute: 20 documentation: 'A flag specifying whether to apply automatic stroke adjustment.'>
	^self objectAt: #SA
]

{ #category : #'accessing entries' }
PtExtGState >> SM [
	<type: #Number>
	<version: 1 dot: 3>
	<attribute: 19 documentation: 'The smoothness tolerance.'>
	^self objectAt: #SM
]

{ #category : #'accessing entries' }
PtExtGState >> SMask [
	<type: #SoftMask>
	<type: #Name>
	<version: 1 dot: 4>
	<attribute: 22 documentation: 'The current soft mask, specifying the mask shape or mask opacity values that shall be used in the transparent imaging model.
Although the current soft mask is sometimes referred to as a “soft clip,” altering it with the gs operator completely replaces the old value with the new one, rather than intersecting the two as is done with the current clipping path parameter.'>
	^self objectAt: #SMask
]

{ #category : #'accessing entries' }
PtExtGState >> TK [
	<type: #Boolean>
	<version: 1 dot: 4>
	<attribute: 26 documentation: 'The text knockout flag, 
shall determine the behaviour of overlapping glyphs within a text object in the transparent imaging model.'>
	^self objectAt: #TK
]

{ #category : #'accessing entries' }
PtExtGState >> TR [
	<type: #Function>
	<typeArrayOf: #Function>
	<attribute: 15 documentation: 'The transfer function, which maps the interval [0.0 1.0] to the interval [0.0 1.0]. 
The value shall be either a single function (which applies to all process colorants) or 
an array of four functions (which apply to the process colorants individually). 
The name Identity may be used to represent the identity function.'>
	^self objectAt: #TR
]

{ #category : #'accessing entries' }
PtExtGState >> TR2 [
	<type: #Function>
	<typeArrayOf: #Function>
	<typeName: #Default>
	<version: 1 dot: 3>
	<attribute: 16 documentation: 'Same as TR except that the value may also be the name Default, 
denoting the transfer function that was in effect at the start of the page. 
If both TR and TR2 are present in the same graphics state parameter dictionary, TR2 shall take precedence.'>
	^self objectAt: #TR2
]

{ #category : #'accessing entries' }
PtExtGState >> Type [
	<type: #Name>
	<attribute: 1 documentation: 'The type of PDF object that this dictionary describes; shall be ExtGState for a graphics state parameter dictionary.'>
	^self objectAt: #Type ifAbsent: [nil]
]

{ #category : #'accessing entries' }
PtExtGState >> UCR [
	<type: #Function>
	<attribute: 13 documentation: 'The undercolor-removal function, which maps the interval [0.0 1.0] to the interval [-1.0 1.0].'>
	^self objectAt: #UCR
]

{ #category : #'accessing entries' }
PtExtGState >> UCR2 [
	<type: #Function>
	<type: #Name>
	<version: 1 dot: 3>
	<attribute: 14 documentation: 'Same as UCR except that the value may also be the name Default, 
denoting the undercolor-removal function that was in effect at the start of the page. 
If both UCR and UCR2 are present in the same graphics state parameter dictionary, UCR2 shall takeprecedence.'>
	^self objectAt: #UCR2
]

{ #category : #adding }
PtExtGState >> addTransparencyAttributes [
	self at: #BM put: #Normal.
	self at: #SMask put: #None.
	self at: #AIS put: false.
	self at: #CA put: 1.0.
	self at: #ca put: 1.0
]

{ #category : #'accessing entries' }
PtExtGState >> ca [
	<type: #Number>
	<version: 1 dot: 4>
	<attribute: 24 documentation: 'Same as CA, but for nonstroking operations.'>
	^self objectAt: #ca
]

{ #category : #accessing }
PtExtGState >> gsStateAttributeFor: keySymbol [
	"<Symbol>
	the attribute symbol of the graphics state which corresponds to keySymbol"

	| dict |
	dict := Valuemap new.
	dict at: #Type put: nil.	"special"
	dict at: #LW put: #lineWidth.
	dict at: #LC put: #lineCap.
	dict at: #LJ put: #lineJoin.
	dict at: #ML put: #miterLimit.
	dict at: #D put: #dashPattern.
	dict at: #RI put: #renderingIntent.
	dict at: #OP put: nil.	"special"
	dict at: #op put: #overprintNonstroking.
	dict at: #OPM put: #overprintMode.
	dict at: #Font put: nil.	"special"
	dict at: #BG put: #blackGeneration.
	dict at: #BG2 put: nil.	"special"
	dict at: #UCR put: #undercolorRemoval.
	dict at: #UCR2 put: nil.	"special"
	dict at: #TR put: #transfer.
	dict at: #TR2 put: nil.	"special"
	dict at: #HT put: #halftone.
	dict at: #FL put: #flatness.
	dict at: #SM put: #smoothness.
	dict at: #SA put: #strokeAdjustment.
	dict at: #BM put: #blendMode.
	dict at: #SMask put: #softMask.
	dict at: #CA put: #alphaConstantStroking.
	dict at: #ca put: #alphaConstantNonstroking.
	dict at: #AIS put: #alphaSource.
	dict at: #TK put: #textKnockout.
	^dict at: keySymbol ifAbsent: [keySymbol]
]

{ #category : #'accessing entries' }
PtExtGState >> op [
	<type: #Boolean>
	<version: 1 dot: 3>
	<attribute: 8 documentation: 'A flag specifying whether to apply overprint  for painting operations other than stroking. 
If this entry is absent, the OP entry, if any, shall also set this parameter.'>
	^self objectAt: #op
]
