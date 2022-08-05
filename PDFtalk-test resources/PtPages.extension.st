Extension { #name : #PtPages }

{ #category : #'*PDFtalk-test resources-accessing' }
PtPages >> structureString [
	| wst |
	wst := String new writeStream.
	wst nextPut: $(.
	self Kids do: [:kid | wst nextPutAll: kid referent structureString].
	wst nextPut: $).
	^wst contents
]
