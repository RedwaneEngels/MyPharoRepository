Extension { #name : #SmallInteger }

{ #category : #'*Coypu' }
SmallInteger >> isNoteOn [

"test if corresponging MIDI status byte is a Note On message"

^ 16r90 isVoiceMessage 
]
