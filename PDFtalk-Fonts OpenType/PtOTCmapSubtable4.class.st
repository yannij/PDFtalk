"
Format 4: Segment mapping to delta values

This is the Microsoft standard character to glyph index mapping table for fonts that support Unicode ranges other than the range [U+D800 - U+DFFF] (defined as Surrogates Area, in Unicode v 3.0) which is used for UCS-4 characters. If a font supports this character range (i.e. in turn supports the UCS-4 characters) a subtable in this format with a platform specific encoding ID 1 is yet needed, in addition to a subtable in format 12 with a platform specific encoding ID 10. Please see details on format 12 below, for fonts that support UCS-4 characters on Windows.

This format is used when the character codes for the characters represented by a font fall into several contiguous ranges, possibly with holes in some or all of the ranges (that is, some of the codes in a range may not have a representation in the font). The format-dependent data is divided into three parts, which must occur in the following order:

   1. A four-word header gives parameters for an optimized search of the segment list;
   2. Four parallel arrays describe the segments (one segment for each contiguous range of codes);
   3. A variable-length array of glyph IDs (unsigned words).

(see http://www.microsoft.com/typography/otspec/cmap.htm for specifications)
"
Class {
	#name : #PtOTCmapSubtable4,
	#superclass : #PtOTCmapLanguageSubtable,
	#instVars : [
		'segments',
		'glyphIdArray',
		'indexToCode'
	],
	#category : #'PDFtalk-Fonts OpenType'
}

