Extension { #name : #PtCrossReferenceSection }

{ #category : #'*PDFtalk-test resources-test instances' }
PtCrossReferenceSection class >> example [
	^self subsections: (Array
		with: (PtCrossReferenceSubsection
			firstNumber: 0
			entries: (Array with: (PtFreeReference id: (PtObjectId number: 0 generation: 65535) value: 0)))
		with: (PtCrossReferenceSubsection
			firstNumber: 3
			entries: (Array with: (PtUsedReference id: (PtObjectId number: 3) value: 25325)))
		with: (PtCrossReferenceSubsection
			firstNumber: 23
			entries: (Array
				with: (PtUsedReference id: (PtObjectId number: 23 generation: 2) value: 25518)
				with: (PtUsedReference id: (PtObjectId number: 24) value: 25635)))
		with: (PtCrossReferenceSubsection
			firstNumber: 30
			entries: (Array with: (PtUsedReference id: (PtObjectId number: 30) value: 25777))))
]

{ #category : #'*PDFtalk-test resources-test instances' }
PtCrossReferenceSection class >> exampleString [
	"The following shows a cross-reference section with four subsections, containing a total of five entries. The first subsection contains one entry, for object number 0, which is free. The second subsection contains one entry, for object number 3, which is in use. The third subsection contains two entries, for objects number 23 and 24, both of which are in use. Object number 23 has been reused, as can be seen from the fact that it has a generation number of 2. The fourth subsection contains one entry, for object number 30, which is in use."

	^'xref
0 1
0000000000 65535 f 
3 1
0000025325 00000 n 
23 2
0000025518 00002 n 
0000025635 00000 n 
30 1
0000025777 00000 n 
'
]
