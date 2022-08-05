"
This section contains additional informations about the font (orientation, minimum and maximum acceptable size of the font, the cap height, the degree of obliqueness for italic fonts etc.).

ATTENTION: The usual constructor and initializer methods for this Value class are removed.
Pharo does not allow more than 15 arguments for a method.
Therefore, only the #fromBytes: constructor (and the corresponding #asBytes) are maintained.
"
Class {
	#name : #PtFExtTextMetrics,
	#superclass : #Value,
	#instVars : [
		'capHeight',
		'xHeight',
		'lcAscent',
		'lcDescent',
		'slant',
		'superScript',
		'subScript',
		'superScriptSize',
		'subScriptSize',
		'ulOffset',
		'ulWidth',
		'dblUpperUlOffset',
		'dblLowerUlOffset',
		'dblUpperUlWidth',
		'dblLowerUlWidth',
		'soOffset',
		'soWidth'
	],
	#category : #'PDFtalk-Fonts Type1'
}

{ #category : #'instance creation' }
PtFExtTextMetrics class >> fromBytes: aByteArray48 [
	| inst |
	inst := self new.
	inst initializeFromBytes: aByteArray48.
	^inst
]

{ #category : #specification }
PtFExtTextMetrics class >> localSpecification [
	"<constant: #etmSize class: #{Integer} comment: 'short: This field contains the size (in bytes) of the EXTTEXTMETRIC structure. The value is always 0x0034'>"
	"<constant: #pointSize class: #{Integer} comment: 'short: This field contains the nominal point size of the font in twips (this is a twentieth of a point or 1/1440 inch). This is the intended graphics art size of the font, the actual size may differ slightly depending on the resolution of the output device. In PFM files for Type-1 fonts this value should be set to 0x00f0 (240 twips or 12 pt)'>"
	"<constant: #orientation class: #{Integer} comment: 'short: This field contains the orientation of the font. This value refers to the ability of the font to be imaged on a page of a given orientation. It can be one of the following values:
    0x0000: any orientation
    0x0001: portrait (page width is smaller that its height)
    0x0002: landscape (page width is greater than its height) 
In PFM files for Type-1 fonts this field is always 0x0000 since a Type-1 font can be arbitrarily rotated'>"
	"<constant: #masterHeight class: #{Integer} comment: 'short: This field contains the font size in device units for which the values in the ExtentTable table are exact. Since Type-1 fonts are by convention defined in a box of 1000 x 1000 units, PFM files for Type-1 fonts have the value 0x03E8 (1000, the number of units per em) in this field'>"
	"<constant: #minScale class: #{Integer} comment: 'short: This field contains the minimum valid size for the font in device units. The minimum valid point size can then be calculated as follows:(etmMinScale * points-per-inch) / dfVertResThe value for »points-per-inch« is normally 72, the dfVertRes field can be found in the PFMHEADER structure, it contains the vertical resolution at which the font was digitized (this value is in dots per inch).
In PFM files for Type-1 fonts the value should be set to 0x0003'>"
	"<constant: #maxScale class: #{Integer} comment: 'short: This field contains the maximum valid size for the font in device units. The maximum valid point size can then be calculated as follows:(etmMaxScale * points-per-inch) / dfVertRes(see also above etmMinScale).
In PFM files for Type-1 fonts the value should be set to 0x03E8 (1000)'>"
	"<constant: #masterUnits class: #{Integer} comment: 'short: This field contains the integer number of units per em where an em equals etmMasterHeight in the EXTTEXTMETRIC structure. In other words, the etmMasterHeight value is expressed in font units rather than device units.
In PFM files for Type-1 fonts the value should be set to 0x03E8 (1000)'>"
	<constant: #capHeight class: #Integer comment: 'short: This field contains the height for uppercase characters in the font (the value is in font units). Typically, the character ''H'' is used for measurement purposes.
For Type-1 fonts you may find this value in the AFM file'>
	<constant: #xHeight class: #Integer comment: 'short: This field contains the height for lowercase characters in the font (the value is in font units). Typically, the character ''x'' is used for measurement purposes.
For Type-1 fonts you may find this value in the AFM file'>
	<constant: #lcAscent class: #Integer comment: 'lowerCaseAscent
short: This field contains the distance (in font units) that the ascender of lowercase letters extends above the baseline. This distance is typically specified for a lowercase character ''d''.
For Type-1 fonts you may find this value in the AFM file'>
	<constant: #lcDescent class: #Integer comment: 'lowerCaseDescent
short: This field contains the distance (in font units) that the descender of lowercase letters extends below the baseline. This distance is typically specified for a lowercase character ''p''.
For Type-1 fonts you may find this value in the AFM file'>
	<constant: #slant class: #Integer comment: 'short: This field contains the angle in tenth of degrees clockwise from the upright version of the font. The value is typically not zero only for an italic or oblique font.
For Type-1 fonts you may find this value in the AFM file (search for the entry »ItalicAngle« and multiply it by 10)'>
	<constant: #superScript class: #Integer comment: 'short: This field contains the recommended amount (in font units) to offset superscript characters from the baseline. This amount is typically specified by a negative offset'>
	<constant: #subScript class: #Integer comment: 'short: This field contains the recommended amount (in font units) to offset subscript characters from the baseline. This amount is typically specified by a positive offset'>
	<constant: #superScriptSize class: #Integer comment: 'short: This field contains the recommended size (in font units) for superscript characters in the font'>
	<constant: #subScriptSize class: #Integer comment: 'short: This field contains the recommended size (in font units) for subscript characters in the font'>
	<constant: #ulOffset class: #Integer comment: 'underlineOffset
short: This field contains the offset (in font units) downward from the baseline where the top of a single underline bar should appear.
For Type-1 fonts you may find this value in the AFM file'>
	<constant: #ulWidth class: #Integer comment: 'underlineWidth
short: This field contains the thickness (in font units) of the underline bar.
For Type-1 fonts you may find this value in the AFM file'>
	<constant: #dblUpperUlOffset class: #Integer comment: 'doubleUpperUnderlineOffset
short: This field contains the offset (in font units) downward from the baseline where the top of the upper, double underline bar should appear'>
	<constant: #dblLowerUlOffset class: #Integer comment: 'doubleLowerUnderlineOffset
short: This field contains the offset (in font units) downward from the baseline where the top of the lower, double underline bar should appear'>
	<constant: #dblUpperUlWidth class: #Integer comment: 'doubleUpperUnderlineWidth
short: This field contains the thickness (in font units) of the upper, double underline bar'>
	<constant: #dblLowerUlWidth class: #Integer comment: 'doubleLowerUnderlineWidth
short: This field contains the thickness (in font units) of the lower, double underline bar'>
	<constant: #soOffset class: #Integer comment: 'strikeOutOffset
short: This field contains the offset (in font units) upward from the baseline where the top of a strikeout bar should appear'>
	<constant: #soWidth class: #Integer comment: 'strikeOutWidth
short: This field contains the thickness (in font units) of the strikeout bar'>
	"<constant: #kernPairs class: #{Integer} comment: 'WORD: This field contains the number of kerning pairs defined in the KerningPairs table in this PFM file. The number (and therefore the table) may not be greater than 512. If the PFM file doesn''t contain a KerningPairs table the value is zero'>"
	"<constant: #kernTracks class: #{Integer} comment: 'WORD: This field contains the number of kerning tracks defined in the KerningTracks table in this PFM file. The number (and therefore the table) may not be greater than 16. If the PFM file doesn''t contain a KerningTracks table the value is zero'>"
]

{ #category : #converting }
PtFExtTextMetrics >> asBytes [
	"<ByteArray[48]>
	ByteArray suited to be written to a PFM file"

	| wst |
	wst := ByteWriteStream littleEndianOn: (ByteArray new: 48).
	wst
		nextPutShort: self etmSize;
		nextPutShort: self pointSize;
		nextPutShort: self orientation;
		nextPutShort: self masterHeight;
		nextPutShort: self minScale;
		nextPutShort: self maxScale;
		nextPutShort: self masterUnits;
		nextPutShort: self capHeight;
		nextPutShort: self xHeight;
		nextPutShort: self lcAscent;
		nextPutShort: self lcDescent;
		nextPutShort: self slant;
		nextPutShort: self superScript;
		nextPutShort: self subScript;
		nextPutShort: self superScriptSize;
		nextPutShort: self subScriptSize;
		nextPutShort: self ulOffset;
		nextPutShort: self ulWidth;
		nextPutShort: self dblUpperUlOffset;
		nextPutShort: self dblLowerUlOffset;
		nextPutShort: self dblUpperUlWidth;
		nextPutShort: self dblLowerUlWidth;
		nextPutShort: self soOffset;
		nextPutShort: self soWidth.
	^wst contents
]

{ #category : #accessing }
PtFExtTextMetrics >> capHeight [
	"<Integer>
	short: This field contains the height for uppercase characters in the font (the value is in font units). Typically, the character 'H' is used for measurement purposes.
For Type-1 fonts you may find this value in the AFM file"

	^capHeight
]

{ #category : #accessing }
PtFExtTextMetrics >> dblLowerUlOffset [
	"<Integer>
	doubleLowerUnderlineOffset
short: This field contains the offset (in font units) downward from the baseline where the top of the lower, double underline bar should appear"

	^dblLowerUlOffset
]

{ #category : #accessing }
PtFExtTextMetrics >> dblLowerUlWidth [
	"<Integer>
	doubleLowerUnderlineWidth
short: This field contains the thickness (in font units) of the lower, double underline bar"

	^dblLowerUlWidth
]

{ #category : #accessing }
PtFExtTextMetrics >> dblUpperUlOffset [
	"<Integer>
	doubleUpperUnderlineOffset
short: This field contains the offset (in font units) downward from the baseline where the top of the upper, double underline bar should appear"

	^dblUpperUlOffset
]

{ #category : #accessing }
PtFExtTextMetrics >> dblUpperUlWidth [
	"<Integer>
	doubleUpperUnderlineWidth
short: This field contains the thickness (in font units) of the upper, double underline bar"

	^dblUpperUlWidth
]

{ #category : #accessing }
PtFExtTextMetrics >> etmSize [
	"<Integer>
	short: This field contains the size (in bytes) of the EXTTEXTMETRIC structure. The value is always 0x0034"

	^52
]

{ #category : #'initialize-release' }
PtFExtTextMetrics >> initializeFromBytes: aByteArray48 [
	| rst dummy etmSize masterHeight |
	rst := ByteReadStream littleEndianOn: aByteArray48.
	dummy := self class new.
	etmSize := rst nextShort.
	etmSize = dummy etmSize ifFalse: [
		"found 0 in TeX font"
		
etmSize isZero ifFalse: [
			self error: 'etmSize is not correct']].
	rst nextShort = dummy pointSize ifFalse: [
		self error: 'pointSize is not correct'].
	rst nextShort = dummy orientation ifFalse: [
		self error: 'orientation is not correct'].
	masterHeight := rst nextShort.
	masterHeight = dummy masterHeight ifFalse: [
		"found 300 in TeX font"
		"self error: 'masterHeight is not correct' "
		
].
	rst nextShort = dummy minScale ifFalse: [
		self error: 'minScale is not correct'].
	rst nextShort = dummy maxScale ifFalse: [
		self error: 'maxScale is not correct'].
	rst nextShort = dummy masterUnits ifFalse: [
		self error: 'masterUnits is not correct'].
	capHeight := rst nextShort.
	xHeight := rst nextShort.
	lcAscent := rst nextShort.
	lcDescent := rst nextShort.
	slant := rst nextShort.
	superScript := rst nextShort.
	subScript := rst nextShort.
	superScriptSize := rst nextShort.
	subScriptSize := rst nextShort.
	ulOffset := rst nextShort.
	ulWidth := rst nextShort.
	dblUpperUlOffset := rst nextShort.
	dblLowerUlOffset := rst nextShort.
	dblUpperUlWidth := rst nextShort.
	dblLowerUlWidth := rst nextShort.
	soOffset := rst nextShort.
	soWidth := rst nextShort
]

{ #category : #accessing }
PtFExtTextMetrics >> lcAscent [
	"<Integer>
	lowerCaseAscent
short: This field contains the distance (in font units) that the ascender of lowercase letters extends above the baseline. This distance is typically specified for a lowercase character 'd'.
For Type-1 fonts you may find this value in the AFM file"

	^lcAscent
]

{ #category : #accessing }
PtFExtTextMetrics >> lcDescent [
	"<Integer>
	lowerCaseDescent
short: This field contains the distance (in font units) that the descender of lowercase letters extends below the baseline. This distance is typically specified for a lowercase character 'p'.
For Type-1 fonts you may find this value in the AFM file"

	^lcDescent
]

{ #category : #accessing }
PtFExtTextMetrics >> masterHeight [
	"<Integer>
	short: This field contains the font size in device units for which the values in the ExtentTable table are exact. Since Type-1 fonts are by convention defined in a box of 1000 x 1000 units, PFM files for Type-1 fonts have the value 0x03E8 (1000, the number of units per em) in this field"

	^1000
]

{ #category : #accessing }
PtFExtTextMetrics >> masterUnits [
	"<Integer>
	short: This field contains the integer number of units per em where an em equals etmMasterHeight in the EXTTEXTMETRIC structure. In other words, the etmMasterHeight value is expressed in font units rather than device units.
In PFM files for Type-1 fonts the value should be set to 0x03E8 (1000)"

	^1000
]

{ #category : #accessing }
PtFExtTextMetrics >> maxScale [
	"<Integer>
	short: This field contains the maximum valid size for the font in device units. The maximum valid point size can then be calculated as follows:(etmMaxScale * points-per-inch) / dfVertRes(see also above etmMinScale).
In PFM files for Type-1 fonts the value should be set to 0x03E8 (1000)"

	^1000
]

{ #category : #accessing }
PtFExtTextMetrics >> minScale [
	"<Integer>
	short: This field contains the minimum valid size for the font in device units. The minimum valid point size can then be calculated as follows:(etmMinScale * points-per-inch) / dfVertResThe value for »points-per-inch« is normally 72, the dfVertRes field can be found in the PFMHEADER structure, it contains the vertical resolution at which the font was digitized (this value is in dots per inch).
In PFM files for Type-1 fonts the value should be set to 0x0003"

	^3
]

{ #category : #accessing }
PtFExtTextMetrics >> orientation [
	"<Integer>
	short: This field contains the orientation of the font. This value refers to the ability of the font to be imaged on a page of a given orientation. It can be one of the following values:
		0x0000: any orientation
		0x0001: portrait (page width is smaller that its height)
		0x0002: landscape (page width is greater than its height) 
	In PFM files for Type-1 fonts this field is always 0x0000 since a Type-1 font can be arbitrarily rotated"

	^0
]

{ #category : #accessing }
PtFExtTextMetrics >> pointSize [
	"<Integer>
	short: This field contains the nominal point size of the font in twips (this is a twentieth of a point or 1/1440 inch). This is the intended graphics art size of the font, the actual size may differ slightly depending on the resolution of the output device. In PFM files for Type-1 fonts this value should be set to 0x00f0 (240 twips or 12 pt)"

	^240
]

{ #category : #printing }
PtFExtTextMetrics >> printvalueWith: printer [
	| args |
	args := OrderedCollection new.
	args add: (printer constant: 'fromBytes' value: self asBytes).
	^printer printvalue: self arguments: args
]

{ #category : #accessing }
PtFExtTextMetrics >> slant [
	"<Integer>
	short: This field contains the angle in tenth of degrees clockwise from the upright version of the font. The value is typically not zero only for an italic or oblique font.
For Type-1 fonts you may find this value in the AFM file (search for the entry »ItalicAngle« and multiply it by 10)"

	^slant
]

{ #category : #accessing }
PtFExtTextMetrics >> soOffset [
	"<Integer>
	strikeOutOffset
short: This field contains the offset (in font units) upward from the baseline where the top of a strikeout bar should appear"

	^soOffset
]

{ #category : #accessing }
PtFExtTextMetrics >> soWidth [
	"<Integer>
	strikeOutWidth
short: This field contains the thickness (in font units) of the strikeout bar"

	^soWidth
]

{ #category : #accessing }
PtFExtTextMetrics >> subScript [
	"<Integer>
	short: This field contains the recommended amount (in font units) to offset subscript characters from the baseline. This amount is typically specified by a positive offset"

	^subScript
]

{ #category : #accessing }
PtFExtTextMetrics >> subScriptSize [
	"<Integer>
	short: This field contains the recommended size (in font units) for subscript characters in the font"

	^subScriptSize
]

{ #category : #accessing }
PtFExtTextMetrics >> superScript [
	"<Integer>
	short: This field contains the recommended amount (in font units) to offset superscript characters from the baseline. This amount is typically specified by a negative offset"

	^superScript
]

{ #category : #accessing }
PtFExtTextMetrics >> superScriptSize [
	"<Integer>
	short: This field contains the recommended size (in font units) for superscript characters in the font"

	^superScriptSize
]

{ #category : #accessing }
PtFExtTextMetrics >> ulOffset [
	"<Integer>
	underlineOffset
short: This field contains the offset (in font units) downward from the baseline where the top of a single underline bar should appear.
For Type-1 fonts you may find this value in the AFM file"

	^ulOffset
]

{ #category : #accessing }
PtFExtTextMetrics >> ulWidth [
	"<Integer>
	underlineWidth
short: This field contains the thickness (in font units) of the underline bar.
For Type-1 fonts you may find this value in the AFM file"

	^ulWidth
]

{ #category : #accessing }
PtFExtTextMetrics >> xHeight [
	"<Integer>
	short: This field contains the height for lowercase characters in the font (the value is in font units). Typically, the character 'x' is used for measurement purposes.
For Type-1 fonts you may find this value in the AFM file"

	^xHeight
]
