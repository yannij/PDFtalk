Extension { #name : #Timestamp }

{ #category : #'*PDFtalk-Fonts OpenType-conversion' }
Timestamp >> asOpenTypeLongDateTime [
	"<Integer>
	as seconds from new year 1904"

	^self asSeconds - self class newyear1904AsSeconds
]

{ #category : #'*PDFtalk-Fonts OpenType-instance creation' }
Timestamp class >> fromOpenTypeLongDateTime: secondsFromNewyear1904 [
	"Answer a new Timestamp from the number of seconds since 12:00 am, January 1, 1904.
	Used in the OpenType file format"

	^self fromSeconds: secondsFromNewyear1904 + self newyear1904AsSeconds
]

{ #category : #'*PDFtalk-Fonts OpenType-instance creation' }
Timestamp class >> newyear1904AsSeconds [
	"(self d: 1 m: 1 y: 1904) asSeconds"

	^94608000
]
