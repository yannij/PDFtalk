Extension { #name : #PtRenderer }

{ #category : #'*PDFtalk-Demonstrations-demos' }
PtRenderer >> paintImage: anImage caption: aString in: aRectangle [
	"<Point>
	return the right position"

	self paintImage: anImage in: aRectangle.
	self showString: aString at: aRectangle origin - (0 @ 4).
	^aRectangle topRight
]

{ #category : #'*PDFtalk-Demonstrations-demos' }
PtRenderer >> paintImage: image in: rect [
	self isolatedDo: [
		self concat: (((PtPDF classAt: #Matrix) scaling: rect extent) translatedBy: rect origin).
		self paintXObject: image]
]

{ #category : #'*PDFtalk-Demonstrations-demos' }
PtRenderer >> showString: aString at: aPoint [
	self textObjectDo: [
		self textMatrix: #(1 0 0 1) , (Array
			with: aPoint x
			with: aPoint y).
		self setFont: #Helvetica size: 4.
		self showString: aString]
]
