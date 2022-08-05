Class {
	#name : #PtStringTests,
	#superclass : #PtTests,
	#category : #'PDFtalk-tests'
}

{ #category : #tests }
PtStringTests >> testEncryptedStringRead [
	self assert: (PtFile readEncryptedTesterOn: '( This is a string )') readObject = (PtPDF String content: ' This is a string ' asByteArray encrypted: true).
]

{ #category : #tests }
PtStringTests >> testStringLimits [
	self shouldnt: [PtContentString content: (ByteArray new: 32767 withAll: $X asInteger)] raise: PtError.
	self should: [PtContentString content: (ByteArray new: 32768 withAll: $X asInteger)] raise: PtError
]

{ #category : #tests }
PtStringTests >> testStringLineBreaks [
	self assert: (PtPDF String asPDFEndOfLines: ' This is a string ') = ' This is a string '.
	self assert: (PtPDF String asPDFEndOfLines: ' This is
a string ') = (' This is', self stringLf, 'a string ').
]

{ #category : #tests }
PtStringTests >> testStringRead [
	self assert: (PtFile readTesterOn: '()') readObject = '' asPDF.
	self assert: (PtFile readTesterOn: '( This is a string )') readObject = ' This is a string ' asPDF.
	self assert: (PtFile readTesterOn: '(Strings may contain newlines
and such .)') readObject = 'Strings may contain newlines
and such .' asPDF.
	self assert: (PtFile readTesterOn: '(Strings may contain balanced parentheses ( ) and
special characters ( * ! & } ^ % and so on ) .)') readObject = 'Strings may contain balanced parentheses ( ) and
special characters ( * ! & } ^ % and so on ) .' asPDF.
	self assert: (PtFile readTesterOn: '()') readObject = String new asPDF.
	self assert: (PtFile readTesterOn: '(It has zero ( 0 ) length .)') readObject = 'It has zero ( 0 ) length .' asPDF.
	self assert: (PtFile readTesterOn: '(Unbalanced parenthesis \(...\)\) quoted.)') readObject = 'Unbalanced parenthesis (...)) quoted.' asPDF.
	self assert: (PtFile readTesterOn: '(This string contains \245two octal characters\307.)') readObject pdfSource = '(This string contains \245two octal characters\307.)'.
	self assert: (PtFile readTesterOn: '  		
		(leading whitespace)') readObject = 'leading whitespace' asPDF.
	self assert: (PtFile readTesterOn: '<4E6F762073686D6F7A206B6120706F702E>') readObject = 'Nov shmoz ka pop.' asPDF.
	self assert: (PtFile readTesterOn: '  
		<4E6F762073686D6F7A206B6120706F702E>') readObject = 'Nov shmoz ka pop.' asPDF.
	self assert: (PtFile readTesterOn: '< 4E6F762073686D6F7A206B6120706F702E >') readObject = 'Nov shmoz ka pop.' asPDF.
	self assert: (PtFile readTesterOn: '<4e6f762073686d6f7a206b6120706f702e>') readObject = 'Nov shmoz ka pop.' asPDF.
	self assert: (PtFile readTesterOn: '<4E6F76207	3686D6F7A20
6B6120706F7
02E>') readObject = 'Nov shmoz ka pop.' asPDF.
	self assert: (PtFile readTesterOn: '<901FA3>') readObject = #[144 31 163] asString asPDF.
	self assert: (PtFile readTesterOn: '<901FA>') readObject = #[144 31 160] asString asPDF.
	self assert: (PtFile readTesterOn: '<5468697320537472696E67206973206C6F6E67657220616E6420627265616B73
20696E746F206C696E6573>') readObject = 'This String is longer and breaks into lines' asPDF.
	self assert: (PtFile readTesterOn: '(Backslash with unknown directive \@ is ignored)') readObject = 'Backslash with unknown directive @ is ignored' asPDF
]

{ #category : #tests }
PtStringTests >> testStringReadExamples [
	self assert: (PtFile readTesterOn: '( This is a string )') readObject = ' This is a string ' asPDF.
	self assert: (PtFile readTesterOn: '(Strings may contain newlines
and such .)') readObject = 'Strings may contain newlines
and such .' asPDF.
	self assert: (PtFile readTesterOn: '(Strings may contain balanced parentheses ( ) and
special characters ( * ! & } ^ % and so on ) .)') readObject = 'Strings may contain balanced parentheses ( ) and
special characters ( * ! & } ^ % and so on ) .' asPDF.
	self assert: (PtFile readTesterOn: '(The following is an empty string .)') readObject = 'The following is an empty string .' asPDF.
	self assert: (PtFile readTesterOn: '()') readObject = String new asPDF.
	self assert: (PtFile readTesterOn: '(It has zero ( 0 ) length .)') readObject = 'It has zero ( 0 ) length .' asPDF
]

{ #category : #tests }
PtStringTests >> testStringReadHex [
	self assert: (PtFile readTesterOn: '<4E6F762073686D6F7A206B6120706F702E>') readObject = 'Nov shmoz ka pop.' asPDF.
	self assert: (PtFile readTesterOn: '< 4E6F762073686D6F7A206B6120706F702E >') readObject = 'Nov shmoz ka pop.' asPDF.
	self assert: (PtFile readTesterOn: '<4e6f762073686d6f7a206b6120706f702e>') readObject = 'Nov shmoz ka pop.' asPDF.
	self assert: (PtFile readTesterOn: '<4E6F76207	3686D6F7A20
6B6120706F7
02E>') readObject = 'Nov shmoz ka pop.' asPDF.
	self assert: (PtFile readTesterOn: '<901FA3>') readObject = #[144 31 163] asString asPDF.
	self assert: (PtFile readTesterOn: '<901FA>') readObject = #[144 31 160] asString asPDF.
	self assert: (PtFile readTesterOn: '<5468697320537472696E67206973206C6F6E67657220616E6420627265616B73
20696E746F206C696E6573>') readObject = 'This String is longer and breaks into lines' asPDF
]

{ #category : #tests }
PtStringTests >> testStringReadLineBreaks [
	self assert: (PtFile readTesterOn: '( This is a string )') readObject = ' This is a string ' asPDF.
	self assert: (PtFile readTesterOn: '(These \
two strings \
are the same.)') readObject = 'These two strings are the same.' asPDF.
	self assert: (PtFile readTesterOn: '(These \
two strings \
are the same.)') readObject = (PtFile readTesterOn: '(These two strings are the same.)') readObject.
	self assert: (PtFile readTesterOn: '(This string has an end-of-line at the end of it.
)') readObject = 'This string has an end-of-line at the end of it.
' asPDF.
	self assert: (PtFile readTesterOn: '(So does this one.\n)') readObject = 'So does this one.
' asPDF.
	self assert: (PtFile readTesterOn: '(So does this one.\r)') readObject = 'So does this one.
' asPDF
]

{ #category : #tests }
PtStringTests >> testStringReadOctalCharacters [
	self assert: (PtFile readTesterOn: '(This string contains \245two octal characters\307.)') readObject pdfSource = '(This string contains \245two octal characters\307.)'.
	self assert: (PtFile readTesterOn: '(\0053)') readObject = (String
		with: 5 asCharacter
		with: $3) asPDF.
	self assert: (PtFile readTesterOn: '(\053)') readObject = '+' asPDF.
	self assert: (PtFile readTesterOn: '(\53)') readObject = '+' asPDF
]

{ #category : #tests }
PtStringTests >> testStringReadParenthesis [
	self assert: (PtFile readTesterOn: '(Strings may contain balanced parentheses ( ) and special characters ( * ! & } ^ % and so on ).)') readObject = 'Strings may contain balanced parentheses ( ) and special characters ( * ! & } ^ % and so on ).' asPDF.
	self assert: (PtFile readTesterOn: '(It has zero ( 0 ) length.)') readObject = 'It has zero ( 0 ) length.' asPDF.
	self assert: (PtFile readTesterOn: '(Unbalanced parenthesis are quoted \(.)') readObject = 'Unbalanced parenthesis are quoted (.' asPDF.
	self assert: (PtFile readTesterOn: '(Unbalanced parenthesis are quoted \).)') readObject = 'Unbalanced parenthesis are quoted ).' asPDF.
	self assert: (PtFile readTesterOn: '(Unbalanced parenthesis \(...\)\) quoted.)') readObject = 'Unbalanced parenthesis (...)) quoted.' asPDF.
	self assert: (PtFile readTesterOn: '(Unbalanced parenthesis \(\(\(...\)\) quoted.)') readObject = 'Unbalanced parenthesis (((...)) quoted.' asPDF
]

{ #category : #tests }
PtStringTests >> testStringWrite [
	self assert: '' asPDF pdfSource = '()'.
	self assert: PtPDF String new pdfSource = '()'.
	self assert: PtPDF String empty pdfSource = '()'.
	self assert: 'This is a string' asPDF pdfSource = '(This is a string)'.
	self assert: 'Strings may contain newlines
and such.' asPDF pdfSource = ('(Strings may contain newlines' , self stringLf , 'and such.)').
	self assert: 'Strings may contain balanced parentheses ( ) and
special characters ( * ! & } ^ % and so on ).' asPDF pdfSource = ('(Strings may contain balanced parentheses ( ) and' , self stringLf , 'special characters ( * ! & } ^ % and so on ).)').
	self assert: 'The following is an empty string.' asPDF pdfSource = '(The following is an empty string.)'.
	self assert: String new asPDF pdfSource = '()'.
	self assert: 'It has zero ( 0 ) length.' asPDF pdfSource = '(It has zero ( 0 ) length.)'.
	self assert: (PtFile readTesterOn: '(This string contains \245two octal characters\307.)') readObject pdfSource = '(This string contains \245two octal characters\307.)'.
	self assert: 'Unbalanced parenthesis (...)) quoted.' asPDF pdfSource = '(Unbalanced parenthesis \(...\)\) quoted.)'.
	self assert: 'Nov shmoz ka pop.' asPDF pdfHexSource = '<4E6F762073686D6F7A206B6120706F702E>'.
	self assert: #[144 31 163] asString asPDF pdfHexSource = '<901FA3>'.
	self assert: #[144 31 160] asString asPDF pdfHexSource = '<901FA0>'.
	self assert: 'This String is longer and breaks into lines' asPDF pdfHexSource = ('<5468697320537472696E67206973206C6F6E67657220616E6420627265616B73' , self stringLf , '20696E746F206C696E6573>')
]

{ #category : #tests }
PtStringTests >> testStringWriteExamples [
	self assert: 'This is a string' asPDF pdfSource = '(This is a string)'.
	self assert: 'Strings may contain newlines
and such.' asPDF pdfSource = ('(Strings may contain newlines' , self stringLf , 'and such.)').
	self assert: 'Strings may contain balanced parentheses ( ) and
special characters ( * ! & } ^ % and so on ).' asPDF pdfSource = ('(Strings may contain balanced parentheses ( ) and' , self stringLf , 'special characters ( * ! & } ^ % and so on ).)').
	self assert: 'The following is an empty string.' asPDF pdfSource = '(The following is an empty string.)'.
	self assert: String new asPDF pdfSource = '()'.
	self assert: 'It has zero ( 0 ) length.' asPDF pdfSource = '(It has zero ( 0 ) length.)'
]

{ #category : #tests }
PtStringTests >> testStringWriteHex [
	self assert: 'Nov shmoz ka pop.' asPDF pdfHexSource = '<4E6F762073686D6F7A206B6120706F702E>'.
	self assert: #[144 31 163] asString asPDF pdfHexSource = '<901FA3>'.
	self assert: #[144 31 160] asString asPDF pdfHexSource = '<901FA0>'.
	self assert: 'This String is longer and breaks into lines' asPDF pdfHexSource = ('<5468697320537472696E67206973206C6F6E67657220616E6420627265616B73' , self stringLf , '20696E746F206C696E6573>')
]

{ #category : #tests }
PtStringTests >> testStringWriteOctalCharacters [
	self assert: (PtFile readTesterOn: '(This string contains \245two octal characters\307.)') readObject pdfSource = '(This string contains \245two octal characters\307.)'.
	self assert: (String
		with: 5 asCharacter
		with: $3) asPDF pdfSource = '(\0053)'.
	self assert: (PtPDF String content: #[128]) pdfSource = '(\200)'.
	self assert: (PtPDF String content: #[128]) class = PtPDF String.
	self assert: (String withAll: 'äöüßÄÖÜ') asPDF pdfSource = '(\344\366\374\337\304\326\334)'
]

{ #category : #tests }
PtStringTests >> testStringWriteParenthesis [
	self assert: 'Strings may contain balanced parentheses ( ) and special characters ( * ! & } ^ % and so on ).' asPDF pdfSource = '(Strings may contain balanced parentheses ( ) and special characters ( * ! & } ^ % and so on ).)'.
	self assert: 'It has zero ( 0 ) length.' asPDF pdfSource = '(It has zero ( 0 ) length.)'.
	self assert: 'Unbalanced parenthesis are quoted (.' asPDF pdfSource = '(Unbalanced parenthesis are quoted \(.)'.
	self assert: 'Unbalanced parenthesis are quoted ).' asPDF pdfSource = '(Unbalanced parenthesis are quoted \).)'.
	self assert: 'Unbalanced parenthesis (...)) quoted.' asPDF pdfSource = '(Unbalanced parenthesis \(...\)\) quoted.)'.
	self assert: 'Unbalanced parenthesis (((...)) quoted.' asPDF pdfSource = '(Unbalanced parenthesis \(\(\(...\)\) quoted.)'
]

{ #category : #tests }
PtStringTests >> testTextstring [
	self assert: (((PtPDF classAt: #Textstring) fromString: 'abc € § ß 123') isKindOf: (PtPDF classAt: #Textstring)).
	self assert: ((PtPDF classAt: #Textstring) content: #[26 31 128 129 130 131 132 133 134 136 137 139 140 141 142 143 144 145 146 150 151 152 157 160]) asString = 'ˆ˜•†‡…—–ƒ‹›‰„“”‘’‚™ŒŠŸš€'.
	self assert: ((PtPDF classAt: #Textstring) fromString: 'ˆ˜•†‡…—–ƒ‹›‰„“”‘’‚™ŒŠŸš€') content = #[26 31 128 129 130 131 132 133 134 136 137 139 140 141 142 143 144 145 146 150 151 152 157 160]
]

{ #category : #tests }
PtStringTests >> testTextstringUnicode [
	self assert: (#[254 255 0 84 0 101 0 120 0 116 0 32 0 66 0 111 0 120 0 58] asString asPDF isKindOf: (PtPDF classAt: #Textstring)).
	self assert: #[254 255 0 84 0 101 0 120 0 116 0 32 0 66 0 111 0 120 0 58] asString asPDF asString = 'Text Box:'.
	self assert: (((String with: 173 asCharacter with: 16rae asCharacter) , 'Text Box:') asPDF isKindOf: (PtPDF classAt: #EncodedString)).
	self assert: ((String with: 173 asCharacter with: 16rae asCharacter) , 'Text Box:') asPDF content = #[173 174 84 101 120 116 32 66 111 120 58]
]