{ #category : #accessing }
PtOTCmapSubtable4 class >> formatNumber [
	^4
]

{ #category : #specification }
PtOTCmapSubtable4 class >> localSpecification [
	<sequence: #segments comment: 'code ranges'>
	<sequence: #glyphIdArray comment: 'Glyph index array'>
	<map: #indexToCode comment: 'Cache for the index to code mapping'>
]

{ #category : #'instance creation optional' }
PtOTCmapSubtable4 class >> platform: platformInteger encoding: encodingInteger contents: contentsByteArray language: languageInteger [
	| inst |
	inst := self new.
	inst
		initializePlatform: platformInteger
		encoding: encodingInteger
		contents: contentsByteArray
		language: languageInteger
		segments: nil
		glyphIdArray: nil
		indexToCode: nil.
	^inst
]

{ #category : #'instance creation optional' }
PtOTCmapSubtable4 class >> platform: platformInteger encoding: encodingInteger contents: contentsByteArray language: languageInteger glyphIdArray: glyphIdArrayArray [
	| inst |
	inst := self new.
	inst
		initializePlatform: platformInteger
		encoding: encodingInteger
		contents: contentsByteArray
		language: languageInteger
		segments: nil
		glyphIdArray: glyphIdArrayArray
		indexToCode: nil.
	^inst
]

{ #category : #'instance creation optional' }
PtOTCmapSubtable4 class >> platform: platformInteger encoding: encodingInteger contents: contentsByteArray language: languageInteger glyphIdArray: glyphIdArrayArray indexToCode: indexToCodeDictionary [
	| inst |
	inst := self new.
	inst
		initializePlatform: platformInteger
		encoding: encodingInteger
		contents: contentsByteArray
		language: languageInteger
		segments: nil
		glyphIdArray: glyphIdArrayArray
		indexToCode: indexToCodeDictionary.
	^inst
]

{ #category : #'instance creation optional' }
PtOTCmapSubtable4 class >> platform: platformInteger encoding: encodingInteger contents: contentsByteArray language: languageInteger indexToCode: indexToCodeDictionary [
	| inst |
	inst := self new.
	inst
		initializePlatform: platformInteger
		encoding: encodingInteger
		contents: contentsByteArray
		language: languageInteger
		segments: nil
		glyphIdArray: nil
		indexToCode: indexToCodeDictionary.
	^inst
]

{ #category : #'instance creation optional' }
PtOTCmapSubtable4 class >> platform: platformInteger encoding: encodingInteger contents: contentsByteArray language: languageInteger segments: segmentsArray [
	| inst |
	inst := self new.
	inst
		initializePlatform: platformInteger
		encoding: encodingInteger
		contents: contentsByteArray
		language: languageInteger
		segments: segmentsArray
		glyphIdArray: nil
		indexToCode: nil.
	^inst
]

{ #category : #'instance creation optional' }
PtOTCmapSubtable4 class >> platform: platformInteger encoding: encodingInteger contents: contentsByteArray language: languageInteger segments: segmentsArray glyphIdArray: glyphIdArrayArray [
	| inst |
	inst := self new.
	inst
		initializePlatform: platformInteger
		encoding: encodingInteger
		contents: contentsByteArray
		language: languageInteger
		segments: segmentsArray
		glyphIdArray: glyphIdArrayArray
		indexToCode: nil.
	^inst
]

{ #category : #'instance creation' }
PtOTCmapSubtable4 class >> platform: platformInteger encoding: encodingInteger contents: contentsByteArray language: languageInteger segments: segmentsArray glyphIdArray: glyphIdArrayArray indexToCode: indexToCodeDictionary [
	| inst |
	inst := self new.
	inst
		initializePlatform: platformInteger
		encoding: encodingInteger
		contents: contentsByteArray
		language: languageInteger
		segments: segmentsArray
		glyphIdArray: glyphIdArrayArray
		indexToCode: indexToCodeDictionary.
	^inst
]

{ #category : #'instance creation optional' }
PtOTCmapSubtable4 class >> platform: platformInteger encoding: encodingInteger contents: contentsByteArray language: languageInteger segments: segmentsArray indexToCode: indexToCodeDictionary [
	| inst |
	inst := self new.
	inst
		initializePlatform: platformInteger
		encoding: encodingInteger
		contents: contentsByteArray
		language: languageInteger
		segments: segmentsArray
		glyphIdArray: nil
		indexToCode: indexToCodeDictionary.
	^inst
]

{ #category : #accessing }
PtOTCmapSubtable4 >> glyphIdArray [
	"<Array>
	Glyph index array"

	^glyphIdArray ifNil: [#()]
]

{ #category : #accessing }
PtOTCmapSubtable4 >> glyphIndexAtUnicode: aUnicodeInteger [
	| segment |
	aUnicodeInteger = Character illegalCode ifTrue: [
		^nil].
	segment := self segments detect: [:seg | seg endCode >= aUnicodeInteger].
	^segment glyphIndexAtCode: aUnicodeInteger glyphs: self glyphIdArray
]

{ #category : #accessing }
PtOTCmapSubtable4 >> indexToCode [
	"<Dictionary>
	Cache for the index to code mapping"

	^indexToCode ifNil: [Dictionary new beImmutable]
]

{ #category : #'initialize-release' }
PtOTCmapSubtable4 >> initializePlatform: platformInteger encoding: encodingInteger contents: contentsByteArray language: languageInteger segments: segmentsArray glyphIdArray: glyphIdArrayArray indexToCode: indexToCodeDictionary [
	platform := platformInteger.
	encoding := encodingInteger.
	contents := contentsByteArray.
	language := languageInteger.
	(segmentsArray notNil and: [
	segmentsArray notEmpty]) ifTrue: [
			segments := (Array withAll: segmentsArray) beImmutable].
	(glyphIdArrayArray notNil and: [
	glyphIdArrayArray notEmpty]) ifTrue: [
			glyphIdArray := (Array withAll: glyphIdArrayArray) beImmutable].
	(indexToCodeDictionary notNil and: [
	indexToCodeDictionary notEmpty]) ifTrue: [
			indexToCode := (Valuemap withAll: indexToCodeDictionary) beImmutable].
	self beImmutable
]

{ #category : #marshaling }
PtOTCmapSubtable4 >> passInstVars [
	"for OpenTalk StSt"

	^#(#default #default #default #default #default #default)
]

{ #category : #printing }
PtOTCmapSubtable4 >> printvalueWith: printer [
	| args |
	args := OrderedCollection new.
	args add: (printer constant: 'platform' value: self platform).
	args add: (printer constant: 'encoding' value: self encoding).
	args add: (printer constant: 'contents' value: self contents).
	args add: (printer constant: 'language' value: self language).
	args add: (printer array: 'segments' value: self segments).
	args add: (printer array: 'glyphIdArray' value: self glyphIdArray).
	args add: (printer dictionary: 'indexToCode' value: self indexToCode).
	^printer printvalue: self arguments: args
]

{ #category : #reading }
PtOTCmapSubtable4 >> readFrom: bytes at: offset [
	"Type  	Name  						Description
USHORT  	format  						Format number is set to 4.
USHORT 	length 						This is the length in bytes of the subtable.
USHORT 	language 					Please see “Note on the language field in 'cmap' subtables“ in this document.
USHORT 	segCountX2 				2 x segCount.
USHORT 	searchRange 				2 x (2**floor(log2(segCount)))
USHORT 	entrySelector 				log2(searchRange/2)
USHORT 	rangeShift 					2 x segCount - searchRange
USHORT 	endCount[segCount] 		End characterCode for each segment, last=0xFFFF.
USHORT 	reservedPad 				Set to 0.
USHORT 	startCount[segCount] 		Start character code for each segment.
SHORT 	idDelta[segCount] 			Delta for all character codes in segment.
USHORT 	idRangeOffset[segCount] 	Offsets into glyphIdArray or 0
USHORT 	glyphIdArray[ ] 				Glyph index array (arbitrary length)"

	| subtable uBytes segCountX2 segCount o endCodes startCodes deltas glyphIndexes segs uGlyphs glyphs glyphIdOffset offsetx codeMapping |
	subtable := super readFrom: bytes at: offset.
	uBytes := ByteReadStream bigEndianOn: subtable contents.
	segCountX2 := uBytes unsignedShortAt: 7.
	segCount := segCountX2 / 2.
	o := 14 + 1.
	endCodes := (0 to: segCount - 1) collect: [:i | uBytes unsignedShortAt: i * 2 + o].
	o := segCountX2 + o + 2.
	startCodes := (0 to: segCount - 1) collect: [:i | uBytes unsignedShortAt: i * 2 + o].
	o := segCountX2 + o.
	deltas := (0 to: segCount - 1) collect: [:i | uBytes shortAt: i * 2 + o].
	o := segCountX2 + o.
	glyphIdOffset := segCountX2 + o.
	glyphIndexes := (0 to: segCount - 1) collect: [:i |
		| rangeOffset |
		offsetx := i * 2 + o.
		rangeOffset := uBytes unsignedShortAt: offsetx.
		rangeOffset isZero
			ifTrue: [nil]
			ifFalse: [
			(offsetx + rangeOffset - glyphIdOffset) / 2]].
	segs := (1 to: segCount) collect: [:i |
		(glyphIndexes at: i)
			ifNil: [
			PtOTSegment startCode: (startCodes at: i) endCode: (endCodes at: i) delta: (deltas at: i)]
			ifNotNil: [:glyphIndex |
			PtOTIndexedSegment
				startCode: (startCodes at: i)
				endCode: (endCodes at: i)
				delta: (deltas at: i)
				glyphIdArrayIndex: glyphIndex]].
	uGlyphs := ByteReadStream bigEndianOn: (subtable contents copyFrom: segCountX2 + o to: subtable contents size).
	glyphs := (0 to: uGlyphs size / 2 - 1) collect: [:i |
		uGlyphs unsignedShortAt: i * 2 + 1].
	codeMapping := Valuemap new: glyphs size.
	segs do: [:segment |
		segment characterCodes do: [:code |
			(segment glyphIndexAtCode: code glyphs: glyphs) ifNotNil: [:index |
				codeMapping at: index put: code]]].
	^self class
		platform: subtable platform
		encoding: subtable encoding
		contents: subtable contents
		language: subtable language
		segments: segs
		glyphIdArray: glyphs
		indexToCode: codeMapping
]

{ #category : #accessing }
PtOTCmapSubtable4 >> segments [
	"<Array>
	code ranges"

	^segments ifNil: [#()]
]
