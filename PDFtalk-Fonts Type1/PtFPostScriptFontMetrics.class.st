"
the Smalltalk value of a .pfm (PostScript Font Metrics) file.

The binary file is used by Windows with a .pfb file to install a Type 1 font.

The implementation saves only the contents fields in values for later use.
Internal file management data (offsets and counts) are discarted, since they can be reproduced from the contents.

"
Class {
	#name : #PtFPostScriptFontMetrics,
	#superclass : #Object,
	#instVars : [
		'font',
		'header',
		'extTextMetrics',
		'faceName',
		'driverInfo',
		'extentTable',
		'kerningPairs',
		'kerningTracks'
	],
	#category : #'PDFtalk-Fonts Type1'
}

{ #category : #accessing }
PtFPostScriptFontMetrics class >> deviceName [
	"<String>
	the name of the printer driver family"

	^'PostScript'
]

{ #category : #'instance creation' }
PtFPostScriptFontMetrics class >> fromBytes: aByteArray [
	| rst header deviceOffset faceOffset extMetricsOffset extentTableOffset pairKernTableOffset trackKernTableOffset driverInfoOffset extTextMetrics numberOfKernPairs numberOfKernTracks faceName driverInfo extentTable kerningPairs kerningTracks |
	rst := ByteReadStream littleEndianOn: aByteArray.
	"PFMHeader"
	rst nextUnsignedShort = self version ifFalse: [
		self error: 'version is not correct'].
	rst nextUnsignedLong = aByteArray size ifFalse: [
		self error: 'file size is not correct'].
	header := PtFPFMHeader fromBytes: (rst next: 95).
	deviceOffset := rst nextUnsignedLong.
	faceOffset := rst nextUnsignedLong.
	rst next: 8.
	"PFMExtension"
	rst nextUnsignedShort = 30 ifFalse: [
		self error: 'sizeFields is not correct'].
	extMetricsOffset := rst nextUnsignedLong.
	extentTableOffset := rst nextUnsignedLong.
	rst nextUnsignedLong isZero ifFalse: [
		self error: 'originTable is not correct'].
	pairKernTableOffset := rst nextUnsignedLong.
	trackKernTableOffset := rst nextUnsignedLong.
	driverInfoOffset := rst nextUnsignedLong.
	rst nextUnsignedLong isZero ifFalse: [
		self error: 'reserved is not correct'].
	rst position: extMetricsOffset.
	extTextMetrics := PtFExtTextMetrics fromBytes: (rst next: 48).
	numberOfKernPairs := rst nextUnsignedShort.
	numberOfKernTracks := rst nextUnsignedShort.
	rst position: deviceOffset.
	rst nextString = self deviceName ifFalse: [
		self error: 'deviceName is not correct'].
	rst position: faceOffset.
	faceName := rst nextString.
	rst position: driverInfoOffset.
	driverInfo := rst nextString.
	rst position: extentTableOffset.
	extentTable := (1 to: header numberOfCharacters) collect: [:i |
		(ByteReadStream littleEndianOn: (rst next: 2)) nextUnsignedShort].
	numberOfKernPairs isZero ifFalse: [
		rst position: pairKernTableOffset.
		kerningPairs := PtFPairKern tableFromBytes: (rst next: numberOfKernPairs * 4 + 2).
		numberOfKernPairs = kerningPairs size ifFalse: [
			self error: 'the number of kerning pairs is not correct']].
	numberOfKernTracks isZero ifFalse: [
		rst position: trackKernTableOffset.
		kerningTracks := (1 to: numberOfKernTracks) collect: [:i |
			PtFKernTrack fromBytes: (rst next: 10)]].
	^self
		header: header
		extTextMetrics: extTextMetrics
		faceName: faceName
		driverInfo: driverInfo
		extentTable: extentTable
		kerningPairs: kerningPairs
		kerningTracks: kerningTracks
]

{ #category : #'instance creation optional' }
PtFPostScriptFontMetrics class >> header: headerPFMHeader extTextMetrics: extTextMetricsExtTextMetrics faceName: faceNameString driverInfo: driverInfoString [
	| inst |
	inst := self new.
	inst
		initializeHeader: headerPFMHeader
		extTextMetrics: extTextMetricsExtTextMetrics
		faceName: faceNameString
		driverInfo: driverInfoString
		extentTable: nil
		kerningPairs: nil
		kerningTracks: nil.
	^inst
]

{ #category : #'instance creation optional' }
PtFPostScriptFontMetrics class >> header: headerPFMHeader extTextMetrics: extTextMetricsExtTextMetrics faceName: faceNameString driverInfo: driverInfoString extentTable: extentTableArray [
	| inst |
	inst := self new.
	inst
		initializeHeader: headerPFMHeader
		extTextMetrics: extTextMetricsExtTextMetrics
		faceName: faceNameString
		driverInfo: driverInfoString
		extentTable: extentTableArray
		kerningPairs: nil
		kerningTracks: nil.
	^inst
]

{ #category : #'instance creation optional' }
PtFPostScriptFontMetrics class >> header: headerPFMHeader extTextMetrics: extTextMetricsExtTextMetrics faceName: faceNameString driverInfo: driverInfoString extentTable: extentTableArray kerningPairs: kerningPairsArray [
	| inst |
	inst := self new.
	inst
		initializeHeader: headerPFMHeader
		extTextMetrics: extTextMetricsExtTextMetrics
		faceName: faceNameString
		driverInfo: driverInfoString
		extentTable: extentTableArray
		kerningPairs: kerningPairsArray
		kerningTracks: nil.
	^inst
]

{ #category : #'instance creation' }
PtFPostScriptFontMetrics class >> header: headerPFMHeader extTextMetrics: extTextMetricsExtTextMetrics faceName: faceNameString driverInfo: driverInfoString extentTable: extentTableArray kerningPairs: kerningPairsArray kerningTracks: kerningTracksArray [
	| inst |
	inst := self new.
	inst
		initializeHeader: headerPFMHeader
		extTextMetrics: extTextMetricsExtTextMetrics
		faceName: faceNameString
		driverInfo: driverInfoString
		extentTable: extentTableArray
		kerningPairs: kerningPairsArray
		kerningTracks: kerningTracksArray.
	^inst
]

{ #category : #'instance creation optional' }
PtFPostScriptFontMetrics class >> header: headerPFMHeader extTextMetrics: extTextMetricsExtTextMetrics faceName: faceNameString driverInfo: driverInfoString extentTable: extentTableArray kerningTracks: kerningTracksArray [
	| inst |
	inst := self new.
	inst
		initializeHeader: headerPFMHeader
		extTextMetrics: extTextMetricsExtTextMetrics
		faceName: faceNameString
		driverInfo: driverInfoString
		extentTable: extentTableArray
		kerningPairs: nil
		kerningTracks: kerningTracksArray.
	^inst
]

{ #category : #'instance creation optional' }
PtFPostScriptFontMetrics class >> header: headerPFMHeader extTextMetrics: extTextMetricsExtTextMetrics faceName: faceNameString driverInfo: driverInfoString kerningPairs: kerningPairsArray [
	| inst |
	inst := self new.
	inst
		initializeHeader: headerPFMHeader
		extTextMetrics: extTextMetricsExtTextMetrics
		faceName: faceNameString
		driverInfo: driverInfoString
		extentTable: nil
		kerningPairs: kerningPairsArray
		kerningTracks: nil.
	^inst
]

{ #category : #'instance creation optional' }
PtFPostScriptFontMetrics class >> header: headerPFMHeader extTextMetrics: extTextMetricsExtTextMetrics faceName: faceNameString driverInfo: driverInfoString kerningPairs: kerningPairsArray kerningTracks: kerningTracksArray [
	| inst |
	inst := self new.
	inst
		initializeHeader: headerPFMHeader
		extTextMetrics: extTextMetricsExtTextMetrics
		faceName: faceNameString
		driverInfo: driverInfoString
		extentTable: nil
		kerningPairs: kerningPairsArray
		kerningTracks: kerningTracksArray.
	^inst
]

{ #category : #'instance creation optional' }
PtFPostScriptFontMetrics class >> header: headerPFMHeader extTextMetrics: extTextMetricsExtTextMetrics faceName: faceNameString driverInfo: driverInfoString kerningTracks: kerningTracksArray [
	| inst |
	inst := self new.
	inst
		initializeHeader: headerPFMHeader
		extTextMetrics: extTextMetricsExtTextMetrics
		faceName: faceNameString
		driverInfo: driverInfoString
		extentTable: nil
		kerningPairs: nil
		kerningTracks: kerningTracksArray.
	^inst
]

{ #category : #accessing }
PtFPostScriptFontMetrics class >> version [
	"<Integer>	WORD
	the version of the PFM file. For PFM files that conform to this description (namely PFM files for Type-1 fonts) the value is always 0x0100"

	^16r0100
]

{ #category : #comparing }
PtFPostScriptFontMetrics >> = aPostScriptFontMetrics [
	^self class == aPostScriptFontMetrics class and: [
	self font = aPostScriptFontMetrics font and: [
	self header = aPostScriptFontMetrics header and: [
	self extTextMetrics = aPostScriptFontMetrics extTextMetrics and: [
	self faceName = aPostScriptFontMetrics faceName and: [
	self driverInfo = aPostScriptFontMetrics driverInfo and: [
	self extentTable = aPostScriptFontMetrics extentTable and: [
	self kerningPairs = aPostScriptFontMetrics kerningPairs and: [
	self kerningTracks = aPostScriptFontMetrics kerningTracks]]]]]]]]
]

{ #category : #converting }
PtFPostScriptFontMetrics >> asBytes [
	"<ByteArray>
	ByteArray suited to be written as a PFM file.
	The order of elements follows the advice of Adobe in technical note 5178.PFM.pdf :
		1. header (required)
		2. extension (required)
		3. extTextMetrics
		4. deviceName (constant 'PostScript')
		5. faceName
		6. driverInfo (PostScript name)
		7. extentTable
		8. kerningPairs
		(9. kerningTracks) - never seen - junk feature?
	Therefore, the offsets 1 to 5 are fixed"

	| extTextMetricsOffset deviceOffset sizeOfDeviceName faceOffset sizeOfFaceName driverInfoOffset sizeOfDriverInfo extentTableOffset sizeOfExtentTable kerningPairsOffset sizeOfKerningPairs kerningTracksOffset sizeOfKerningTracks fileSize wst |
	extTextMetricsOffset := 117 + 30.
	deviceOffset := extTextMetricsOffset + 52.
	sizeOfDeviceName := self class deviceName size + 1.
	faceOffset := deviceOffset + sizeOfDeviceName.
	sizeOfFaceName := self faceName size + 1.
	driverInfoOffset := faceOffset + sizeOfFaceName.
	sizeOfDriverInfo := self driverInfo size + 1.
	extentTableOffset := driverInfoOffset + sizeOfDriverInfo.
	sizeOfExtentTable := self extentTable size * 2.
	kerningPairsOffset := 0.
	self kerningPairs notEmpty ifTrue: [
		kerningPairsOffset := extentTableOffset + sizeOfExtentTable].
	sizeOfKerningPairs := self sizeOfKerningPairs.
	kerningTracksOffset := 0.
	self kerningTracks notEmpty ifTrue: [
		kerningTracksOffset := extentTableOffset + sizeOfExtentTable + sizeOfKerningPairs].
	sizeOfKerningTracks := self kerningTracks size * 10.
	fileSize := extentTableOffset + sizeOfExtentTable + sizeOfKerningPairs + sizeOfKerningTracks.
	wst := ByteWriteStream littleEndianOn: (ByteArray new: fileSize).
	wst
		nextPutUnsignedShort: self class version;
		nextPutUnsignedLong: fileSize;
		nextPutAll: self header asBytes;
		nextPutUnsignedLong: deviceOffset;
		nextPutUnsignedLong: faceOffset;
		nextPutUnsignedLong: 0;
		nextPutUnsignedLong: 0;
		nextPutUnsignedShort: 30;
		nextPutUnsignedLong: extTextMetricsOffset;
		nextPutUnsignedLong: extentTableOffset;
		nextPutUnsignedLong: 0;
		nextPutUnsignedLong: kerningPairsOffset;
		nextPutUnsignedLong: kerningTracksOffset;
		nextPutUnsignedLong: driverInfoOffset;
		nextPutUnsignedLong: 0;
		nextPutAll: self extTextMetrics asBytes;
		nextPutUnsignedShort: self kerningPairs size;
		nextPutUnsignedShort: self kerningTracks size;
		nextPutString: self class deviceName;
		nextPutString: self faceName;
		nextPutString: self driverInfo.
	self extentTable do: [:extent | wst nextPutUnsignedShort: extent].
	self kerningPairs notEmpty ifTrue: [
		wst nextPutUnsignedShort: self kerningPairs size.
		self kerningPairs do: [:pairKern | wst nextPutAll: pairKern asBytes]].
	self kerningTracks do: [:kernTrack | wst nextPutAll: kernTrack asBytes].
	^wst contents
]

{ #category : #accessing }
PtFPostScriptFontMetrics >> ascender [
	^self extTextMetrics lcAscent
]

{ #category : #accessing }
PtFPostScriptFontMetrics >> descender [
	^self extTextMetrics lcDescent negated
]

{ #category : #accessing }
PtFPostScriptFontMetrics >> driverInfo [
	"<String>
	additional informations for the printer driver like the name of the font, sequences necessary for selecting the font etc. "

	^driverInfo
]

{ #category : #accessing }
PtFPostScriptFontMetrics >> extTextMetrics [
	"<ExtTextMetrics>
	This section (52 Bytes) contains additional informations about the font (orientation, minimum and maximum acceptable size of the font, the cap height, the degree of obliqueness for italic fonts etc.)"

	^extTextMetrics
]

{ #category : #accessing }
PtFPostScriptFontMetrics >> extentTable [
	"<Array>
	the character widths for scalable fonts"

	^extentTable ifNil: [#()]
]

{ #category : #accessing }
PtFPostScriptFontMetrics >> faceName [
	"<String>
	the name of the font face, normally without suffixes like »-Bold«, »-Italic« etc.
	Used in a windows LOGFONT"

	^faceName
]

{ #category : #accessing }
PtFPostScriptFontMetrics >> font [
	"<Type1.Font>
	back pointer to containing font object"

	^font
]

{ #category : #accessing }
PtFPostScriptFontMetrics >> font: aFont [
	font := aFont
]

{ #category : #comparing }
PtFPostScriptFontMetrics >> hash [
	^self font hash bitXor: (self header hash bitXor: (self extTextMetrics hash bitXor: (self faceName hash bitXor: (self driverInfo hash bitXor: (self extentTable hash bitXor: (self kerningPairs hash bitXor: self kerningTracks))))))
]

{ #category : #accessing }
PtFPostScriptFontMetrics >> header [
	"<PFMHeader>
	The header (117 Bytes) with basic information"

	^header
]

{ #category : #'initialize-release' }
PtFPostScriptFontMetrics >> initializeHeader: headerPFMHeader extTextMetrics: extTextMetricsExtTextMetrics faceName: faceNameString driverInfo: driverInfoString extentTable: extentTableArray kerningPairs: kerningPairsArray kerningTracks: kerningTracksArray [
	header := headerPFMHeader.
	extTextMetrics := extTextMetricsExtTextMetrics.
	faceName := faceNameString.
	driverInfo := driverInfoString.
	(extentTableArray notNil and: [
	extentTableArray notEmpty]) ifTrue: [
			extentTable := (Array withAll: extentTableArray) beImmutable].
	(kerningPairsArray notNil and: [
	kerningPairsArray notEmpty]) ifTrue: [
			kerningPairs := (Array withAll: kerningPairsArray) beImmutable].
	(kerningTracksArray notNil and: [
	kerningTracksArray notEmpty]) ifTrue: [
			kerningTracks := (Array withAll: kerningTracksArray) beImmutable].
]

{ #category : #testing }
PtFPostScriptFontMetrics >> isFixedPitch [
	^self header isFixedPitch
]

{ #category : #testing }
PtFPostScriptFontMetrics >> isItalic [
	^self header italic
]

{ #category : #accessing }
PtFPostScriptFontMetrics >> kerningPairs [
	"<Array>
	kerning pairs together with the kerning amount for every pair"

	^kerningPairs ifNil: [#()]
]

{ #category : #accessing }
PtFPostScriptFontMetrics >> kerningTracks [
	"<Array>
	informations for globally font kerning according to the size the font is printed with"

	^kerningTracks ifNil: [#()]
]

{ #category : #accessing }
PtFPostScriptFontMetrics >> postScriptName [
	"<String>
	the name as used by PostScript and PDF"

	^self driverInfo
]

{ #category : #printing }
PtFPostScriptFontMetrics >> printvalueWith: printer [
	| args |
	args := OrderedCollection new.
	args add: (printer constant: 'header' value: self header).
	args add: (printer constant: 'extTextMetrics' value: self extTextMetrics).
	args add: (printer constant: 'faceName' value: self faceName).
	args add: (printer constant: 'driverInfo' value: self driverInfo).
	args add: (printer array: 'extentTable' value: self extentTable).
	args add: (printer array: 'kerningPairs' value: self kerningPairs).
	args add: (printer array: 'kerningTracks' value: self kerningTracks).
	^printer printvalue: self arguments: args
]

{ #category : #converting }
PtFPostScriptFontMetrics >> sizeOfKerningPairs [
	"<Integer>
	2 bytes added for the size header WORD"

	| count |
	count := self kerningPairs size.
	count isZero ifTrue: [
		^0].
	^count * 4 + 2
]

{ #category : #accessing }
PtFPostScriptFontMetrics >> stemV [
	"<Integer>"

	^self header stemV
]

{ #category : #accessing }
PtFPostScriptFontMetrics >> underlinePosition [
	^self extTextMetrics ulOffset negated
]

{ #category : #accessing }
PtFPostScriptFontMetrics >> underlineThickness [
	^self extTextMetrics ulWidth
]

{ #category : #accessing }
PtFPostScriptFontMetrics >> weight [
	"<Integer>
	WORD: The weight of the font in the range 0 through 1000. For example, 400 is roman and 700 is bold. If this value is zero, a default weight is used"

	^self header weight
]
