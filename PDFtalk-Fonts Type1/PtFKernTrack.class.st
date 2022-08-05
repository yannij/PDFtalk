"
uniform kerning for a specified scale

The KerningTracks table need not be present in a PFM file for a Type-1 font, if it exists it contains etmKernTracks (from the EXTTEXTMETRIC structure) entries. Each of these entries looks as follows:

short ktDegree
This field contains the amount to change the character spacing. Negative values mean closer together, positive values mean farther apart.

short ktMinSize
This field contains the minimum font height (in device units) for which to use linear track kerning.

short ktMinAmount
This field contains the track kerning amount to use for font heights less or equal ktMinSize.

short ktMaxSize
This field contains the maximum font height (in device units) for which to use linear track kerning. For font heights between ktMinSize and ktMaxSize the track kerning amount has to increase linearily from ktMinAmount to ktMaxAmount.

short ktMaxAmount
This field contains the track kerning amount to use for font heights greater or equal ktMaxSize. 
"
Class {
	#name : #PtFKernTrack,
	#superclass : #Value,
	#instVars : [
		'degree',
		'minSize',
		'minAmount',
		'maxSize',
		'maxAmount'
	],
	#category : #'PDFtalk-Fonts Type1'
}

{ #category : #'instance creation' }
PtFKernTrack class >> degree: degreeInteger minSize: minSizeInteger minAmount: minAmountInteger maxSize: maxSizeInteger maxAmount: maxAmountInteger [
	| inst |
	inst := self new.
	inst
		initializeDegree: degreeInteger
		minSize: minSizeInteger
		minAmount: minAmountInteger
		maxSize: maxSizeInteger
		maxAmount: maxAmountInteger.
	^inst
]

{ #category : #'instance creation' }
PtFKernTrack class >> fromBytes: aByteArray10 [
	| rst |
	rst := ByteReadStream littleEndianOn: aByteArray10.
	^self
		degree: rst nextShort
		minSize: rst nextShort
		minAmount: rst nextShort
		maxSize: rst nextShort
		maxAmount: rst nextShort
]

{ #category : #specification }
PtFKernTrack class >> localSpecification [
	<constant: #degree class: #Integer comment: 'short: the amount to change the character spacing. Negative values mean closer together, positive values mean farther apart'>
	<constant: #minSize class: #Integer comment: 'short: the minimum font height (in device units) for which to use linear track kerning'>
	<constant: #minAmount class: #Integer comment: 'short: the track kerning amount to use for font heights less or equal minSize'>
	<constant: #maxSize class: #Integer comment: 'short: the maximum font height (in device units) for which to use linear track kerning. For font heights between minSize and maxSize the track kerning amount has to increase linearily from minAmount to maxAmount'>
	<constant: #maxAmount class: #Integer comment: 'short: the track kerning amount to use for font heights greater or equal maxSize'>
]

{ #category : #converting }
PtFKernTrack >> asBytes [
	"<ByteArray[10]>
	ByteArray suited to be written to a PFM file"

	| wst |
	wst := ByteWriteStream littleEndianOn: (ByteArray new: 10).
	wst
		nextPutShort: self degree;
		nextPutShort: self minSize;
		nextPutShort: self minAmount;
		nextPutShort: self maxSize;
		nextPutShort: self maxAmount.
	^wst contents
]

{ #category : #accessing }
PtFKernTrack >> degree [
	"<Integer>
	short: the amount to change the character spacing. Negative values mean closer together, positive values mean farther apart"

	^degree
]

{ #category : #'initialize-release' }
PtFKernTrack >> initializeDegree: degreeInteger minSize: minSizeInteger minAmount: minAmountInteger maxSize: maxSizeInteger maxAmount: maxAmountInteger [
	degree := degreeInteger.
	minSize := minSizeInteger.
	minAmount := minAmountInteger.
	maxSize := maxSizeInteger.
	maxAmount := maxAmountInteger.
	self beImmutable
]

{ #category : #accessing }
PtFKernTrack >> maxAmount [
	"<Integer>
	short: the track kerning amount to use for font heights greater or equal maxSize"

	^maxAmount
]

{ #category : #accessing }
PtFKernTrack >> maxSize [
	"<Integer>
	short: the maximum font height (in device units) for which to use linear track kerning. For font heights between minSize and maxSize the track kerning amount has to increase linearily from minAmount to maxAmount"

	^maxSize
]

{ #category : #accessing }
PtFKernTrack >> minAmount [
	"<Integer>
	short: the track kerning amount to use for font heights less or equal minSize"

	^minAmount
]

{ #category : #accessing }
PtFKernTrack >> minSize [
	"<Integer>
	short: the minimum font height (in device units) for which to use linear track kerning"

	^minSize
]

{ #category : #printing }
PtFKernTrack >> printvalueWith: printer [
	| args |
	args := OrderedCollection new.
	args add: (printer constant: 'degree' value: self degree).
	args add: (printer constant: 'minSize' value: self minSize).
	args add: (printer constant: 'minAmount' value: self minAmount).
	args add: (printer constant: 'maxSize' value: self maxSize).
	args add: (printer constant: 'maxAmount' value: self maxAmount).
	^printer printvalue: self arguments: args
]
