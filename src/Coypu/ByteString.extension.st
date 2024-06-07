Extension { #name : #ByteString }

{ #category : #'*Coypu' }
ByteString >> asDirtPureNotes [
	" retruns just the note numbers parsed - tokens must be separated by string"

	| seq tokens gates notesAStrings notesAsNumbers dirtString |
	gates := ''.
	tokens := self splitOn: ','.
	dirtString := ''.
	tokens do: [ :i |
		(i includes: $*)
			ifTrue: [ gates := gates , i multiplyStringsInString ]
			ifFalse: [
				(i includes: $/)
					ifTrue: [ gates := gates , i withNRests ]
					ifFalse: [ gates := gates , i ] ] ].

	notesAStrings := (gates copyReplaceAll: '~' with: '')
		                 findBetweenSubstrings: ' '.

	notesAsNumbers := notesAStrings collect: [ :i |
		                  i ~= ' ' ifTrue: [ i asInteger ] ].

	notesAsNumbers do: [ :i |
		dirtString := dirtString , i asString , ' ' ].

	seq := gates asSeqGates asSeq.
	seq dirtNotes: dirtString.
	seq notes: notesAsNumbers asArray.

	^ notesAsNumbers asArray .
]

{ #category : #'*Coypu' }
ByteString >> hexBeat: aStringOfNoteNumbers to: aKey [
	"conveience method to avoid parenthesis !!! returns the Sequencer that has been created"
| seq |
	seq := (self hexBeat: aStringOfNoteNumbers) .
	seq to: aKey.
	^ seq
]

{ #category : #'*Coypu' }
ByteString >> toKymaAsTrigWithDuration: aDurationInSeconds [

	" send an OSC message acting as a 10ms dutyCycle trigger"

	| vcslabel |
	"	pacaAddress := NetNameResolver stringFromAddress: (NetNameResolver 	addressForName:'beslime-691.local'). "
	vcslabel := '/vcs/' , self , '/1'.
	^ [ 
	  (OSCMessage for: { 
			   vcslabel.
			   1.0 }) sendToAddressString: PacaAddress address port: 8000.
	  (Delay forSeconds: aDurationInSeconds ) wait.
	  (OSCMessage for: { 
			   vcslabel.
			   0.0 }) sendToAddressString: PacaAddress address port: 8000 ] fork
]
