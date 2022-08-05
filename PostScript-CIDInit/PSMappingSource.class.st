"
Abstract class for the source of a mapping

used for matching source codes.

The mapping sources can be ordered.
"
Class {
	#name : #PSMappingSource,
	#superclass : #Value,
	#category : #'PostScript-CIDInit'
}

{ #category : #converting }
PSMappingSource >> --> anInteger [
	"<Mapping from: MappingSource to: Integer>"

	^self mappingClass source: self destination: anInteger
]

{ #category : #comparing }
PSMappingSource >> < aMappingSource [
	"true, iff the receivers bytes are smaller than aMappingSource bytes"

	^self subclassResponsibility
]

{ #category : #comparing }
PSMappingSource >> <= aMappingSource [
	"true, iff the receivers bytes are smaller or equal to aMappingSource"

	^self subclassResponsibility
]

{ #category : #accessing }
PSMappingSource >> first [
	"<Code>
	the first, lowest code"

	^self subclassResponsibility
]

{ #category : #comparing }
PSMappingSource >> greaterThanCode: aCode [
	^self subclassResponsibility
]

{ #category : #comparing }
PSMappingSource >> greaterThanOrEqualToCode: aCode [
	^self subclassResponsibility
]

{ #category : #comparing }
PSMappingSource >> greaterThanOrEqualToRange: aRange [
	^aRange first <= self first
]

{ #category : #comparing }
PSMappingSource >> greaterThanRange: aRange [
	^aRange first < self first
]

{ #category : #testing }
PSMappingSource >> includesCode: aCode [
	"A code shall be considered to match the range if it is the same length as the bounding codes 
	and the value of each of its bytes lies between the corresponding bytes of the lower and upper bounds
	(from 9.7.6.2 'CMap Mapping' of the PDF spec)"

	^self subclassResponsibility
]

{ #category : #testing }
PSMappingSource >> isAfterCode: aCode [
	^self subclassResponsibility
]

{ #category : #testing }
PSMappingSource >> isAfterRange: aRange [
	^self subclassResponsibility
]

{ #category : #testing }
PSMappingSource >> isBefore: aMappingSource [
	"true, iff the receiver is fully in front of aMappingSource"
	
	^self subclassResponsibility
]

{ #category : #testing }
PSMappingSource >> isInRange: aRange [
	"true, if aRange includes the receiver"

	^self subclassResponsibility
]

{ #category : #testing }
PSMappingSource >> isNext: aMappingSource [
	"does not cross byte boundaries of the bytes before last
	i.e. <00FF> isNext: <0100> is false"

	^self subclassResponsibility
]

{ #category : #accessing }
PSMappingSource >> last [
	"<Code>
	the last, highest code"

	^self subclassResponsibility
]

{ #category : #accessing }
PSMappingSource >> length [
	"<Integer>"

	^self subclassResponsibility
]

{ #category : #accessing }
PSMappingSource >> mappingClass [
	^self subclassResponsibility
]

{ #category : #converting }
PSMappingSource >> mappingToCode: aCode [
	^self mappingClass source: self destination: aCode asInteger
]

{ #category : #converting }
PSMappingSource >> mappingToInteger: anInteger [
	^self mappingClass source: self destination: anInteger
]

{ #category : #converting }
PSMappingSource >> mappingToName: aName [
	^self mappingClass source: self destination: aName psUnicode
]

{ #category : #accessing }
PSMappingSource >> numberOfCodes [
	"<Integer>
	the number of potential source codes"
	
	^self subclassResponsibility
]

{ #category : #testing }
PSMappingSource >> overlaps: aMappingSource [
	"Answer whether aRange has common elements with the receiver"

	self <= aMappingSource ifTrue: [
		^aMappingSource first <= self last].
	^aMappingSource overlaps: self
]

{ #category : #converting }
PSMappingSource >> withoutFirstByte [
	^self subclassResponsibility
]
