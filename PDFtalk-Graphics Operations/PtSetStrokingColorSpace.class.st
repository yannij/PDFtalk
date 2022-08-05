"
Set the current colour space to use for stroking operations. 
The operand name shall be a name object. 
If the colour space is one that can be specified by a name and no additional parameters (DeviceGray, DeviceRGB, DeviceCMYK, and certain cases of Pattern), 
the name may be specified directly. 
Otherwise, it shall be a name defined in the ColorSpace subdictionary of the current resource dictionary; 
the associated value shall be an array describing the colour space.

The names DeviceGray, DeviceRGB, DeviceCMYK, and Pattern always identify the corresponding colour spaces directly; 
they never refer to resources in the ColorSpace subdictionary.

The CS operator shall also set the current stroking colour to its initial value, which depends on the colour space:
In a DeviceGray, DeviceRGB, CalGray, or CalRGB colour space, the initial colour shall have all components equal to 0.0.
In a DeviceCMYK colour space, the initial colour shall be [0.0 0.0 0.0 1.0].
In a Lab or ICCBased colour space, the initial colour shall have all components equal to 0.0 unless that falls outside the intervals specified by the space’s Range entry, in which case the nearest valid value shall be substituted.
In an Indexed colour space, the initial colour value shall be 0.
In a Separation or DeviceN colour space, the initial tint value shall be 1.0 for all colorants.
In a Pattern colour space, the initial colour shall be a pattern object that causes nothing to be painted.
"
Class {
	#name : #PtSetStrokingColorSpace,
	#superclass : #PtColourOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #accessing }
PtSetStrokingColorSpace class >> documentation [
	^'Set the current colour space to use for stroking operations. The operand name shall be a name object. If the colour space is one that can be specified by a name and no additional parameters (DeviceGray, DeviceRGB, DeviceCMYK, and certain cases of Pattern), the name may be specified directly. Otherwise, it shall be a name defined in the ColorSpace subdictionary of the current resource dictionary; the associated value shall be an array describing the colour space.

The names DeviceGray, DeviceRGB, DeviceCMYK, and Pattern always identify the corresponding colour spaces directly; they never refer to resources in the ColorSpace subdictionary.

The CS operator shall also set the current stroking colour to its initial value, which depends on the colour space: In a DeviceGray, DeviceRGB, CalGray, or CalRGB colour space, the initial colour shall have all components equal to 0.0. In a DeviceCMYK colour space, the initial colour shall be [0.0 0.0 0.0 1.0]. In a Lab or ICCBased colour space, the initial colour shall have all components equal to 0.0 unless that falls outside the intervals specified by the space’s Range entry, in which case the nearest valid value shall be substituted. In an Indexed colour space, the initial colour value shall be 0. In a Separation or DeviceN colour space, the initial tint value shall be 1.0 for all colorants. In a Pattern colour space, the initial colour shall be a pattern object that causes nothing to be painted.'
]

{ #category : #accessing }
PtSetStrokingColorSpace class >> operandTypes [
	^#(#('name' #Name))
]

{ #category : #accessing }
PtSetStrokingColorSpace class >> operatorName [
	^#CS
]

{ #category : #accessing }
PtSetStrokingColorSpace class >> pdfVersion [
	^PtVersion pdf1_1
]

{ #category : #actions }
PtSetStrokingColorSpace >> modify: aProcessor with: aResource [
	| colorspace |
	colorspace := (#(#DeviceGray #DeviceRGB #DeviceCMYK #Pattern) includes: self operands first content)
		ifTrue: [self operands first asType: (PtDirectType onSymbol: #ColourSpace)]
		ifFalse: [self resourceIn: aProcessor].
	aProcessor graphicsState at: #colorSpaceStroking put: colorspace
]

{ #category : #accessing }
PtSetStrokingColorSpace >> resourceIn: aPageGraphics [
	(#(#DeviceGray #DeviceRGB #DeviceCMYK #Pattern) includes: self operands first content) ifFalse: [
		^aPageGraphics resources ColorSpace objectAt: self operands first content].
	^nil
]
