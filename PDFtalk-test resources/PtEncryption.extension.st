Extension { #name : #PtEncryption }

{ #category : #'*PDFtalk-test resources-test instances' }
PtEncryption class >> example [
	^(PtFile readTesterOn: '<<
	/Filter 	/MySecurityHandlerName
	/V 4 								% Version 4: allow crypt filters
	/CF 								% List of crypt filters
		<< 	/MyFilter0
			<< 	/Type /CryptFilter
				/CFM /V2 	>> 			% Uses the standard algorithm
		>>
	/StrF /MyFilter0 						% Strings are decrypted using /MyFilter0
	/StmF /MyFilter0 					% Streams are decrypted using /MyFilter0
	 									% Private data for /MySecurityHandlerName
	/MyUnsecureKey (12345678)
	/EncryptMetadata false
>>') readObject
]
