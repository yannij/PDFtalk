"
PDF Image Dictionaries as defined in PDF 32000_2008.pdf, section 11.6.5.2, pp. 346.

The most common way of defining a soft mask is with a soft-mask dictionary specified as the current soft mask in the graphics state.

The mask values shall be derived from those of a transparency group, using one of the two methods described in ""Deriving a Soft Mask from Group Alpha,"" and ""Deriving a Soft Mask from Group Luminosity.""
The group shall be defined by a transparency group XObject designated by the G entry in the soft-mask dictionary.
The S (subtype) entry shall specify which of the two derivation methods to use:
	- If the subtype is Alpha, the transparency group XObject G shall be evaluated to compute a group alpha only.
The colours of the constituent objects shall be ignored and the colour compositing computations shall not be performed.
The transfer function TR shall then be applied to the computed group alpha to produce the mask values.
Outside the bounding box of the transparency group, the mask value shall be the result of applying the transfer function to the input value 0.0.
	- If the subtype is Luminosity, the transparency group XObject G shall be composited with a fully opaque backdrop whose colour is everywhere defined by the soft-mask dictionary’s BC entry.
The computed result colour shall then be converted to a single-component luminosity value, and the transfer function TR shall be applied to this luminosity to produce the mask values. 
Outside the transparency group’s bounding box, the mask value shall be derived by transforming the BC colour to luminosity and applying the transfer function to the result.

The mask’s coordinate system shall be defined by concatenating the transformation matrix specified by the Matrix entry in the transparency group’s form dictionary with the current transformation matrix at the moment the soft mask is established in the graphics state with the gs operator.

In a transparency group XObject that defines a soft mask, spot colour components shall never be available, even if they are available in the group or page on which the soft mask is used.
If the group XObject’s content stream specifies a Separation or DeviceN colour space that uses spot colour components, the alternate colour space shall be substituted

"
Class {
	#name : #PtSoftMask,
	#superclass : #PDFDictionary,
	#category : #'PDFtalk-XObjects'
}

{ #category : #accessing }
PtSoftMask class >> pdfTypeDefinition [

	^PDFTypeDefinition
		name: #SoftMask
		supertype: #Dictionary
		section: '11.6.5.2'
		documentation: 'The most common way of defining a soft mask is with a soft-mask dictionary specified as the current soft mask in the graphics state.

The mask values shall be derived from those of a transparency group, using one of the two methods described in "Deriving a Soft Mask from Group Alpha," and "Deriving a Soft Mask from Group Luminosity."
The group shall be defined by a transparency group XObject designated by the G entry in the soft-mask dictionary.
The S (subtype) entry shall specify which of the two derivation methods to use:
	- If the subtype is Alpha, the transparency group XObject G shall be evaluated to compute a group alpha only.
The colours of the constituent objects shall be ignored and the colour compositing computations shall not be performed.
The transfer function TR shall then be applied to the computed group alpha to produce the mask values.
Outside the bounding box of the transparency group, the mask value shall be the result of applying the transfer function to the input value 0.0.
	- If the subtype is Luminosity, the transparency group XObject G shall be composited with a fully opaque backdrop whose colour is everywhere defined by the soft-mask dictionary’s BC entry.
The computed result colour shall then be converted to a single-component luminosity value, and the transfer function TR shall be applied to this luminosity to produce the mask values. 
Outside the transparency group’s bounding box, the mask value shall be derived by transforming the BC colour to luminosity and applying the transfer function to the result.

The mask’s coordinate system shall be defined by concatenating the transformation matrix specified by the Matrix entry in the transparency group’s form dictionary with the current transformation matrix at the moment the soft mask is established in the graphics state with the gs operator.

In a transparency group XObject that defines a soft mask, spot colour components shall never be available, even if they are available in the group or page on which the soft mask is used.
If the group XObject’s content stream specifies a Separation or DeviceN colour space that uses spot colour components, the alternate colour space shall be substituted'
]

{ #category : #'accessing entries' }
PtSoftMask >> BC [
	<typeArrayOf: #Number>
	<attribute: 4 documentation: 'An array of component values specifying the colour to be used as the backdrop against which to composite the transparency group XObject G.
This entry shall be consulted only if the subtype S is Luminosity.
The array shall consist of n numbers, where n is the number of components in the colour space specified by the CS entry in the group attributes dictionary. Default value: the colour space’s initial value, representing black'>
	^self objectAt: #BC ifAbsent: [self G Group CS initialColourValues]
]

{ #category : #'accessing entries' }
PtSoftMask >> G [
	<type: #TransparencyGroup>
	<required>
	<attribute: 3 documentation: 'A transparency group XObject to be used as the source of alpha or colour values for deriving the mask.
If the subtype S is Luminosity, the group attributes dictionary shall contain a CS entry defining the colour space in which the compositing computation is to be performed'>
	^self objectAt: #G
]

{ #category : #'accessing entries' }
PtSoftMask >> S [
	<type: #Name>
	<required>
	<attribute: 2 documentation: 'A subtype specifying the method to be used in deriving the mask values from the transparency group specified by the G entry:
	Alpha		The group’s computed alpha shall be used, disregarding its colour
	Luminosity	The group’s computed colour shall be converted to a single-component luminosity value'>
	^self objectAt: #S
]

{ #category : #'accessing entries' }
PtSoftMask >> TR [
	<type: #Function>
	<typeName: #Identity>
	<attribute: 5 documentation: 'A function object specifying the transfer function to be used in deriving the mask values.
The function shall accept one input, the computed group alpha or luminosity (depending on the value of the subtype S), and shall return one output, the resulting mask value.
The input shall be in the range 0.0 to 1.0.
The computed output shall be in the range 0.0 to 1.0; if it falls outside this range, it shall be forced to the nearest valid value.
The name Identity may be specified in place of a function object to designate the identity function'>
	^self objectAt: #TR ifAbsent: [#Identity asPDF]
]

{ #category : #'accessing entries' }
PtSoftMask >> Type [
	<type: #Name>
	<attribute: 1 documentation: 'The type of PDF object that this dictionary describes.'>
	^self objectAt: #Type ifAbsent: [#Mask asPDF]
]
