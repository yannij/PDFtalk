Extension { #name : #PSBfMappings }

{ #category : #'*PostScript-CIDInit Testing-test instances' }
PSBfMappings class >> example [
	^self
		fromMappings: ((OrderedCollection new)
			add: (PSCode bytes: #[0 3]) --> 32;
			add: (PSCode bytes: #[0 20]) --> 49;
			add: (PSCode bytes: #[0 36]) --> 65;
			add: (PSCode bytes: #[0 38]) --> 67;
			add: (PSCode bytes: #[0 39]) --> 68;
			add: (PSCode bytes: #[0 40]) --> 69;
			add: (PSCode bytes: #[0 42]) --> 71;
			add: (PSCode bytes: #[0 43]) --> 72;
			add: (PSCode bytes: #[0 46]) --> 75;
			add: (PSCode bytes: #[0 47]) --> 76;
			add: (PSCode bytes: #[0 48]) --> 77;
			add: (PSCode bytes: #[0 49]) --> 78;
			add: (PSCode bytes: #[0 51]) --> 80;
			add: (PSCode bytes: #[0 53]) --> 82;
			add: (PSCode bytes: #[0 54]) --> 83;
			add: (PSCode bytes: #[0 55]) --> 84;
			add: (PSCode bytes: #[0 56]) --> 85;
			add: (PSCode bytes: #[0 57]) --> 86;
			add: (PSCode bytes: #[0 59]) --> 88;
			add: (PSCode bytes: #[0 60]) --> 89;
			add: (PSCode bytes: #[0 66]) --> 95;
			add: (PSCode bytes: #[0 68]) --> 97;
			add: (PSCode bytes: #[0 69]) --> 98;
			add: (PSCode bytes: #[0 70]) --> 99;
			add: (PSCode bytes: #[0 71]) --> 100;
			add: (PSCode bytes: #[0 72]) --> 101;
			add: (PSCode bytes: #[0 73]) --> 102;
			add: (PSCode bytes: #[0 74]) --> 103;
			add: (PSCode bytes: #[0 75]) --> 104;
			add: (PSCode bytes: #[0 76]) --> 105;
			add: (PSCode bytes: #[0 79]) --> 108;
			add: (PSCode bytes: #[0 80]) --> 109;
			add: (PSCode bytes: #[0 81]) --> 110;
			add: (PSCode bytes: #[0 82]) --> 111;
			add: (PSCode bytes: #[0 83]) --> 112;
			add: (PSCode bytes: #[0 85]) --> 114;
			add: (PSCode bytes: #[0 86]) --> 115;
			add: (PSCode bytes: #[0 87]) --> 116;
			add: (PSCode bytes: #[0 88]) --> 117;
			add: (PSCode bytes: #[0 89]) --> 118;
			add: (PSCode bytes: #[0 90]) --> 119;
			add: (PSCode bytes: #[0 91]) --> 120;
			add: (PSCode bytes: #[0 92]) --> 121;
			yourself)
		in: (Array with: ((PSCode bytes: #[0 0]) to: (PSCode bytes: #[0 255])))
]

{ #category : #'*PostScript-CIDInit Testing-test instances' }
PSBfMappings class >> exampleFromWrongCodespace [
	^PSBfMappings
		fromMappings: ((OrderedCollection new: 11)
			add: (PSCode bytes: #[48]) --> 48;
			add: (PSCode bytes: #[49]) --> 49;
			add: (PSCode bytes: #[50]) --> 50;
			add: (PSCode bytes: #[51]) --> 51;
			add: (PSCode bytes: #[52]) --> 52;
			add: (PSCode bytes: #[53]) --> 53;
			add: (PSCode bytes: #[54]) --> 54;
			add: (PSCode bytes: #[55]) --> 55;
			add: (PSCode bytes: #[56]) --> 56;
			add: (PSCode bytes: #[57]) --> 57;
			add: (PSCode bytes: #[0 32]) --> 32;
			yourself)
		in: (Array with: ((PSCode bytes: #[0 0]) to: (PSCode bytes: #[255 255])))
]

{ #category : #'*PostScript-CIDInit Testing-test instances' }
PSBfMappings class >> exampleFromWrongHebrewText [
	"https://stackoverflow.com/questions/27252359/pdf-hebrew-convert-issue"

	| source |
	source := '/CIDInit /ProcSet findresource begin
12 dict begin
begincmap
/CMapName /WrongMapping def
/CMapType 2 def
1 begincodespacerange
<0000> <FFFF>
endcodespacerange
2 beginbfchar
<0003> <0020>
<0010> <002D>
endbfchar
1 beginbfrange
<0014> <001A> [<0036> <0031> <0034> <0034> <0037> <0031> <0034>]
endbfrange
endcmap CMapName currentdict /CMap defineresource pop end end'.
	^PSCMap newWith: (((PSInterpreter run: source) resources at: #CMap) at: #WrongMapping)
]

{ #category : #'*PostScript-CIDInit Testing-test instances' }
PSBfMappings class >> exampleOnlyChars [
	^PSBfMappings
		fromMappings: ((OrderedCollection new: 43)
			add: (PSCode bytes: #[0 3]) --> 32;
			add: (PSCode bytes: #[0 20]) --> 49;
			add: (PSCode bytes: #[0 36]) --> 65;
			add: (PSCode bytes: #[0 38]) --> 67;
			add: (PSCode bytes: #[0 39]) --> 68;
			add: (PSCode bytes: #[0 40]) --> 69;
			add: (PSCode bytes: #[0 42]) --> 71;
			add: (PSCode bytes: #[0 43]) --> 72;
			add: (PSCode bytes: #[0 46]) --> 75;
			add: (PSCode bytes: #[0 47]) --> 76;
			add: (PSCode bytes: #[0 48]) --> 77;
			add: (PSCode bytes: #[0 49]) --> 78;
			add: (PSCode bytes: #[0 51]) --> 80;
			add: (PSCode bytes: #[0 53]) --> 82;
			add: (PSCode bytes: #[0 54]) --> 83;
			add: (PSCode bytes: #[0 55]) --> 84;
			add: (PSCode bytes: #[0 56]) --> 85;
			add: (PSCode bytes: #[0 57]) --> 86;
			add: (PSCode bytes: #[0 59]) --> 88;
			add: (PSCode bytes: #[0 60]) --> 89;
			add: (PSCode bytes: #[0 66]) --> 95;
			add: (PSCode bytes: #[0 68]) --> 97;
			add: (PSCode bytes: #[0 69]) --> 98;
			add: (PSCode bytes: #[0 70]) --> 99;
			add: (PSCode bytes: #[0 71]) --> 100;
			add: (PSCode bytes: #[0 72]) --> 101;
			add: (PSCode bytes: #[0 73]) --> 102;
			add: (PSCode bytes: #[0 74]) --> 103;
			add: (PSCode bytes: #[0 75]) --> 104;
			add: (PSCode bytes: #[0 76]) --> 105;
			add: (PSCode bytes: #[0 79]) --> 108;
			add: (PSCode bytes: #[0 80]) --> 109;
			add: (PSCode bytes: #[0 81]) --> 110;
			add: (PSCode bytes: #[0 82]) --> 111;
			add: (PSCode bytes: #[0 83]) --> 112;
			add: (PSCode bytes: #[0 85]) --> 114;
			add: (PSCode bytes: #[0 86]) --> 115;
			add: (PSCode bytes: #[0 87]) --> 116;
			add: (PSCode bytes: #[0 88]) --> 117;
			add: (PSCode bytes: #[0 89]) --> 118;
			add: (PSCode bytes: #[0 90]) --> 119;
			add: (PSCode bytes: #[0 91]) --> 120;
			add: (PSCode bytes: #[0 92]) --> 121;
			yourself)
		in: (Array with: ((PSCode bytes: #[0 0]) to: (PSCode bytes: #[255 255])))
]
