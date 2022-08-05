"
The representation of a CIDFont is designed to be separable from its encoding. In keeping with this strategy, the CFF representation does not include any encoding information which instead resides in a CMap file. If a need arises for a more compact representation of the CMap file, CFF can be extended to accommodate it.

A CFF CIDFont has the CIDFontName in the Name INDEX and a corresponding Top DICT. The Top DICT begins with ROS operator which specifies the Registry-Ordering-Supplement for the font. This will indicate to a CFF parser that special CID processing should be applied to this font. Specifically:

• The FDArray operator is expected to be present, with a single argument specifying an offset to the Font DICT INDEX. Each Font DICT in this array specifies information unique to a particular group of glyphs in the font. The mapping of glyphs to Font DICTs is specified by the FDSelect structure described below. Each Font DICT will specify a corresponding Private DICT with the Private DICT operator.

• The charset data, although in the same format as non-CIDFonts, will represent CIDs rather than SIDs, i.e. charstrings are “named” by CIDs in a CIDFont. In a complete CIDFont the charset table will specify an identity mapping (where GID equals CID for all glyphs) as a single range beginning at CID 1 (CID 0, the .notdef glyph, is omitted) that covers all the glyphs in the font. Subset CIDFonts will generally need to use a more complex charset table representing a non-identity mapping (where CID doesn’t equal GID).

• The Top DICT will include an FDSelect operator specifying an offset to a charset-like data structure (see next section) which contains a, possibly range-encoded, list of indexes, from which a single index may be derived for each glyph. The index identifies the Font DICT, and therefore the Private DICT, to be used when rasterizing a glyph.

• The encoding data is omitted (see above); no Encoding operator will be present and the default StandardEncoding should not be applied.

There are no predefined charsets for CID fonts.
"
Class {
	#name : #CFFCIDFont,
	#superclass : #CFFFont,
	#instVars : [
		'fontDicts',
		'fdSelect'
	],
	#category : #'PDFtalk-Fonts CompactFontFormat'
}

{ #category : #'instance creation' }
CFFCIDFont class >> name: nameString topDict: topDictTopDict encoding: encodingEncoding charset: charsetCharset privateDict: privateDictPrivateDict charStrings: charStringsArray strings: stringsArray localSubr: localSubrArray globalSubr: globalSubrArray fontDicts: fontDictsArray fdSelect: fdSelectValue [
	| inst |
	inst := self new.
	inst
		initializeName: nameString
		topDict: topDictTopDict
		encoding: encodingEncoding
		charset: charsetCharset
		privateDict: privateDictPrivateDict
		charStrings: charStringsArray
		strings: stringsArray
		localSubr: localSubrArray
		globalSubr: globalSubrArray
		fontDicts: fontDictsArray
		fdSelect: fdSelectValue.
	^inst
]

{ #category : #accessing }
CFFCIDFont >> fdSelect [
	"<Value>
	Glyph-Font mapping. Not implemented."

	^fdSelect
]

{ #category : #accessing }
CFFCIDFont >> fontDicts [
	"<Array>"

	^fontDicts ifNil: [#()]
]

{ #category : #'initialize-release' }
CFFCIDFont >> initializeName: nameString topDict: topDictTopDict encoding: encodingEncoding charset: charsetCharset privateDict: privateDictPrivateDict charStrings: charStringsArray strings: stringsArray localSubr: localSubrArray globalSubr: globalSubrArray fontDicts: fontDictsArray fdSelect: fdSelectValue [
	name := nameString.
	topDict := topDictTopDict.
	encoding := encodingEncoding.
	charset := charsetCharset.
	privateDict := privateDictPrivateDict.
	(charStringsArray notNil and: [
	charStringsArray notEmpty]) ifTrue: [
			charStrings := (Array withAll: charStringsArray) beImmutable].
	(stringsArray notNil and: [
	stringsArray notEmpty]) ifTrue: [
			strings := (Array withAll: stringsArray) beImmutable].
	(localSubrArray notNil and: [
	localSubrArray notEmpty]) ifTrue: [
			localSubr := (Array withAll: localSubrArray) beImmutable].
	(globalSubrArray notNil and: [
	globalSubrArray notEmpty]) ifTrue: [
			globalSubr := (Array withAll: globalSubrArray) beImmutable].
	(fontDictsArray notNil and: [
	fontDictsArray notEmpty]) ifTrue: [
			fontDicts := (Array withAll: fontDictsArray) beImmutable].
	fdSelect := fdSelectValue.
	self beImmutable
]

{ #category : #printing }
CFFCIDFont >> printvalueWith: printer [
	| args |
	args := OrderedCollection new.
	args add: (printer constant: 'name' value: self name).
	args add: (printer constant: 'topDict' value: self topDict).
	args add: (printer constant: 'encoding' value: self encoding).
	args add: (printer constant: 'charset' value: self charset).
	args add: (printer constant: 'privateDict' value: self privateDict).
	args add: (printer array: 'charStrings' value: self charStrings).
	args add: (printer array: 'strings' value: self strings).
	args add: (printer array: 'localSubr' value: self localSubr).
	args add: (printer array: 'globalSubr' value: self globalSubr).
	args add: (printer array: 'fontDicts' value: self fontDicts).
	args add: (printer constant: 'fdSelect' value: self fdSelect).
	^printer printvalue: self arguments: args
]
