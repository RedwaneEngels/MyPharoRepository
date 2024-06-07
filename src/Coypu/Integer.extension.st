Extension { #name : #Integer }

{ #category : #'*Coypu' }
Integer >> randomWalksOn: anArrayOfNotes octaves: aNumberOfOctaves [
	"random walk inside an array of notes extended for aNumberOfOctaves range"

	| start nix randomWalker r extendedArray |
	2 to: aNumberOfOctaves do: [ :i |
	                 anArrayOfNotes , anArrayOfNotes + (i * 12) ].
	start := anArrayOfNotes  at: (anArrayOfNotes   size / 2) rounded.
	nix := anArrayOfNotes  indexOf: start.
	randomWalker := (1 to: self) collect: [ :i |
		                r := Random new next.
		                r > 0.5
			                ifTrue: [ nix := nix + 1 min: anArrayOfNotes size ]
			                ifFalse: [ nix := nix - 1 max: 1 ].


		                anArrayOfNotes at: nix

		                "
			                ifTrue: [ nix := nix + 1 min: anArrayOfNotes size ]
			                ifFalse: [ nix := nix - 1 max: 1 ].
			
			" ].
	^ randomWalker
]

{ #category : #'*Coypu' }
Integer >> randomWalksOn: anArrayOfNotes octaves: aNumberOfOctaves root: aRootNoteNumber [
	"random walk inside an array of notes extended for aNumberOfOctaves range and with a RootNote"

	| start nix randomWalker r |
	2 to: aNumberOfOctaves do: [ :i |
	anArrayOfNotes , anArrayOfNotes + (i * 12) ].
	start := anArrayOfNotes at: (anArrayOfNotes size / 2) rounded.
	nix := anArrayOfNotes indexOf: start.
	randomWalker := (1 to: self) collect: [ :i |
		                r := Random new next.
		                r > 0.5
			                ifTrue: [ nix := nix + 1 min: anArrayOfNotes size ]
			                ifFalse: [ nix := nix - 1 max: 1 ].


		                anArrayOfNotes at: nix

		             ].
	^ randomWalker + aRootNoteNumber  
]
