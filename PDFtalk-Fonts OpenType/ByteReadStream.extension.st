Extension { #name : #ByteReadStream }

{ #category : #'*PDFtalk-Fonts OpenType-accessing stream' }
ByteReadStream >> nextOpenTypeFixed [
	"<Float>"
	"Most tables have version numbers, and the version number for the entire font is contained in the Table Directory. Note that there are two different table version number types, each with its own numbering scheme. USHORT version numbers always start at zero (0). Fixed version numbers start at one (1.0 or 0x00010000), except where noted (EBDT, EBLC and EBSC tables).

Implementations reading tables must include code to check version numbers so that if and when the format and therefore the version number changes, older implementations will reject newer versions gracefully, if the changes are incompatible.

When a Fixed number is used as a version, the upper 16 bits comprise a major version number, and the lower 16 bits a minor. Tables with non-zero minor version numbers always specify the literal value of the version number since the normal representation of Fixed numbers is not necessarily followed. For example, the version number of 'maxp' table version 0.5 is 0x00005000, and that of 'vhea' table version 1.1 is 0x00011000. If an implementation understands a major version number, then it can safely proceed reading the table. The minor version number indicates extensions to the format that are undetectable by implementations that do not support them.

The only exception to this is the Offset Table's sfnt version. This serves solely to identify whether the OpenType font contains TrueType outlines (a value of 1.0) or CFF data (the tag 'OTTO'), as described in the section below, 'Organization of an OpenType font.'

When a USHORT number is used to indicate version, it should be treated as though it were a minor version number; i.e., all format changes are compatible extensions."

	^(((self nextLong / 16r10000) * 1000) rounded / 1000) asFloat
]

{ #category : #'*PDFtalk-Fonts OpenType-accessing stream' }
ByteReadStream >> nextOpenTypeFixedVersion [
	"<FixedPoint>"
	"Most tables have version numbers, and the version number for the entire font is contained in the Table Directory. Note that there are two different table version number types, each with its own numbering scheme. USHORT version numbers always start at zero (0). Fixed version numbers start at one (1.0 or 0x00010000), except where noted (EBDT, EBLC and EBSC tables).

Implementations reading tables must include code to check version numbers so that if and when the format and therefore the version number changes, older implementations will reject newer versions gracefully, if the changes are incompatible.

When a Fixed number is used as a version, the upper 16 bits comprise a major version number, and the lower 16 bits a minor. Tables with non-zero minor version numbers always specify the literal value of the version number since the normal representation of Fixed numbers is not necessarily followed. For example, the version number of 'maxp' table version 0.5 is 0x00005000, and that of 'vhea' table version 1.1 is 0x00011000. If an implementation understands a major version number, then it can safely proceed reading the table. The minor version number indicates extensions to the format that are undetectable by implementations that do not support them.

The only exception to this is the Offset Table's sfnt version. This serves solely to identify whether the OpenType font contains TrueType outlines (a value of 1.0) or CFF data (the tag 'OTTO'), as described in the section below, 'Organization of an OpenType font.'

When a USHORT number is used to indicate version, it should be treated as though it were a minor version number; i.e., all format changes are compatible extensions."

	| major byte1String byte2String fraction |
	major := self nextUnsignedShort.
	byte1String := '0' , (self next printStringRadix: 16) last: 2.
	byte2String := '0' , (self next printStringRadix: 16) last: 2.
	fraction := ('0.' , byte1String , byte2String) asNumber.
	^major + fraction
]

{ #category : #'*PDFtalk-Fonts OpenType-accessing stream' }
ByteReadStream >> nextOpenTypeLongDateTime [
	"<Timestamp>"
	"LONGDATETIME 	created 	Number of seconds since 12:00 midnight that started January 1st 1904 in GMT/UTC time zone. 64-bit integer"

	^Timestamp fromOpenTypeLongDateTime: self nextLongLong
]
