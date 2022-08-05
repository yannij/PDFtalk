"
PDF String object as defined in PDF 32000_2008.pdf pp. 87.

The internal value is local time.

Date values used in a PDF shall conform to a standard date format, which closely follows that of the international standard ASN.1 (Abstract Syntax Notation One), defined in ISO/IEC 8824.
A date shall be a text string of the form
	(D:YYYYMMDDHHmmSSOHH'mm)
where:
	YYYY shall be the year
	MM shall be the month (01–12)
	DD shall be the day (01–31)
	HH shall be the hour (00–23)
	mm shall be the minute (00–59)
	SS shall be the second (00–59)
	O shall be the relationship of local time to Universal Time (UT), and shall be denoted by one of the characters PLUS SIGN (U+002B) (+), HYPHEN-MINUS (U+002D) (-), or LATIN CAPITAL LETTER Z (U+005A) (Z) (see below)
	HH followed by APOSTROPHE (U+0027) (') shall be the absolute value of the offset from UT in hours (00–23)
	mm shall be the absolute value of the offset from UT in minutes (00–59)

The prefix D: shall be present, the year field (YYYY) shall be present and all other fields may be present but only if all of their preceding fields are also present. The APOSTROPHE following the hour offset field (HH) shall only be present if the HH field is present. The minute offset field (mm) shall only be present if the APOSTROPHE following the hour offset field (HH) is present. The default values for MM and DD shall be both 01; all other numerical fields shall default to zero values. A PLUS SIGN as the value of the O field signifies that local time is later than UT, a HYPHEN-MINUS signifies that local time is earlier than UT, and the LATIN CAPITAL LETTER Z signifies that local time is equal to UT. If no UT information is specified, the relationship of the specified time to UT shall be considered to be GMT. Regardless of whether the time zone is specified, the rest of the date shall be specified in local time.

EXAMPLE
For example, December 23, 1998, at 7:52 PM, U.S. Pacific Standard Time, is represented by the string D:199812231952-08'00
"
Class {
	#name : #PDFDate,
	#superclass : #PDFString,
	#category : #'PDFtalk-Basic Objects'
}

{ #category : #'instance creation' }
PDFDate class >> dateFrom: rst [
	"<Date>"

	| month day year |
	year := (rst next: 4) asNumber.
	month := (rst next: 2) asNumber.
	day := (rst next: 2) asNumber.
	^Date newDay: day monthNumber: month year: year
]

{ #category : #'instance creation' }
PDFDate class >> fromPdf: aByteString [
	| timestamp rst date time |
	rst := (aByteString allButFirst: 2) readStream.
	date := self dateFrom: rst.
	time := self timeFrom: rst.
	timestamp := Timestamp fromDate: date andTime: time.
	(rst atEnd or: [
	('Z+-' includes: rst peek) not]) ifFalse: [
			| duration |
			duration := Duration fromMinutes: (self timezoneOffsetMinutesFor: rst next from: rst).
			timestamp := (TimeZone default universalToLocal: timestamp) - duration].
	^self content: timestamp
]

{ #category : #accessing }
PDFDate class >> pdfTypeDefinition [

	^PDFTypeDefinition
		name: #Date
		supertype: #Object
		section: '7.9.4'
		documentation: 'The internal value is local time.

Date values used in a PDF shall conform to a standard date format, which closely follows that of the international standard ASN.1 (Abstract Syntax Notation One), defined in ISO/IEC 8824.
A date shall be a text string of the form
	(D:YYYYMMDDHHmmSSOHH''mm)
where:
	YYYY shall be the year
	MM shall be the month (01–12)
	DD shall be the day (01–31)
	HH shall be the hour (00–23)
	mm shall be the minute (00–59)
	SS shall be the second (00–59)
	O shall be the relationship of local time to Universal Time (UT), and shall be denoted by one of the characters PLUS SIGN (U+002B) (+), HYPHEN-MINUS (U+002D) (-), or LATIN CAPITAL LETTER Z (U+005A) (Z) (see below)
	HH followed by APOSTROPHE (U+0027) ('') shall be the absolute value of the offset from UT in hours (00–23)
	mm shall be the absolute value of the offset from UT in minutes (00–59)

The prefix D: shall be present, the year field (YYYY) shall be present and all other fields may be present but only if all of their preceding fields are also present. The APOSTROPHE following the hour offset field (HH) shall only be present if the HH field is present. The minute offset field (mm) shall only be present if the APOSTROPHE following the hour offset field (HH) is present. The default values for MM and DD shall be both 01; all other numerical fields shall default to zero values. A PLUS SIGN as the value of the O field signifies that local time is later than UT, a HYPHEN-MINUS signifies that local time is earlier than UT, and the LATIN CAPITAL LETTER Z signifies that local time is equal to UT. If no UT information is specified, the relationship of the specified time to UT shall be considered to be GMT. Regardless of whether the time zone is specified, the rest of the date shall be specified in local time.

EXAMPLE
For example, December 23, 1998, at 7:52 PM, U.S. Pacific Standard Time, is represented by the string D:199812231952-08''00'
]

{ #category : #'instance creation' }
PDFDate class >> timeFrom: rst [
	"<Time>"

	| hours minutes seconds |
	hours := (rst atEnd not and: [
	rst peek isDigit])
			ifTrue: [(rst next: 2) asNumber]
			ifFalse: [
			0].
	minutes := (rst atEnd not and: [
	rst peek isDigit])
			ifTrue: [(rst next: 2) asNumber]
			ifFalse: [
			0].
	seconds := (rst atEnd not and: [
	rst peek isDigit])
			ifTrue: [(rst next: 2) asNumber]
			ifFalse: [
			0].
	^Time h: hours m: minutes s: seconds
]

{ #category : #'instance creation' }
PDFDate class >> timezoneOffsetMinutesFor: char from: rst [
	| offset |
	char = $Z ifTrue: [
		^0].
	offset := (rst next: 2) asNumber * 60.
	(rst atEnd not and: [
	rst peek isDigit]) ifTrue: [
			offset := offset + (rst next: 2) asNumber].
	^char = $-
		ifTrue: [offset negated]
		ifFalse: [offset]
]

{ #category : #converting }
PDFDate >> asSmalltalkValue [
	^self content
]

{ #category : #converting }
PDFDate >> asString [
	^self pdfSource
]

{ #category : #writing }
PDFDate >> asUTC [
	"<String>
	in the form 20080701000000+02"

	| timestamp wst secondsDiference diffTime |
	timestamp := self asSmalltalkValue.
	wst := String new writeStream.
	timestamp year printOn: wst paddedWith: $0 to: 4 base: 10.
	timestamp month printOn: wst paddedWith: $0 to: 2 base: 10.
	timestamp dayOfMonth printOn: wst paddedWith: $0 to: 2 base: 10.
	timestamp hour printOn: wst paddedWith: $0 to: 2 base: 10.
	timestamp minute printOn: wst paddedWith: $0 to: 2 base: 10.
	timestamp second rounded printOn: wst paddedWith: $0 to: 2 base: 10.
	secondsDiference := TimeZone default secondsFromUniversalAtLocal: timestamp.
	wst nextPut: (secondsDiference negative
		ifTrue: [$-]
		ifFalse: [$+]).
	diffTime := Time fromSeconds: secondsDiference.
	diffTime hours printOn: wst paddedWith: $0 to: 2 base: 10.
	wst nextPut: $'.
	diffTime minutes isZero ifFalse: [
		diffTime minutes printOn: wst paddedWith: $0 to: 2 base: 10].
	^wst contents
]

{ #category : #testing }
PDFDate >> isEmpty [
	^self = self class new
]

{ #category : #writing }
PDFDate >> writePDFOn: aWriter indent: anInteger [
	self encrypted ifTrue: [
		^aWriter nextPutString: self].
	aWriter
		nextPutAll: '(D:' asByteArray;
		nextPutAll: self asUTC asByteArray;
		nextPutByte: $) asInteger
]
