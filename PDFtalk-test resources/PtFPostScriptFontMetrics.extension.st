Extension { #name : #PtFPostScriptFontMetrics }

{ #category : #'*PDFtalk-test resources-test instances' }
PtFPostScriptFontMetrics class >> example [
	^PtFPostScriptFontMetrics
		header: (PtFPFMHeader fromBytes: #[67 111 112 121 114 105 103 104 116 32 49 57 57 55 44 32 49 57 57 57 44 32 50 48 48 50 44 32 50 48 48 54 32 98 121 32 76 117 99 91 97 115 93 32 100 101 32 71 114 111 111 116 46 32 65 108 108 0 0 0 129 0 10 0 44 1 44 1 96 3 62 0 0 0 0 0 0 144 1 0 0 0 38 4 33 126 1 1 4 5 255 27 0 0 0])
		extTextMetrics: (PtFExtTextMetrics fromBytes: #[52 0 240 0 0 0 232 3 3 0 232 3 232 3 32 3 244 1 188 2 200 0 0 0 188 2 156 255 100 0 100 0 177 0 38 0 50 0 100 0 25 0 25 0 231 0 38 0])
		faceName: 'Taz LT4 SemiLight'
		driverInfo: 'Taz-LT4SemiLight'
		extentTable: #(400 219 382 400 382 400 400 400 218 382 382 382 382 382 382 382 382 382 382 382 263 482 482 369 240 450 343 214 290 440 607 443 688 747 246 322 322 445 550 264 258 256 410 520 520 520 520 520 520 520 520 520 520 310 311 550 550 550 425 951 517 509 482 574 429 409 542 594 233 326 459 358 757 592 621 501 621 516 458 418 588 514 787 506 465 450 363 410 363 550 500 352 479 488 374 489 467 265 488 499 218 218 416 218 773 499 501 488 488 307 359 295 499 401 654 430 394 343 400 231 400 550 382 550 382 264 442 458 691 500 500 400 1019 458 331 740 382 382 382 382 253 253 445 445 550 500 1000 400 623 359 331 798 382 382 465 214 290 420 500 550 550 285 550 400 787 381 519 550 550 605 400 464 550 442 438 400 550 560 175 380 310 378 519 678 688 683 425 517 517 517 517 517 517 658 482 429 429 429 429 233 233 233 233 584 592 621 621 621 621 621 550 628 588 588 588 588 465 501 487 479 479 479 479 479 479 753 374 467 467 467 467 218 218 218 218 473 499 501 501 501 501 501 550 506 499 499 499 499 394 488 394)
		kerningPairs: ((OrderedCollection new: 698)
			add: (PtFPairKern first: 65 second: 28 kernAmount: -6);
			add: (PtFPairKern first: 67 second: 28 kernAmount: -5);
			add: (PtFPairKern first: 90 second: 28 kernAmount: -10);
			add: (PtFPairKern first: 65 second: 29 kernAmount: -10);
			add: (PtFPairKern first: 90 second: 29 kernAmount: -10);
			add: (PtFPairKern first: 132 second: 29 kernAmount: -20);
			add: (PtFPairKern first: 89 second: 31 kernAmount: -28);
			add: (PtFPairKern first: 102 second: 33 kernAmount: 10);
			add: (PtFPairKern first: 44 second: 34 kernAmount: -38);
			add: (PtFPairKern first: 46 second: 34 kernAmount: -48);
			add: (PtFPairKern first: 65 second: 34 kernAmount: -45);
			add: (PtFPairKern first: 65 second: 42 kernAmount: -56);
			add: (PtFPairKern first: 29 second: 44 kernAmount: -30);
			add: (PtFPairKern first: 45 second: 44 kernAmount: -44);
			add: (PtFPairKern first: 66 second: 44 kernAmount: -24);
			add: (PtFPairKern first: 68 second: 44 kernAmount: -59);
			add: (PtFPairKern first: 70 second: 44 kernAmount: -86);
			add: (PtFPairKern first: 74 second: 44 kernAmount: -55);
			add: (PtFPairKern first: 79 second: 44 kernAmount: -45);
			add: (PtFPairKern first: 80 second: 44 kernAmount: -147);
			add: (PtFPairKern first: 84 second: 44 kernAmount: -89);
			add: (PtFPairKern first: 85 second: 44 kernAmount: -48);
			add: (PtFPairKern first: 86 second: 44 kernAmount: -95);
			add: (PtFPairKern first: 87 second: 44 kernAmount: -62);
			add: (PtFPairKern first: 89 second: 44 kernAmount: -119);
			add: (PtFPairKern first: 98 second: 44 kernAmount: -20);
			add: (PtFPairKern first: 101 second: 44 kernAmount: -26);
			add: (PtFPairKern first: 102 second: 44 kernAmount: -55);
			add: (PtFPairKern first: 111 second: 44 kernAmount: -42);
			add: (PtFPairKern first: 114 second: 44 kernAmount: -95);
			add: (PtFPairKern first: 115 second: 44 kernAmount: -27);
			add: (PtFPairKern first: 118 second: 44 kernAmount: -87);
			add: (PtFPairKern first: 119 second: 44 kernAmount: -75);
			add: (PtFPairKern first: 121 second: 44 kernAmount: -77);
			add: (PtFPairKern first: 147 second: 44 kernAmount: -118);
			add: (PtFPairKern first: 148 second: 44 kernAmount: -127);
			add: (PtFPairKern first: 28 second: 45 kernAmount: -50);
			add: (PtFPairKern first: 44 second: 45 kernAmount: -50);
			add: (PtFPairKern first: 46 second: 45 kernAmount: -65);
			add: (PtFPairKern first: 65 second: 45 kernAmount: -17);
			add: (PtFPairKern first: 67 second: 45 kernAmount: -65);
			add: (PtFPairKern first: 69 second: 45 kernAmount: -8);
			add: (PtFPairKern first: 70 second: 45 kernAmount: -8);
			add: (PtFPairKern first: 75 second: 45 kernAmount: -59);
			add: (PtFPairKern first: 76 second: 45 kernAmount: -50);
			add: (PtFPairKern first: 82 second: 45 kernAmount: -45);
			add: (PtFPairKern first: 84 second: 45 kernAmount: -46);
			add: (PtFPairKern first: 86 second: 45 kernAmount: -30);
			add: (PtFPairKern first: 87 second: 45 kernAmount: -22);
			add: (PtFPairKern first: 88 second: 45 kernAmount: -38);
			add: (PtFPairKern first: 89 second: 45 kernAmount: -84);
			add: (PtFPairKern first: 90 second: 45 kernAmount: -56);
			add: (PtFPairKern first: 99 second: 45 kernAmount: -28);
			add: (PtFPairKern first: 102 second: 45 kernAmount: -35);
			add: (PtFPairKern first: 107 second: 45 kernAmount: -45);
			add: (PtFPairKern first: 114 second: 45 kernAmount: -27);
			add: (PtFPairKern first: 115 second: 45 kernAmount: -11);
			add: (PtFPairKern first: 116 second: 45 kernAmount: -25);
			add: (PtFPairKern first: 118 second: 45 kernAmount: -7);
			add: (PtFPairKern first: 119 second: 45 kernAmount: -7);
			add: (PtFPairKern first: 120 second: 45 kernAmount: -31);
			add: (PtFPairKern first: 121 second: 45 kernAmount: -5);
			add: (PtFPairKern first: 122 second: 45 kernAmount: -26);
			add: (PtFPairKern first: 29 second: 46 kernAmount: -20);
			add: (PtFPairKern first: 45 second: 46 kernAmount: -30);
			add: (PtFPairKern first: 66 second: 46 kernAmount: -20);
			add: (PtFPairKern first: 68 second: 46 kernAmount: -47);
			add: (PtFPairKern first: 70 second: 46 kernAmount: -79);
			add: (PtFPairKern first: 74 second: 46 kernAmount: -53);
			add: (PtFPairKern first: 79 second: 46 kernAmount: -33);
			add: (PtFPairKern first: 80 second: 46 kernAmount: -132);
			add: (PtFPairKern first: 83 second: 46 kernAmount: -7);
			add: (PtFPairKern first: 84 second: 46 kernAmount: -91);
			add: (PtFPairKern first: 85 second: 46 kernAmount: -40);
			add: (PtFPairKern first: 86 second: 46 kernAmount: -94);
			add: (PtFPairKern first: 87 second: 46 kernAmount: -59);
			add: (PtFPairKern first: 89 second: 46 kernAmount: -109);
			add: (PtFPairKern first: 101 second: 46 kernAmount: -23);
			add: (PtFPairKern first: 102 second: 46 kernAmount: -50);
			add: (PtFPairKern first: 111 second: 46 kernAmount: -36);
			add: (PtFPairKern first: 114 second: 46 kernAmount: -85);
			add: (PtFPairKern first: 115 second: 46 kernAmount: -20);
			add: (PtFPairKern first: 118 second: 46 kernAmount: -78);
			add: (PtFPairKern first: 119 second: 46 kernAmount: -67);
			add: (PtFPairKern first: 121 second: 46 kernAmount: -67);
			add: (PtFPairKern first: 147 second: 46 kernAmount: -118);
			add: (PtFPairKern first: 148 second: 46 kernAmount: -127);
			add: (PtFPairKern first: 47 second: 47 kernAmount: -134);
			add: (PtFPairKern first: 70 second: 47 kernAmount: -61);
			add: (PtFPairKern first: 74 second: 47 kernAmount: -24);
			add: (PtFPairKern first: 80 second: 47 kernAmount: -81);
			add: (PtFPairKern first: 83 second: 47 kernAmount: -11);
			add: (PtFPairKern first: 84 second: 47 kernAmount: -67);
			add: (PtFPairKern first: 85 second: 47 kernAmount: -31);
			add: (PtFPairKern first: 86 second: 47 kernAmount: -68);
			add: (PtFPairKern first: 87 second: 47 kernAmount: -45);
			add: (PtFPairKern first: 89 second: 47 kernAmount: -69);
			add: (PtFPairKern first: 102 second: 47 kernAmount: -34);
			add: (PtFPairKern first: 114 second: 47 kernAmount: -25);
			add: (PtFPairKern first: 118 second: 47 kernAmount: -23);
			add: (PtFPairKern first: 119 second: 47 kernAmount: -15);
			add: (PtFPairKern first: 84 second: 58 kernAmount: -30);
			add: (PtFPairKern first: 86 second: 58 kernAmount: -25);
			add: (PtFPairKern first: 87 second: 58 kernAmount: -15);
			add: (PtFPairKern first: 89 second: 58 kernAmount: -44);
			add: (PtFPairKern first: 65 second: 63 kernAmount: -20);
			add: (PtFPairKern first: 84 second: 63 kernAmount: 16);
			add: (PtFPairKern first: 102 second: 63 kernAmount: 10);
			add: (PtFPairKern first: 45 second: 65 kernAmount: -17);
			add: (PtFPairKern first: 47 second: 65 kernAmount: -61);
			add: (PtFPairKern first: 66 second: 65 kernAmount: -25);
			add: (PtFPairKern first: 67 second: 65 kernAmount: -13);
			add: (PtFPairKern first: 68 second: 65 kernAmount: -30);
			add: (PtFPairKern first: 69 second: 65 kernAmount: -6);
			add: (PtFPairKern first: 70 second: 65 kernAmount: -62);
			add: (PtFPairKern first: 71 second: 65 kernAmount: -20);
			add: (PtFPairKern first: 74 second: 65 kernAmount: -29);
			add: (PtFPairKern first: 75 second: 65 kernAmount: -10);
			add: (PtFPairKern first: 79 second: 65 kernAmount: -24);
			add: (PtFPairKern first: 80 second: 65 kernAmount: -61);
			add: (PtFPairKern first: 82 second: 65 kernAmount: -34);
			add: (PtFPairKern first: 83 second: 65 kernAmount: -10);
			add: (PtFPairKern first: 84 second: 65 kernAmount: -71);
			add: (PtFPairKern first: 85 second: 65 kernAmount: -27);
			add: (PtFPairKern first: 86 second: 65 kernAmount: -65);
			add: (PtFPairKern first: 87 second: 65 kernAmount: -48);
			add: (PtFPairKern first: 88 second: 65 kernAmount: -15);
			add: (PtFPairKern first: 89 second: 65 kernAmount: -87);
			add: (PtFPairKern first: 90 second: 65 kernAmount: -26);
			add: (PtFPairKern first: 147 second: 65 kernAmount: -78);
			add: (PtFPairKern first: 148 second: 65 kernAmount: -90);
			add: (PtFPairKern first: 28 second: 74 kernAmount: 18);
			add: (PtFPairKern first: 45 second: 74 kernAmount: -37);
			add: (PtFPairKern first: 47 second: 74 kernAmount: -27);
			add: (PtFPairKern first: 65 second: 74 kernAmount: 4);
			add: (PtFPairKern first: 66 second: 74 kernAmount: -14);
			add: (PtFPairKern first: 68 second: 74 kernAmount: -22);
			add: (PtFPairKern first: 70 second: 74 kernAmount: -53);
			add: (PtFPairKern first: 74 second: 74 kernAmount: -14);
			add: (PtFPairKern first: 76 second: 74 kernAmount: 18);
			add: (PtFPairKern first: 79 second: 74 kernAmount: -29);
			add: (PtFPairKern first: 80 second: 74 kernAmount: -61);
			add: (PtFPairKern first: 84 second: 74 kernAmount: -42);
			add: (PtFPairKern first: 85 second: 74 kernAmount: -17);
			add: (PtFPairKern first: 86 second: 74 kernAmount: -68);
			add: (PtFPairKern first: 87 second: 74 kernAmount: -45);
			add: (PtFPairKern first: 89 second: 74 kernAmount: -67);
			add: (PtFPairKern first: 147 second: 74 kernAmount: -78);
			add: (PtFPairKern first: 148 second: 74 kernAmount: -85);
			add: (PtFPairKern first: 84 second: 77 kernAmount: -8);
			add: (PtFPairKern first: 86 second: 77 kernAmount: -8);
			add: (PtFPairKern first: 89 second: 77 kernAmount: -26);
			add: (PtFPairKern first: 148 second: 77 kernAmount: -18);
			add: (PtFPairKern first: 28 second: 79 kernAmount: -25);
			add: (PtFPairKern first: 46 second: 79 kernAmount: -27);
			add: (PtFPairKern first: 47 second: 79 kernAmount: -27);
			add: (PtFPairKern first: 65 second: 79 kernAmount: -23);
			add: (PtFPairKern first: 67 second: 79 kernAmount: -24);
			add: (PtFPairKern first: 69 second: 79 kernAmount: -4);
			add: (PtFPairKern first: 75 second: 79 kernAmount: -35);
			add: (PtFPairKern first: 76 second: 79 kernAmount: -31);
			add: (PtFPairKern first: 82 second: 79 kernAmount: -26);
			add: (PtFPairKern first: 83 second: 79 kernAmount: -7);
			add: (PtFPairKern first: 84 second: 79 kernAmount: -37);
			add: (PtFPairKern first: 86 second: 79 kernAmount: -26);
			add: (PtFPairKern first: 87 second: 79 kernAmount: -12);
			add: (PtFPairKern first: 88 second: 79 kernAmount: -48);
			add: (PtFPairKern first: 89 second: 79 kernAmount: -49);
			add: (PtFPairKern first: 90 second: 79 kernAmount: -39);
			add: (PtFPairKern first: 132 second: 79 kernAmount: -31);
			add: (PtFPairKern first: 147 second: 79 kernAmount: -34);
			add: (PtFPairKern first: 148 second: 79 kernAmount: -49);
			add: (PtFPairKern first: 191 second: 79 kernAmount: -17);
			add: (PtFPairKern first: 28 second: 83 kernAmount: -17);
			add: (PtFPairKern first: 45 second: 83 kernAmount: -24);
			add: (PtFPairKern first: 65 second: 83 kernAmount: -22);
			add: (PtFPairKern first: 66 second: 83 kernAmount: -7);
			add: (PtFPairKern first: 67 second: 83 kernAmount: -12);
			add: (PtFPairKern first: 69 second: 83 kernAmount: -4);
			add: (PtFPairKern first: 70 second: 83 kernAmount: -11);
			add: (PtFPairKern first: 75 second: 83 kernAmount: -15);
			add: (PtFPairKern first: 76 second: 83 kernAmount: -17);
			add: (PtFPairKern first: 79 second: 83 kernAmount: -14);
			add: (PtFPairKern first: 84 second: 83 kernAmount: -11);
			add: (PtFPairKern first: 86 second: 83 kernAmount: -15);
			add: (PtFPairKern first: 87 second: 83 kernAmount: -3);
			add: (PtFPairKern first: 88 second: 83 kernAmount: -21);
			add: (PtFPairKern first: 89 second: 83 kernAmount: -27);
			add: (PtFPairKern first: 90 second: 83 kernAmount: -16);
			add: (PtFPairKern first: 132 second: 83 kernAmount: -12);
			add: (PtFPairKern first: 147 second: 83 kernAmount: -15);
			add: (PtFPairKern first: 148 second: 83 kernAmount: -20);
			add: (PtFPairKern first: 191 second: 83 kernAmount: -9);
			add: (PtFPairKern first: 28 second: 84 kernAmount: -62);
			add: (PtFPairKern first: 44 second: 84 kernAmount: -43);
			add: (PtFPairKern first: 45 second: 84 kernAmount: -34);
			add: (PtFPairKern first: 46 second: 84 kernAmount: -47);
			add: (PtFPairKern first: 47 second: 84 kernAmount: 20);
			add: (PtFPairKern first: 65 second: 84 kernAmount: -62);
			add: (PtFPairKern first: 66 second: 84 kernAmount: -21);
			add: (PtFPairKern first: 68 second: 84 kernAmount: -34);
			add: (PtFPairKern first: 71 second: 84 kernAmount: -12);
			add: (PtFPairKern first: 76 second: 84 kernAmount: -69);
			add: (PtFPairKern first: 77 second: 84 kernAmount: -13);
			add: (PtFPairKern first: 79 second: 84 kernAmount: -24);
			add: (PtFPairKern first: 81 second: 84 kernAmount: -17);
			add: (PtFPairKern first: 84 second: 84 kernAmount: 6);
			add: (PtFPairKern first: 102 second: 84 kernAmount: 28);
			add: (PtFPairKern first: 132 second: 84 kernAmount: -79);
			add: (PtFPairKern first: 147 second: 84 kernAmount: 19);
			add: (PtFPairKern first: 148 second: 84 kernAmount: 20);
			add: (PtFPairKern first: 171 second: 84 kernAmount: -30);
			add: (PtFPairKern first: 187 second: 84 kernAmount: -26);
			add: (PtFPairKern first: 191 second: 84 kernAmount: -34);
			add: (PtFPairKern first: 28 second: 85 kernAmount: -20);
			add: (PtFPairKern first: 46 second: 85 kernAmount: -28);
			add: (PtFPairKern first: 65 second: 85 kernAmount: -24);
			add: (PtFPairKern first: 75 second: 85 kernAmount: -13);
			add: (PtFPairKern first: 76 second: 85 kernAmount: -20);
			add: (PtFPairKern first: 82 second: 85 kernAmount: -14);
			add: (PtFPairKern first: 88 second: 85 kernAmount: -18);
			add: (PtFPairKern first: 132 second: 85 kernAmount: -25);
			add: (PtFPairKern first: 28 second: 86 kernAmount: -61);
			add: (PtFPairKern first: 44 second: 86 kernAmount: -53);
			add: (PtFPairKern first: 45 second: 86 kernAmount: -23);
			add: (PtFPairKern first: 46 second: 86 kernAmount: -59);
			add: (PtFPairKern first: 47 second: 86 kernAmount: 20);
			add: (PtFPairKern first: 65 second: 86 kernAmount: -60);
			add: (PtFPairKern first: 66 second: 86 kernAmount: -19);
			add: (PtFPairKern first: 68 second: 86 kernAmount: -21);
			add: (PtFPairKern first: 71 second: 86 kernAmount: -16);
			add: (PtFPairKern first: 75 second: 86 kernAmount: -13);
			add: (PtFPairKern first: 76 second: 86 kernAmount: -70);
			add: (PtFPairKern first: 77 second: 86 kernAmount: -13);
			add: (PtFPairKern first: 79 second: 86 kernAmount: -15);
			add: (PtFPairKern first: 80 second: 86 kernAmount: -6);
			add: (PtFPairKern first: 81 second: 86 kernAmount: -9);
			add: (PtFPairKern first: 82 second: 86 kernAmount: -15);
			add: (PtFPairKern first: 83 second: 86 kernAmount: -19);
			add: (PtFPairKern first: 88 second: 86 kernAmount: -24);
			add: (PtFPairKern first: 90 second: 86 kernAmount: -11);
			add: (PtFPairKern first: 102 second: 86 kernAmount: 12);
			add: (PtFPairKern first: 132 second: 86 kernAmount: -91);
			add: (PtFPairKern first: 171 second: 86 kernAmount: -12);
			add: (PtFPairKern first: 187 second: 86 kernAmount: -10);
			add: (PtFPairKern first: 191 second: 86 kernAmount: -28);
			add: (PtFPairKern first: 28 second: 87 kernAmount: -48);
			add: (PtFPairKern first: 44 second: 87 kernAmount: -30);
			add: (PtFPairKern first: 45 second: 87 kernAmount: -4);
			add: (PtFPairKern first: 46 second: 87 kernAmount: -45);
			add: (PtFPairKern first: 47 second: 87 kernAmount: 20);
			add: (PtFPairKern first: 65 second: 87 kernAmount: -37);
			add: (PtFPairKern first: 66 second: 87 kernAmount: -4);
			add: (PtFPairKern first: 68 second: 87 kernAmount: -7);
			add: (PtFPairKern first: 71 second: 87 kernAmount: -5);
			add: (PtFPairKern first: 76 second: 87 kernAmount: -49);
			add: (PtFPairKern first: 79 second: 87 kernAmount: -8);
			add: (PtFPairKern first: 82 second: 87 kernAmount: -3);
			add: (PtFPairKern first: 90 second: 87 kernAmount: -6);
			add: (PtFPairKern first: 102 second: 87 kernAmount: 10);
			add: (PtFPairKern first: 132 second: 87 kernAmount: -50);
			add: (PtFPairKern first: 191 second: 87 kernAmount: -25);
			add: (PtFPairKern first: 28 second: 88 kernAmount: -15);
			add: (PtFPairKern first: 45 second: 88 kernAmount: -35);
			add: (PtFPairKern first: 65 second: 88 kernAmount: -13);
			add: (PtFPairKern first: 66 second: 88 kernAmount: -37);
			add: (PtFPairKern first: 67 second: 88 kernAmount: -10);
			add: (PtFPairKern first: 68 second: 88 kernAmount: -38);
			add: (PtFPairKern first: 70 second: 88 kernAmount: -29);
			add: (PtFPairKern first: 71 second: 88 kernAmount: -24);
			add: (PtFPairKern first: 74 second: 88 kernAmount: -17);
			add: (PtFPairKern first: 76 second: 88 kernAmount: -14);
			add: (PtFPairKern first: 79 second: 88 kernAmount: -53);
			add: (PtFPairKern first: 80 second: 88 kernAmount: -48);
			add: (PtFPairKern first: 82 second: 88 kernAmount: -26);
			add: (PtFPairKern first: 83 second: 88 kernAmount: -19);
			add: (PtFPairKern first: 85 second: 88 kernAmount: -15);
			add: (PtFPairKern first: 86 second: 88 kernAmount: -6);
			add: (PtFPairKern first: 88 second: 88 kernAmount: -25);
			add: (PtFPairKern first: 89 second: 88 kernAmount: -24);
			add: (PtFPairKern first: 90 second: 88 kernAmount: -27);
			add: (PtFPairKern first: 28 second: 89 kernAmount: -71);
			add: (PtFPairKern first: 44 second: 89 kernAmount: -41);
			add: (PtFPairKern first: 45 second: 89 kernAmount: -47);
			add: (PtFPairKern first: 46 second: 89 kernAmount: -66);
			add: (PtFPairKern first: 47 second: 89 kernAmount: 20);
			add: (PtFPairKern first: 65 second: 89 kernAmount: -86);
			add: (PtFPairKern first: 66 second: 89 kernAmount: -40);
			add: (PtFPairKern first: 68 second: 89 kernAmount: -48);
			add: (PtFPairKern first: 71 second: 89 kernAmount: -23);
			add: (PtFPairKern first: 74 second: 89 kernAmount: -12);
			add: (PtFPairKern first: 75 second: 89 kernAmount: -10);
			add: (PtFPairKern first: 76 second: 89 kernAmount: -80);
			add: (PtFPairKern first: 77 second: 89 kernAmount: -32);
			add: (PtFPairKern first: 79 second: 89 kernAmount: -43);
			add: (PtFPairKern first: 80 second: 89 kernAmount: -16);
			add: (PtFPairKern first: 81 second: 89 kernAmount: -25);
			add: (PtFPairKern first: 82 second: 89 kernAmount: -31);
			add: (PtFPairKern first: 83 second: 89 kernAmount: -24);
			add: (PtFPairKern first: 88 second: 89 kernAmount: -34);
			add: (PtFPairKern first: 90 second: 89 kernAmount: -11);
			add: (PtFPairKern first: 132 second: 89 kernAmount: -108);
			add: (PtFPairKern first: 171 second: 89 kernAmount: -37);
			add: (PtFPairKern first: 187 second: 89 kernAmount: -37);
			add: (PtFPairKern first: 191 second: 89 kernAmount: -42);
			add: (PtFPairKern first: 28 second: 90 kernAmount: -17);
			add: (PtFPairKern first: 45 second: 90 kernAmount: -16);
			add: (PtFPairKern first: 65 second: 90 kernAmount: -14);
			add: (PtFPairKern first: 66 second: 90 kernAmount: -15);
			add: (PtFPairKern first: 68 second: 90 kernAmount: -31);
			add: (PtFPairKern first: 70 second: 90 kernAmount: -14);
			add: (PtFPairKern first: 71 second: 90 kernAmount: -14);
			add: (PtFPairKern first: 76 second: 90 kernAmount: -17);
			add: (PtFPairKern first: 79 second: 90 kernAmount: -28);
			add: (PtFPairKern first: 80 second: 90 kernAmount: -30);
			add: (PtFPairKern first: 82 second: 90 kernAmount: -21);
			add: (PtFPairKern first: 83 second: 90 kernAmount: -13);
			add: (PtFPairKern first: 86 second: 90 kernAmount: -9);
			add: (PtFPairKern first: 88 second: 90 kernAmount: -17);
			add: (PtFPairKern first: 89 second: 90 kernAmount: -10);
			add: (PtFPairKern first: 90 second: 90 kernAmount: -26);
			add: (PtFPairKern first: 67 second: 97 kernAmount: -8);
			add: (PtFPairKern first: 68 second: 97 kernAmount: -4);
			add: (PtFPairKern first: 70 second: 97 kernAmount: -28);
			add: (PtFPairKern first: 75 second: 97 kernAmount: -5);
			add: (PtFPairKern first: 80 second: 97 kernAmount: -13);
			add: (PtFPairKern first: 82 second: 97 kernAmount: -15);
			add: (PtFPairKern first: 84 second: 97 kernAmount: -75);
			add: (PtFPairKern first: 86 second: 97 kernAmount: -46);
			add: (PtFPairKern first: 87 second: 97 kernAmount: -24);
			add: (PtFPairKern first: 88 second: 97 kernAmount: -16);
			add: (PtFPairKern first: 89 second: 97 kernAmount: -68);
			add: (PtFPairKern first: 90 second: 97 kernAmount: -17);
			add: (PtFPairKern first: 98 second: 97 kernAmount: -7);
			add: (PtFPairKern first: 102 second: 97 kernAmount: -20);
			add: (PtFPairKern first: 107 second: 97 kernAmount: -12);
			add: (PtFPairKern first: 114 second: 97 kernAmount: -10);
			add: (PtFPairKern first: 118 second: 97 kernAmount: -9);
			add: (PtFPairKern first: 119 second: 97 kernAmount: -7);
			add: (PtFPairKern first: 120 second: 97 kernAmount: -12);
			add: (PtFPairKern first: 121 second: 97 kernAmount: -8);
			add: (PtFPairKern first: 122 second: 97 kernAmount: -5);
			add: (PtFPairKern first: 147 second: 97 kernAmount: -26);
			add: (PtFPairKern first: 148 second: 97 kernAmount: -42);
			add: (PtFPairKern first: 28 second: 100 kernAmount: -10);
			add: (PtFPairKern first: 29 second: 100 kernAmount: -10);
			add: (PtFPairKern first: 47 second: 100 kernAmount: -34);
			add: (PtFPairKern first: 65 second: 100 kernAmount: -4);
			add: (PtFPairKern first: 67 second: 100 kernAmount: -20);
			add: (PtFPairKern first: 70 second: 100 kernAmount: -21);
			add: (PtFPairKern first: 75 second: 100 kernAmount: -20);
			add: (PtFPairKern first: 76 second: 100 kernAmount: -10);
			add: (PtFPairKern first: 80 second: 100 kernAmount: -17);
			add: (PtFPairKern first: 82 second: 100 kernAmount: -39);
			add: (PtFPairKern first: 84 second: 100 kernAmount: -86);
			add: (PtFPairKern first: 86 second: 100 kernAmount: -48);
			add: (PtFPairKern first: 87 second: 100 kernAmount: -25);
			add: (PtFPairKern first: 88 second: 100 kernAmount: -40);
			add: (PtFPairKern first: 89 second: 100 kernAmount: -90);
			add: (PtFPairKern first: 90 second: 100 kernAmount: -43);
			add: (PtFPairKern first: 99 second: 100 kernAmount: -11);
			add: (PtFPairKern first: 102 second: 100 kernAmount: -28);
			add: (PtFPairKern first: 107 second: 100 kernAmount: -38);
			add: (PtFPairKern first: 114 second: 100 kernAmount: -25);
			add: (PtFPairKern first: 115 second: 100 kernAmount: -10);
			add: (PtFPairKern first: 116 second: 100 kernAmount: -24);
			add: (PtFPairKern first: 118 second: 100 kernAmount: -13);
			add: (PtFPairKern first: 119 second: 100 kernAmount: -12);
			add: (PtFPairKern first: 120 second: 100 kernAmount: -29);
			add: (PtFPairKern first: 121 second: 100 kernAmount: -11);
			add: (PtFPairKern first: 122 second: 100 kernAmount: -19);
			add: (PtFPairKern first: 132 second: 100 kernAmount: -17);
			add: (PtFPairKern first: 147 second: 100 kernAmount: -57);
			add: (PtFPairKern first: 148 second: 100 kernAmount: -71);
			add: (PtFPairKern first: 223 second: 100 kernAmount: -4);
			add: (PtFPairKern first: 29 second: 102 kernAmount: 16);
			add: (PtFPairKern first: 80 second: 102 kernAmount: 5);
			add: (PtFPairKern first: 88 second: 102 kernAmount: -12);
			add: (PtFPairKern first: 89 second: 102 kernAmount: -13);
			add: (PtFPairKern first: 114 second: 102 kernAmount: 15);
			add: (PtFPairKern first: 115 second: 102 kernAmount: -7);
			add: (PtFPairKern first: 132 second: 102 kernAmount: -20);
			add: (PtFPairKern first: 148 second: 102 kernAmount: -10);
			add: (PtFPairKern first: 223 second: 102 kernAmount: -7);
			add: (PtFPairKern first: 84 second: 109 kernAmount: -53);
			add: (PtFPairKern first: 86 second: 109 kernAmount: -21);
			add: (PtFPairKern first: 87 second: 109 kernAmount: -6);
			add: (PtFPairKern first: 88 second: 109 kernAmount: -22);
			add: (PtFPairKern first: 89 second: 109 kernAmount: -44);
			add: (PtFPairKern first: 90 second: 109 kernAmount: -20);
			add: (PtFPairKern first: 148 second: 109 kernAmount: -12);
			add: (PtFPairKern first: 28 second: 111 kernAmount: -10);
			add: (PtFPairKern first: 29 second: 111 kernAmount: -11);
			add: (PtFPairKern first: 47 second: 111 kernAmount: -34);
			add: (PtFPairKern first: 65 second: 111 kernAmount: -5);
			add: (PtFPairKern first: 67 second: 111 kernAmount: -21);
			add: (PtFPairKern first: 70 second: 111 kernAmount: -21);
			add: (PtFPairKern first: 75 second: 111 kernAmount: -20);
			add: (PtFPairKern first: 76 second: 111 kernAmount: -11);
			add: (PtFPairKern first: 80 second: 111 kernAmount: -17);
			add: (PtFPairKern first: 82 second: 111 kernAmount: -42);
			add: (PtFPairKern first: 84 second: 111 kernAmount: -86);
			add: (PtFPairKern first: 86 second: 111 kernAmount: -48);
			add: (PtFPairKern first: 87 second: 111 kernAmount: -26);
			add: (PtFPairKern first: 88 second: 111 kernAmount: -40);
			add: (PtFPairKern first: 89 second: 111 kernAmount: -88);
			add: (PtFPairKern first: 90 second: 111 kernAmount: -43);
			add: (PtFPairKern first: 99 second: 111 kernAmount: -12);
			add: (PtFPairKern first: 102 second: 111 kernAmount: -29);
			add: (PtFPairKern first: 107 second: 111 kernAmount: -39);
			add: (PtFPairKern first: 114 second: 111 kernAmount: -25);
			add: (PtFPairKern first: 115 second: 111 kernAmount: -10);
			add: (PtFPairKern first: 116 second: 111 kernAmount: -24);
			add: (PtFPairKern first: 118 second: 111 kernAmount: -14);
			add: (PtFPairKern first: 119 second: 111 kernAmount: -12);
			add: (PtFPairKern first: 120 second: 111 kernAmount: -29);
			add: (PtFPairKern first: 121 second: 111 kernAmount: -11);
			add: (PtFPairKern first: 122 second: 111 kernAmount: -19);
			add: (PtFPairKern first: 132 second: 111 kernAmount: -17);
			add: (PtFPairKern first: 147 second: 111 kernAmount: -55);
			add: (PtFPairKern first: 148 second: 111 kernAmount: -71);
			add: (PtFPairKern first: 223 second: 111 kernAmount: -4);
			add: (PtFPairKern first: 75 second: 115 kernAmount: -7);
			add: (PtFPairKern first: 84 second: 115 kernAmount: -65);
			add: (PtFPairKern first: 86 second: 115 kernAmount: -20);
			add: (PtFPairKern first: 87 second: 115 kernAmount: -6);
			add: (PtFPairKern first: 89 second: 115 kernAmount: -61);
			add: (PtFPairKern first: 90 second: 115 kernAmount: -11);
			add: (PtFPairKern first: 107 second: 115 kernAmount: -7);
			add: (PtFPairKern first: 115 second: 115 kernAmount: -10);
			add: (PtFPairKern first: 120 second: 115 kernAmount: -8);
			add: (PtFPairKern first: 132 second: 115 kernAmount: -6);
			add: (PtFPairKern first: 147 second: 115 kernAmount: -28);
			add: (PtFPairKern first: 148 second: 115 kernAmount: -38);
			add: (PtFPairKern first: 28 second: 116 kernAmount: -15);
			add: (PtFPairKern first: 29 second: 116 kernAmount: 14);
			add: (PtFPairKern first: 46 second: 116 kernAmount: -15);
			add: (PtFPairKern first: 65 second: 116 kernAmount: -19);
			add: (PtFPairKern first: 67 second: 116 kernAmount: -4);
			add: (PtFPairKern first: 76 second: 116 kernAmount: -14);
			add: (PtFPairKern first: 80 second: 116 kernAmount: 5);
			add: (PtFPairKern first: 88 second: 116 kernAmount: -23);
			add: (PtFPairKern first: 89 second: 116 kernAmount: -11);
			add: (PtFPairKern first: 90 second: 116 kernAmount: -16);
			add: (PtFPairKern first: 98 second: 116 kernAmount: -6);
			add: (PtFPairKern first: 101 second: 116 kernAmount: -6);
			add: (PtFPairKern first: 104 second: 116 kernAmount: -6);
			add: (PtFPairKern first: 114 second: 116 kernAmount: 13);
			add: (PtFPairKern first: 115 second: 116 kernAmount: -11);
			add: (PtFPairKern first: 118 second: 116 kernAmount: 8);
			add: (PtFPairKern first: 119 second: 116 kernAmount: 5);
			add: (PtFPairKern first: 121 second: 116 kernAmount: 9);
			add: (PtFPairKern first: 132 second: 116 kernAmount: -16);
			add: (PtFPairKern first: 223 second: 116 kernAmount: -10);
			add: (PtFPairKern first: 28 second: 117 kernAmount: -17);
			add: (PtFPairKern first: 65 second: 117 kernAmount: -8);
			add: (PtFPairKern first: 67 second: 117 kernAmount: -13);
			add: (PtFPairKern first: 70 second: 117 kernAmount: -8);
			add: (PtFPairKern first: 75 second: 117 kernAmount: -22);
			add: (PtFPairKern first: 76 second: 117 kernAmount: -15);
			add: (PtFPairKern first: 82 second: 117 kernAmount: -18);
			add: (PtFPairKern first: 84 second: 117 kernAmount: -56);
			add: (PtFPairKern first: 86 second: 117 kernAmount: -23);
			add: (PtFPairKern first: 87 second: 117 kernAmount: -4);
			add: (PtFPairKern first: 88 second: 117 kernAmount: -27);
			add: (PtFPairKern first: 89 second: 117 kernAmount: -50);
			add: (PtFPairKern first: 90 second: 117 kernAmount: -26);
			add: (PtFPairKern first: 102 second: 117 kernAmount: -6);
			add: (PtFPairKern first: 107 second: 117 kernAmount: -18);
			add: (PtFPairKern first: 122 second: 117 kernAmount: -17);
			add: (PtFPairKern first: 132 second: 117 kernAmount: -11);
			add: (PtFPairKern first: 147 second: 117 kernAmount: -20);
			add: (PtFPairKern first: 148 second: 117 kernAmount: -33);
			add: (PtFPairKern first: 28 second: 118 kernAmount: -41);
			add: (PtFPairKern first: 44 second: 118 kernAmount: -27);
			add: (PtFPairKern first: 46 second: 118 kernAmount: -37);
			add: (PtFPairKern first: 65 second: 118 kernAmount: -28);
			add: (PtFPairKern first: 67 second: 118 kernAmount: -35);
			add: (PtFPairKern first: 70 second: 118 kernAmount: -6);
			add: (PtFPairKern first: 71 second: 118 kernAmount: -19);
			add: (PtFPairKern first: 75 second: 118 kernAmount: -32);
			add: (PtFPairKern first: 76 second: 118 kernAmount: -44);
			add: (PtFPairKern first: 77 second: 118 kernAmount: -6);
			add: (PtFPairKern first: 83 second: 118 kernAmount: -15);
			add: (PtFPairKern first: 84 second: 118 kernAmount: -56);
			add: (PtFPairKern first: 88 second: 118 kernAmount: -50);
			add: (PtFPairKern first: 89 second: 118 kernAmount: -38);
			add: (PtFPairKern first: 90 second: 118 kernAmount: -47);
			add: (PtFPairKern first: 97 second: 118 kernAmount: -11);
			add: (PtFPairKern first: 98 second: 118 kernAmount: -10);
			add: (PtFPairKern first: 101 second: 118 kernAmount: -12);
			add: (PtFPairKern first: 104 second: 118 kernAmount: -16);
			add: (PtFPairKern first: 107 second: 118 kernAmount: -8);
			add: (PtFPairKern first: 111 second: 118 kernAmount: -12);
			add: (PtFPairKern first: 115 second: 118 kernAmount: -17);
			add: (PtFPairKern first: 120 second: 118 kernAmount: -4);
			add: (PtFPairKern first: 122 second: 118 kernAmount: -9);
			add: (PtFPairKern first: 132 second: 118 kernAmount: -52);
			add: (PtFPairKern first: 223 second: 118 kernAmount: -24);
			add: (PtFPairKern first: 28 second: 119 kernAmount: -40);
			add: (PtFPairKern first: 44 second: 119 kernAmount: -18);
			add: (PtFPairKern first: 46 second: 119 kernAmount: -32);
			add: (PtFPairKern first: 65 second: 119 kernAmount: -28);
			add: (PtFPairKern first: 66 second: 119 kernAmount: -10);
			add: (PtFPairKern first: 67 second: 119 kernAmount: -35);
			add: (PtFPairKern first: 71 second: 119 kernAmount: -20);
			add: (PtFPairKern first: 75 second: 119 kernAmount: -33);
			add: (PtFPairKern first: 76 second: 119 kernAmount: -34);
			add: (PtFPairKern first: 77 second: 119 kernAmount: -6);
			add: (PtFPairKern first: 82 second: 119 kernAmount: -7);
			add: (PtFPairKern first: 83 second: 119 kernAmount: -15);
			add: (PtFPairKern first: 84 second: 119 kernAmount: -62);
			add: (PtFPairKern first: 88 second: 119 kernAmount: -49);
			add: (PtFPairKern first: 89 second: 119 kernAmount: -35);
			add: (PtFPairKern first: 90 second: 119 kernAmount: -49);
			add: (PtFPairKern first: 97 second: 119 kernAmount: -12);
			add: (PtFPairKern first: 98 second: 119 kernAmount: -8);
			add: (PtFPairKern first: 101 second: 119 kernAmount: -11);
			add: (PtFPairKern first: 104 second: 119 kernAmount: -15);
			add: (PtFPairKern first: 111 second: 119 kernAmount: -10);
			add: (PtFPairKern first: 115 second: 119 kernAmount: -14);
			add: (PtFPairKern first: 132 second: 119 kernAmount: -46);
			add: (PtFPairKern first: 223 second: 119 kernAmount: -20);
			add: (PtFPairKern first: 45 second: 120 kernAmount: -13);
			add: (PtFPairKern first: 65 second: 120 kernAmount: -6);
			add: (PtFPairKern first: 66 second: 120 kernAmount: -10);
			add: (PtFPairKern first: 70 second: 120 kernAmount: -16);
			add: (PtFPairKern first: 74 second: 120 kernAmount: -11);
			add: (PtFPairKern first: 84 second: 120 kernAmount: -57);
			add: (PtFPairKern first: 86 second: 120 kernAmount: -18);
			add: (PtFPairKern first: 89 second: 120 kernAmount: -39);
			add: (PtFPairKern first: 97 second: 120 kernAmount: -14);
			add: (PtFPairKern first: 98 second: 120 kernAmount: -17);
			add: (PtFPairKern first: 101 second: 120 kernAmount: -23);
			add: (PtFPairKern first: 102 second: 120 kernAmount: -6);
			add: (PtFPairKern first: 104 second: 120 kernAmount: -18);
			add: (PtFPairKern first: 111 second: 120 kernAmount: -31);
			add: (PtFPairKern first: 115 second: 120 kernAmount: -16);
			add: (PtFPairKern first: 223 second: 120 kernAmount: -14);
			add: (PtFPairKern first: 28 second: 121 kernAmount: -38);
			add: (PtFPairKern first: 44 second: 121 kernAmount: -15);
			add: (PtFPairKern first: 46 second: 121 kernAmount: -40);
			add: (PtFPairKern first: 65 second: 121 kernAmount: -30);
			add: (PtFPairKern first: 66 second: 121 kernAmount: -13);
			add: (PtFPairKern first: 67 second: 121 kernAmount: -35);
			add: (PtFPairKern first: 70 second: 121 kernAmount: -6);
			add: (PtFPairKern first: 71 second: 121 kernAmount: -19);
			add: (PtFPairKern first: 75 second: 121 kernAmount: -38);
			add: (PtFPairKern first: 76 second: 121 kernAmount: -44);
			add: (PtFPairKern first: 77 second: 121 kernAmount: -6);
			add: (PtFPairKern first: 82 second: 121 kernAmount: -9);
			add: (PtFPairKern first: 83 second: 121 kernAmount: -15);
			add: (PtFPairKern first: 84 second: 121 kernAmount: -56);
			add: (PtFPairKern first: 86 second: 121 kernAmount: -16);
			add: (PtFPairKern first: 88 second: 121 kernAmount: -48);
			add: (PtFPairKern first: 89 second: 121 kernAmount: -37);
			add: (PtFPairKern first: 90 second: 121 kernAmount: -42);
			add: (PtFPairKern first: 97 second: 121 kernAmount: -10);
			add: (PtFPairKern first: 98 second: 121 kernAmount: -9);
			add: (PtFPairKern first: 101 second: 121 kernAmount: -11);
			add: (PtFPairKern first: 104 second: 121 kernAmount: -18);
			add: (PtFPairKern first: 107 second: 121 kernAmount: -8);
			add: (PtFPairKern first: 111 second: 121 kernAmount: -12);
			add: (PtFPairKern first: 115 second: 121 kernAmount: -17);
			add: (PtFPairKern first: 120 second: 121 kernAmount: -4);
			add: (PtFPairKern first: 122 second: 121 kernAmount: -9);
			add: (PtFPairKern first: 132 second: 121 kernAmount: -42);
			add: (PtFPairKern first: 223 second: 121 kernAmount: -24);
			add: (PtFPairKern first: 68 second: 122 kernAmount: -10);
			add: (PtFPairKern first: 70 second: 122 kernAmount: -13);
			add: (PtFPairKern first: 83 second: 122 kernAmount: -10);
			add: (PtFPairKern first: 84 second: 122 kernAmount: -43);
			add: (PtFPairKern first: 86 second: 122 kernAmount: -15);
			add: (PtFPairKern first: 88 second: 122 kernAmount: -14);
			add: (PtFPairKern first: 89 second: 122 kernAmount: -38);
			add: (PtFPairKern first: 98 second: 122 kernAmount: -9);
			add: (PtFPairKern first: 101 second: 122 kernAmount: -13);
			add: (PtFPairKern first: 104 second: 122 kernAmount: -9);
			add: (PtFPairKern first: 111 second: 122 kernAmount: -21);
			add: (PtFPairKern first: 115 second: 122 kernAmount: -10);
			add: (PtFPairKern first: 148 second: 122 kernAmount: -13);
			add: (PtFPairKern first: 28 second: 147 kernAmount: -32);
			add: (PtFPairKern first: 44 second: 147 kernAmount: -118);
			add: (PtFPairKern first: 46 second: 147 kernAmount: -118);
			add: (PtFPairKern first: 65 second: 147 kernAmount: -77);
			add: (PtFPairKern first: 71 second: 147 kernAmount: -8);
			add: (PtFPairKern first: 76 second: 147 kernAmount: -92);
			add: (PtFPairKern first: 80 second: 147 kernAmount: 14);
			add: (PtFPairKern first: 84 second: 147 kernAmount: 11);
			add: (PtFPairKern first: 98 second: 147 kernAmount: -20);
			add: (PtFPairKern first: 101 second: 147 kernAmount: -13);
			add: (PtFPairKern first: 102 second: 147 kernAmount: 23);
			add: (PtFPairKern first: 114 second: 147 kernAmount: 20);
			add: (PtFPairKern first: 118 second: 147 kernAmount: 20);
			add: (PtFPairKern first: 119 second: 147 kernAmount: 15);
			add: (PtFPairKern first: 120 second: 147 kernAmount: 20);
			add: (PtFPairKern first: 121 second: 147 kernAmount: 20);
			add: (PtFPairKern first: 223 second: 147 kernAmount: -20);
			add: (PtFPairKern first: 28 second: 148 kernAmount: -45);
			add: (PtFPairKern first: 44 second: 148 kernAmount: -109);
			add: (PtFPairKern first: 46 second: 148 kernAmount: -118);
			add: (PtFPairKern first: 65 second: 148 kernAmount: -57);
			add: (PtFPairKern first: 76 second: 148 kernAmount: -92);
			add: (PtFPairKern first: 80 second: 148 kernAmount: 18);
			add: (PtFPairKern first: 84 second: 148 kernAmount: 18);
			add: (PtFPairKern first: 86 second: 148 kernAmount: 10);
			add: (PtFPairKern first: 87 second: 148 kernAmount: 15);
			add: (PtFPairKern first: 102 second: 148 kernAmount: 15);
			add: (PtFPairKern first: 114 second: 148 kernAmount: 15);
			add: (PtFPairKern first: 118 second: 148 kernAmount: 25);
			add: (PtFPairKern first: 119 second: 148 kernAmount: 15);
			add: (PtFPairKern first: 120 second: 148 kernAmount: 20);
			add: (PtFPairKern first: 121 second: 148 kernAmount: 20);
			add: (PtFPairKern first: 239 second: 148 kernAmount: 11);
			add: (PtFPairKern first: 84 second: 154 kernAmount: -37);
			add: (PtFPairKern first: 89 second: 154 kernAmount: -52);
			add: (PtFPairKern first: 148 second: 154 kernAmount: -5);
			add: (PtFPairKern first: 75 second: 171 kernAmount: -15);
			add: (PtFPairKern first: 84 second: 171 kernAmount: -37);
			add: (PtFPairKern first: 86 second: 171 kernAmount: -17);
			add: (PtFPairKern first: 89 second: 171 kernAmount: -37);
			add: (PtFPairKern first: 76 second: 183 kernAmount: -32);
			add: (PtFPairKern first: 75 second: 187 kernAmount: -36);
			add: (PtFPairKern first: 84 second: 187 kernAmount: -37);
			add: (PtFPairKern first: 86 second: 187 kernAmount: -26);
			add: (PtFPairKern first: 89 second: 187 kernAmount: -37);
			add: (PtFPairKern first: 47 second: 198 kernAmount: -25);
			add: (PtFPairKern first: 66 second: 198 kernAmount: -6);
			add: (PtFPairKern first: 68 second: 198 kernAmount: -21);
			add: (PtFPairKern first: 70 second: 198 kernAmount: -49);
			add: (PtFPairKern first: 74 second: 198 kernAmount: -9);
			add: (PtFPairKern first: 76 second: 198 kernAmount: 16);
			add: (PtFPairKern first: 79 second: 198 kernAmount: -12);
			add: (PtFPairKern first: 80 second: 198 kernAmount: -52);
			add: (PtFPairKern first: 81 second: 198 kernAmount: 30);
			add: (PtFPairKern first: 84 second: 198 kernAmount: -63);
			add: (PtFPairKern first: 85 second: 198 kernAmount: -15);
			add: (PtFPairKern first: 86 second: 198 kernAmount: -62);
			add: (PtFPairKern first: 87 second: 198 kernAmount: -36);
			add: (PtFPairKern first: 89 second: 198 kernAmount: -87);
			add: (PtFPairKern first: 132 second: 198 kernAmount: 40);
			add: (PtFPairKern first: 147 second: 198 kernAmount: -115);
			add: (PtFPairKern first: 148 second: 198 kernAmount: -112);
			add: (PtFPairKern first: 65 second: 208 kernAmount: -5);
			add: (PtFPairKern first: 132 second: 208 kernAmount: -7);
			add: (PtFPairKern first: 89 second: 223 kernAmount: -40);
			add: (PtFPairKern first: 84 second: 224 kernAmount: -55);
			add: (PtFPairKern first: 86 second: 224 kernAmount: -40);
			add: (PtFPairKern first: 89 second: 224 kernAmount: -58);
			add: (PtFPairKern first: 84 second: 226 kernAmount: -57);
			add: (PtFPairKern first: 89 second: 226 kernAmount: -57);
			add: (PtFPairKern first: 84 second: 227 kernAmount: -33);
			add: (PtFPairKern first: 86 second: 227 kernAmount: -37);
			add: (PtFPairKern first: 89 second: 227 kernAmount: -42);
			add: (PtFPairKern first: 84 second: 228 kernAmount: -48);
			add: (PtFPairKern first: 86 second: 228 kernAmount: -40);
			add: (PtFPairKern first: 89 second: 228 kernAmount: -46);
			add: (PtFPairKern first: 84 second: 229 kernAmount: -61);
			add: (PtFPairKern first: 86 second: 229 kernAmount: -37);
			add: (PtFPairKern first: 89 second: 229 kernAmount: -48);
			add: (PtFPairKern first: 84 second: 232 kernAmount: -69);
			add: (PtFPairKern first: 89 second: 232 kernAmount: -72);
			add: (PtFPairKern first: 84 second: 234 kernAmount: -65);
			add: (PtFPairKern first: 89 second: 234 kernAmount: -79);
			add: (PtFPairKern first: 84 second: 235 kernAmount: -66);
			add: (PtFPairKern first: 89 second: 235 kernAmount: -72);
			add: (PtFPairKern first: 84 second: 236 kernAmount: 20);
			add: (PtFPairKern first: 87 second: 236 kernAmount: 12);
			add: (PtFPairKern first: 89 second: 236 kernAmount: 7);
			add: (PtFPairKern first: 147 second: 236 kernAmount: 15);
			add: (PtFPairKern first: 75 second: 238 kernAmount: 4);
			add: (PtFPairKern first: 84 second: 238 kernAmount: 17);
			add: (PtFPairKern first: 86 second: 238 kernAmount: 11);
			add: (PtFPairKern first: 87 second: 238 kernAmount: 12);
			add: (PtFPairKern first: 89 second: 238 kernAmount: 13);
			add: (PtFPairKern first: 147 second: 238 kernAmount: 10);
			add: (PtFPairKern first: 70 second: 239 kernAmount: 15);
			add: (PtFPairKern first: 75 second: 239 kernAmount: 14);
			add: (PtFPairKern first: 84 second: 239 kernAmount: 37);
			add: (PtFPairKern first: 86 second: 239 kernAmount: 15);
			add: (PtFPairKern first: 87 second: 239 kernAmount: 20);
			add: (PtFPairKern first: 89 second: 239 kernAmount: 31);
			add: (PtFPairKern first: 147 second: 239 kernAmount: 21);
			add: (PtFPairKern first: 84 second: 241 kernAmount: -41);
			add: (PtFPairKern first: 84 second: 242 kernAmount: -70);
			add: (PtFPairKern first: 86 second: 242 kernAmount: -48);
			add: (PtFPairKern first: 89 second: 242 kernAmount: -80);
			add: (PtFPairKern first: 84 second: 244 kernAmount: -83);
			add: (PtFPairKern first: 89 second: 244 kernAmount: -81);
			add: (PtFPairKern first: 84 second: 245 kernAmount: -55);
			add: (PtFPairKern first: 86 second: 245 kernAmount: -48);
			add: (PtFPairKern first: 89 second: 245 kernAmount: -71);
			add: (PtFPairKern first: 84 second: 246 kernAmount: -64);
			add: (PtFPairKern first: 86 second: 246 kernAmount: -48);
			add: (PtFPairKern first: 89 second: 246 kernAmount: -81);
			add: (PtFPairKern first: 84 second: 249 kernAmount: -48);
			add: (PtFPairKern first: 84 second: 252 kernAmount: -51);
			add: (PtFPairKern first: 84 second: 255 kernAmount: -33);
			yourself)
]

{ #category : #'*PDFtalk-test resources-test instances' }
PtFPostScriptFontMetrics class >> exampleBytes [
	^self exampleBytesTazLT4SemiLight
]

{ #category : #'*PDFtalk-test resources-test instances' }
PtFPostScriptFontMetrics class >> exampleBytesTazLT4SemiLight [
	^ByteArray fromASCII85String: '!!1UZ!!#B)E-ZJ<B4uB00f_6Q/0HZ-3B8W51,(C;/0H]%0K(%_Gp#e''@p<A_>p*Zh+@gHjDfdTS6#:
?;!!%QM$32UX/-0,\4obQ_!!!"\!<<*"-3PK@!<E<,ru1q<!65''>!7CiIzz!$2-(!!!#lz!!!#b!WW3
#!!!#[z!!!!U!:Tsg!9aLe!9aOK"!@^<!PAKT!!!#3!hB:$!+Z)7!%%\$!+Z''I!#Ye"!%%]W!WW3sDf
^#!@rc:&F9#9KH6>m\1a#_.D.u[XB4uAe<+1))9N3iIASl-TBkM+$!0@69!.Fs1!Ib''2!K[>D!SRO&!
Ib&u!Ib&u!Ib&u!Ib&u!Ib&u!=&Yb!TF-"!Up*+!ET<Q!$VHR!FGo?!O)Xk!qlU\!C?h#!@@jR!<N9%!
La#p!XJi5!XJi5!XJi5!XJi5!XJic!B1$+![[sq!iZ40!sJc)!TF,D!j)Kk!?M;?!pK\S!QtLU!VHLj!
c8#3!Gql@!m1P<!DEOr!YY\4!RUqb!G__)!G_]_!qZM$!T*qA!HnM.!Rh&U!U''RU!SRP-!2''AH!!NJ
r!VHKW!U''P?!G;E\!V6>S!KI5a!K$nZ!K[?F!0@4.!e(.s!e(.U!P/<S!ODk"!V?DS!W)uA!D<IS!e(
0!!Ib&u!W<#s!5/EH!@@m?!U''WI!H/$P!D<G7"+C9"!RUr!!$VH>!V?C>![[sh!@@l0!>>Q`!=&ZQ![
[tS!g!H0!@@lZ!O`#j!@@k%!j;TO!B''t)!=&\''!jDa,!iZ2(!X/W/!X/W/!X/Xg!oa6_!NcC)!NcCe
!9jLJ!9jJS!`/r8!c8!U!c8!U![[tj!_`Yh!_`Yh!mq&A!TsL@!T*q8!T*q8!T*qJ!d4Un!Rh(u!Rh)''
!87G,!87G+!V6?b!VHKd!VHKd!@@mE!V6?`!V6?`!K$pA!K$oh!^Rh&s$Ie''s&pE9s$7\!s&pH:s+DE
Zs&gH)s(3D]!%]>Js"5MBs$7jXs$8-UruEZMs",eOs$A:#s$SEWs$eQ>s%4ias%b2ps%k7`s&:PIs&CV
ss&L\Es&Ubgs&gn0s''dPGs(*bDs(3h(s)0I>s)KZas)TaQs)orms*$$%s*60%s-#!ks-,''cru<W9s"
#bIs"5n<s$87*s$JBQs$\O7s$eU8s%=r_s%G#is&(Gts&:Sus&L`2s&Uf;s&^l,s&gqTs&q"qs''mYAs
(3k=s(a48s)K^Qs)Tdbs)]jUs)p!is*$''js*--Ss*63ns*?9ZruE`Ys",k_s$A@)s$SKes$eWGs%4oe
s%b9)s%k=qs&1QGs&:VIs&C](s&LbHs&Uhls&gt<s(*hIs(3n/s)0OFs)K`ms)TgZs)p$#s*$*/s*661
s-#''ms-,-es"?$Os$eZZs%4s.s%kAPs&1TDs&:Ybs&C`2s&Lecs&Ul&s&h"es(3q@s)KdUs)p''[s*$
-ds&;&=s&M2Ds&V8Os&hD4s$8m9s&;2o!+nG&!%gM*s"?[Us$B$7s$K*Ds$T04s$]6Ms$f;ks$oBAs%5
T;s%>ZOs%brEs%l#!s&)/>s&25Ws&;:ps&DAHs&MG#s&VM5s&_SWs&hXes&q_Ns-#aSs-,gHru=WD!%g
gts"@"+s$96[!(''<Ks$TKEs$fW(s%5oSs%H#t!)H5Is%l>*s&;VAs&D\[s&Mb)s&VhAs&ht-s-$''\s
---Vs&;_fs&Mkhs&i(Ys--7Gru=hts"7+/s"@10s$9HFs$KTGs$]`]s%?/Ds%H5Is&)YTs&2_hs&;eKs
&MqXs&W"gs&`(Ds&i.Ds&r4Os+F2,s-$78s--=*s1_@uru=u+s".15s$9TKs$BZ[s$K`Ws$]las$fr[s
 %?;\s%HA[s%cSas&;qis&N(gs&W.ts&`4cs&i:^s&r@js+F>Cs-$COs--IKs1_M,ru>"Ts"%."s".4,s
"79us"@=c!''sT$s$B]Ns$TiCs$p&\s%HD(s%QJas%cVXs%ubas&;r%!+o1M!/+=Vs-$Cq!0gFs!39)Y
s1;7ms1_Oiru>&*s"7=4s$9ZKs%?A`s%HGZs&)kfs&`:hs+FD8ru>(Ws"%3os".:9s"7?ks"@Ce!''sZ
(s$BcRs$ToRs$p,Zs%?Das%HJ)s%QPcs%c\cs%lbms%uhks&)nfs&2tcs&`=cs&rIrs(5:?!/+CLs/T2
ms1;>*s1_Uqru>+es"%72s".=Ms"7C%s"@Ff!''s]@s$Bfbs$Tras$p/fs%HM?s%c_ks&)qss&rM#s(5
=>!/+G!s1_Xuru>/2s".@/s$9cYs$BiBs$Ko^s$TuCs$g,Ns$p2Ts%6D^s%HPcs%cb?s%lhEs&)t]s&3
 %es&E1ks&N7us&`Cds&iIfs&rOdru>1Ps"%=)s".C$s"7Hgs"@Lh!''sbfs$Bl@s$U#:s$p5Vs%6Gds%
?Mgs%HS"s%QYSs%ceJs%lkfs%uq^s&*"Ys&3(as&`F\s&rRus+FO>s/T;Ws1;Fgs1_^fru>52s".FDs$
9iZs$BoZs$U&Ls$g2_s$p8`s%HVbs%chZs%lnYs&*%ds&3+ms&N=ts&`Ins&iP!s&rUgs$L5is$U;ns$
gGXs%?ets%m.qs&*:qs&<F7s&NRVs&WXms&`_!s&idCs&rk"s''fF4s(5^+s(c''8s)MQAs)qiFs*%oI
s*.uEs*8&Js*A,Ns-$mRs--sCru>SCruGYDs"@p>s$:2ns$L>`s$gPbs%?nhs%Htss%m7ps&*C\s&<O/
s&N[Ws&Waos&`gas&im0s&rs`s''oU4s(5g&s(c0!s)MZ5s)V`Es)_f8s)qrEs*&#Gs*/)7s*8/Js*A5
Cs+FqOs-%!6s-.'')s5.AbruG\_!)R82!*Ek*s&it*s)M]^!-;cJs+G"Ns-.-hs5.Gas&<jYs&O"&s&X
(6s&a.''s&j3gs&s:+s-.Bmru>tNruH%Ns"A<Is$:T#s$L_js$gqms%@:ss%IA(s%mY&s&*dds&<p:s&
O''bs&X.$s&a3ls&j9=s&s?ks''p!>s(630s(cQ+s)N&@s)W,Ps)`2Cs)r>Os*&DRs*/JBs*8PUs*AVN
s+G=Zs-%BCs-.H4s5.bms%@G/s&=''Ss&O4-s&X:<s&jE\s&sL:s(c]Os)W8Ts*/V[s+GIis-%Nbs-.T
Yru?.NruH1k!%rB`s$:bos$Lo+s%IP*s%me@!*F@-s&jI:s&sO6s''g*Hs(-<Ks(HNNs)N2j!-<8Ts)r
Ji!-`Mg!-rYm!/,I`s5.qlru?1Ms$:f&s$Lr#s$h/+s%@M"s%IS*s&+"-s&=-^s&O:,s&X@@s&aF*s&j
Kis&sR-s(6EMs(ccFs*AhVs+GOfs-%Tls-.Z`ru?46s"&?Ts"8KLs$:hhs$Ltcs$h2.s$q8"s%@Ons%I
Ucs%R\5s&4+2s&=0_s&aHis&jO!s&sTns''^*Ds''g0Fs(-BGs(HTFs(cfQs)3)Qs)WAPs*/_bs*Ak_s
+GR>s5/"`ru?78s"&B^s"8NRs$:kis$Cr''s$M"ds$q;"s%@Rns%IXns%R_6s&+(:s&4.3s&=3Zs&aKk
s&jR%s&sWms''^-Ds''g3Is(-EIs(HWHs)3,Ts)WDTs+GUEs5/%es"/Kes$:o+s$Cu(s$h8&s%7P/s&=
6`s&OC4s&jU"s''^0Cs''g6As(-H>s(6NPs(HZFs)3/@s)WGSs5/(lru?=<s"&Hcs"8TLs$:qis$D#&s
$M(fs$h;1s$qA%s%@Xks%I^fs%Re8s&+.:s&445s&=9bs&OF7s&aQns&jX%s&s^!s''^3Hs''g9Js(-K
Ks(H]Gs(coTs)32Ts)WJSs*/hes*Atbs+G[Ks5/+cs$V2,s$h>+s&47;s&=<ps&OI9s&aU<s&j[%s''g
<Ks(-NJs(H`Qs)35Ls)WM[s-.j$ru@6\s"''@ks"9Lms$;jTs$r:Js%JWPs%nmh!*#-i!+M/Ys(.Dcs(
7H2!-48;!-XP?!-aV;!-j\A!-sbB!8j",ru@9Ps"''Cus"9Ons$;mis%JZQs%npm!*#0q!*5<k!*>Bq!
+qH+!-4;7!-XSE!-aY<!-j_B!-seC!:Q-[!*#EAs&kf7s-/uLs%BE_s&?&Rs&Q2hs&lDWs%Ko[s%BuZs
&?Vbs&Qbos&ltgs"DCTs$Fa%s$Xlms$k#Ss%:<*s%LED!)LW,s%p_Zs&$cW!*$tSs&I)/s&R.Vs&[4qs
&m@@s+JB?!0bE^s-1Nbs$>$/s+Jbps&n73s&@pus&S(1s&n:"s&A!us&n@%s&A%9s&S17s&nC5s&A(+s
&S45s&nF2s&A*ts&S79s&nI1s&A3os&nQqs&A9us&nWls&A<us&nZts&A>!!*ALq!*SXn!0ca[!))__!
*&@u!*8Lq!*ARs!*S_!!0cgX!(QDf!))bj!*&D5!*8P!!*AV''!*Sb4!0cjd!*&L?s&AR#s&S^;s&nos
s&AWms&nuts&A[5s&Sg>s&o$*s&A^-s&Sj?s&o''!s&Ag@s&Ap@s&B$Urr~>'
]
