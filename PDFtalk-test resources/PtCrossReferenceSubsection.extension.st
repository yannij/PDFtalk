Extension { #name : #PtCrossReferenceSubsection }

{ #category : #'*PDFtalk-test resources-test instances' }
PtCrossReferenceSubsection class >> example [
	^self
		firstNumber: 0
		entries: ((OrderedCollection new)
			add: (PtFreeReference id: (PtObjectId number: 0 generation: 65535) value: 3);
			add: (PtUsedReference id: (PtObjectId number: 1) value: 17);
			add: (PtUsedReference id: (PtObjectId number: 2) value: 81);
			add: (PtFreeReference id: (PtObjectId number: 3 generation: 7) value: 0);
			add: (PtUsedReference id: (PtObjectId number: 4) value: 331);
			add: (PtUsedReference id: (PtObjectId number: 5) value: 409);
			asArray)
]

{ #category : #'*PDFtalk-test resources-test instances' }
PtCrossReferenceSubsection class >> exampleString [
	"The following shows a cross-reference section consisting of a single subsection with six entries: four that are in use (objects number 1, 2, 4, and 5) and two that are free (objects number 0 and 3). Object number 3 has been deleted, and the next object created with that object number is given a generation number of 7."

	^'0 6
0000000003 65535 f 
0000000017 00000 n 
0000000081 00000 n 
0000000000 00007 f 
0000000331 00000 n 
0000000409 00000 n 
'
]
