Extension { #name : #PtObjectStream }

{ #category : #'*PDFtalk-test resources-test instances' }
PtObjectStream class >> example [
	^self
		on: (Valuemap
			with: #Type -> #ObjStm
			with: #Length -> 191
			with: #N -> 3
			with: #First -> 15)
		internal: '7 0 8 63 9 123
<<	/Type /Font
	/Subtype /TrueType
	/FontDescriptor 12 0 R
>>

<<	/Type /FontDescriptor
	/Ascent 891
	/FontFile2 22 0 R
>>
<<	/Type /Font
	/Subtype /Type0
	/ToUnicode 10 0 R
>>'
]
