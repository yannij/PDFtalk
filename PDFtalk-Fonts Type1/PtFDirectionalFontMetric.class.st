"
DirectionalFontMetric defines metric data specific for a text direction.

Instance Variables:
	underlinePosition	<Number>	description of underlinePosition
	underlineThickness	<Number>	description of underlineThickness
	italicAngle			<Number>	description of italicAngle
	charWidth			<Point>		description of charWidth
	isFixedPitch		<Boolean>	description of isFixedPitch
"
Class {
	#name : #PtFDirectionalFontMetric,
	#superclass : #Object,
	#instVars : [
		'underlinePosition',
		'underlineThickness',
		'italicAngle',
		'charWidth',
		'isFixedPitch'
	],
	#category : #'PDFtalk-Fonts Type1'
}

{ #category : #attributes }
PtFDirectionalFontMetric >> charWidth [
	"<Point x: Number y: Number>"
	"(Optional.) The x and y components of the width vector of this font program’s characters. If present, it means that all characters in this font program have the same CharWidth for this writing direction, and implies IsFixedPitch is true."

	^charWidth
]

{ #category : #private }
PtFDirectionalFontMetric >> charWidth: aString [
	| numbers |
	numbers := (aString substrings: (String with: Character space)) collect: #asNumber.
	charWidth := numbers first @ numbers last
]

{ #category : #attributes }
PtFDirectionalFontMetric >> isFixedPitch [
	"<Boolean>"
	"(Optional.) If boolean is true, this indicates that the font program is a fixed pitch (monospaced) font. A value of false indicates a proportionally spaced font. If this keyword is present, its value must not conflict with CharWidth; if absent, its value is assumed to be true if CharWidth is present and false if Charwidth is absent."

	^isFixedPitch ifNil: [charWidth notNil]
]

{ #category : #private }
PtFDirectionalFontMetric >> isFixedPitch: aString [
	isFixedPitch := aString = 'true'
]

{ #category : #attributes }
PtFDirectionalFontMetric >> italicAngle [
	"<Number>"
	"(Optional.) Angle (in degrees counter-clockwise from the vertical) of the dominant vertical strokes of the font. For non-italic fonts, this angle will be zero.
Example: –12."

	^italicAngle ifNil: [0]
]

{ #category : #private }
PtFDirectionalFontMetric >> italicAngle: aString [
	italicAngle := aString asNumber
]

{ #category : #attributes }
PtFDirectionalFontMetric >> underlinePosition [
	"<Number>"
	"(Optional.) Distance from the baseline for centering underlining strokes. This can be interpreted as a y-displacement for writing direction 0, and an xdisplacement for writing direction 1."

	^underlinePosition
]

{ #category : #private }
PtFDirectionalFontMetric >> underlinePosition: aString [
	underlinePosition := aString asNumber
]

{ #category : #attributes }
PtFDirectionalFontMetric >> underlineThickness [
	"<Number>"
	"(Optional.) This is the stroke width for underlining, and is generally proportional to the stroke widths of characters in the font program."

	^underlineThickness
]

{ #category : #private }
PtFDirectionalFontMetric >> underlineThickness: aString [
	underlineThickness := aString asNumber
]
