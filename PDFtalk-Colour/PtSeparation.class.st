"
PDF Separation Colour Spaces as defined in PDF 32000_2008.pdf, section 8.6.6.4, pp. 157.

A Separation colour space (PDF 1.2) provides a means for specifying the use of additional colorants or 
for isolating the control of individual colour components of a device colour space for a subtractive device. 
When such a space is the current colour space, the current colour shall be a single-component value, 
called a tint, that controls the application of the given colorant or colour components only.
"
Class {
	#name : #PtSeparation,
	#superclass : #PtSpecialColourSpace,
	#category : #'PDFtalk-Colour'
}

{ #category : #accessing }
PtSeparation class >> numberOfAttributes [
	^4
]

{ #category : #accessing }
PtSeparation class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #Separation
		supertype: #ColourSpace
		version: #(1 2)
		section: '8.6.6.4'
		documentation: 'A Separation colour space provides a means for specifying the use of additional colorants or 
for isolating the control of individual colour components of a device colour space for a subtractive device. 
When such a space is the current colour space, the current colour shall be a single-component value, 
called a tint, that controls the application of the given colorant or colour components only.'
]

{ #category : #'accessing entries' }
PtSeparation >> alternateSpace [
	<type: #DeviceColourSpace>
	<type: #CIEColourSpace>
	<required>
	<attribute: 3 documentation: 'The alternateSpace parameter shall be an array or name object that identifies the alternate colour space, which may be any device or CIE-based colour space but may not be another special colour space (Pattern, Indexed, Separation, or DeviceN)'>
	^self objectAt: 3
]

{ #category : #accessing }
PtSeparation >> alternativeDeviceColorspace [
	^self alternateSpace alternativeDeviceColorspace
]

{ #category : #accessing }
PtSeparation >> defaultDecodeArray [
	^#(0.0 1.0) asPDF
]

{ #category : #accessing }
PtSeparation >> initialColourValues [
	^#(0.0)
]

{ #category : #accessing }
PtSeparation >> numberOfComponents [
	^1
]

{ #category : #'accessing entries' }
PtSeparation >> tintName [
	<type: #Name>
	<required>
	<attribute: 2 documentation: 'The name parameter is a name object that shall specify the name of the colorant that this Separation colour space is intended to represent (or one of the special names All or None).
Such colorant names are arbitrary, and there may be any number of them, subject to implementation limits.'>
	^self objectAt: 2
]

{ #category : #'accessing entries' }
PtSeparation >> tintTransform [
	<type: #Function>
	<required>
	<attribute: 4 documentation: 'The tintTransform parameter shall be a function.
During subsequent painting operations, a conforming reader calls this function to transform a tint value into colour component values in the alternate colour space.
The function shall be called with the tint value and shall return the corresponding colour component values.
That is, the number of components and the interpretation of their values shall depend on the alternate colour space'>
	^self objectAt: 4
]
