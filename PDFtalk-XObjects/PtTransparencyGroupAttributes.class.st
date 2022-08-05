"
PDF transparency group attributes as defined in PDF 32000_2008.pdf pp. 349.

A transparency group is represented in PDF as a special type of group XObject called a transparency group XObject. A group XObject is in turn a type of form XObject, distinguished by the presence of a Group entry in its form dictionary. The value of this entry is a subsidiary group attributes dictionary defining the properties of the group. The format and meaning of the dictionary’s contents shall be determined by its group subtype, which is specified by the dictionary’s S entry.
A page object may also have a Group entry, whose value is a group attributes dictionary specifying the attributes of the page group. Some of the dictionary entries are interpreted slightly differently for a page group than for a transparency group XObject; see their descriptions in the table for details.
"
Class {
	#name : #PtTransparencyGroupAttributes,
	#superclass : #PtGroupAttributes,
	#category : #'PDFtalk-XObjects'
}

{ #category : #'instance creation' }
PtTransparencyGroupAttributes class >> empty [
	| inst |
	inst := self new.
	inst at: #S put: #Transparency.
	^inst
]

{ #category : #testing }
PtTransparencyGroupAttributes class >> isClassForDictionary: aDictionary [
	^(aDictionary hasKey: #S) and: [
	(aDictionary at: #S) asPDF = #Transparency asPDF]
]

{ #category : #accessing }
PtTransparencyGroupAttributes class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #TransparencyGroupAttributes
		supertype: #GroupAttributes
		version: #(1 4)
		section: '11.6.6'
		documentation: 'A transparency group is represented in PDF as a special type of group XObject called a transparency group XObject. A group XObject is in turn a type of form XObject, distinguished by the presence of a Group entry in its form dictionary. The value of this entry is a subsidiary group attributes dictionary defining the properties of the group. The format and meaning of the dictionary’s contents shall be determined by its group subtype, which is specified by the dictionary’s S entry.
A page object may also have a Group entry, whose value is a group attributes dictionary specifying the attributes of the page group. Some of the dictionary entries are interpreted slightly differently for a page group than for a transparency group XObject; see their descriptions in the table for details.'
]

{ #category : #'accessing entries' }
PtTransparencyGroupAttributes >> CS [
	<type: #ColourSpace>
	<attribute: 2 documentation: '(Sometimes required) The group colour space, which is used for the following purposes:
• As the colour space into which colours shall be converted when painted into the group
• As the blending colour space in which objects shall be composited within the group
• As the colour space of the group as a whole when it in turn is painted as an object onto its backdrop

The group colour space shall be any device or CIE-based colour space that treats its components as independent additive or subtractive values in the range 0.0 to 1.0, subject to the restrictions. These restrictions exclude Lab and lightness-chromaticity ICCBased colour spaces, as well as the special colour spaces Pattern, Indexed, Separation, and DeviceN. Device colour spaces shall be subject to remapping according to the DefaultGray, DefaultRGB, and DefaultCMYK entries in the ColorSpace subdictionary of the current resource dictionary.
Ordinarily, the CS entry may be present only for isolated transparency groups (those for which I is true), and even then it is optional. However, this entry shall be present in the group attributes dictionary for any transparency group XObject that has no parent group or page from which to inherit—in particular, one that is the value of the G entry in a soft-mask dictionary of subtype Luminosity.

Additionally, the CS entry may be present in the group attributes dictionary associated with a page object, even if I is false or absent. In the normal case in which the page is imposed directly on the output medium, the page group is effectively isolated regardless of the I value, and the specified CS value shall therefore be honoured. But if the page is in turn used as an element of some other page and if the group is non-isolated, CS shall be ignored and the colour space shall be inherited from the actual backdrop with which the page is composited.
Default value: the colour space of the parent group or page into which this transparency group is painted. (The parent’s colour space in turn may be either explicitly specified or inherited.)
For a transparency group XObject used as an annotation appearance, the default colour space shall be inherited from the page on which the annotation appears.'>
	^self objectAt: #CS
]

{ #category : #'accessing entries' }
PtTransparencyGroupAttributes >> I [
	<type: #Boolean>
	<attribute: 3 documentation: 'A flag specifying whether the transparency group is isolated. If this flag is true, objects within the group shall be composited against a fully transparent initial backdrop; if false, they shall be composited against the group’s backdrop.
In the group attributes dictionary for a page, the interpretation of this entry shall be slightly altered. In the normal case in which the page is imposed directly on the output medium, the page group is effectively isolated and the specified I value shall be ignored. But if the page is in turn used as an element of some other page, it shall be treated as if it were a transparency group XObject; the I value shall be interpreted in the normal way to determine whether the page group is isolated.'>
	^self objectAt: #I ifAbsent: [false]
]

{ #category : #'accessing entries' }
PtTransparencyGroupAttributes >> K [
	<type: #Boolean>
	<attribute: 4 documentation: 'A flag specifying whether the transparency group is a knockout group. If this flag is false, later objects within the group shall be composited with earlier ones with which they overlap; if true, they shall be composited with the group’s initial backdrop and shall overwrite (“knock out”) any earlier overlapping objects.'>
	^self objectAt: #K ifAbsent: [false]
]
