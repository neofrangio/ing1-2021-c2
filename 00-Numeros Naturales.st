!classDefinition: #I category: '00-Numeros Naturales'!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '00-Numeros Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: '00-Numeros Naturales'!
I class
	instanceVariableNames: ''!

!I class methodsFor: 'as yet unclassified' stamp: 'VV 8/30/2021 17:18:20'!
* aNumber
	^aNumber! !

!I class methodsFor: 'as yet unclassified' stamp: 'VV 8/26/2021 21:13:58'!
+ aNaturalNumber
	^aNaturalNumber next 
 ! !

!I class methodsFor: 'as yet unclassified' stamp: 'VV 8/30/2021 18:18:34'!
- anNaturalNumber
	self error: self descripcionDeErrorDeNumerosNegativosNoSoportados.	! !

!I class methodsFor: 'as yet unclassified' stamp: 'VV 8/30/2021 18:19:50'!
/ aNumber
	aNumber = I ifTrue:[^ self].
	self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	! !

!I class methodsFor: 'as yet unclassified' stamp: 'VV 8/30/2021 18:20:06'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
 	^'descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor'! !

!I class methodsFor: 'as yet unclassified' stamp: 'VV 8/30/2021 18:18:46'!
descripcionDeErrorDeNumerosNegativosNoSoportados
	^ 'descripcionDeErrorDeNumerosNegativosNoSoportados'! !

!I class methodsFor: 'as yet unclassified' stamp: 'VV 8/26/2021 20:43:01'!
next 
 ^II! !


!classDefinition: #II category: '00-Numeros Naturales'!
DenotativeObject subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '00-Numeros Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: '00-Numeros Naturales'!
II class
	instanceVariableNames: 'previous next'!

!II class methodsFor: 'as yet unclassified' stamp: 'VV 8/30/2021 18:48:02'!
* aNaturalNumber	
	|acumulator i|	
	i:=aNaturalNumber.
	acumulator:=self.
	[i ~= I] whileTrue:[ 
 		acumulator := acumulator + self.
		i := i previous.
	].	
	^ acumulator.! !

!II class methodsFor: 'as yet unclassified' stamp: 'VV 8/26/2021 21:19:27'!
+ aNaturalNumber
	^self previous + aNaturalNumber next.! !

!II class methodsFor: 'as yet unclassified' stamp: 'VV 8/30/2021 19:15:28'!
- aNaturalNumber
	
	aNaturalNumber = I ifTrue: [^self previous].
	^ self previous - aNaturalNumber previous.
	! !

!II class methodsFor: 'as yet unclassified' stamp: 'FM 9/2/2021 11:01:52'!
/ aNaturalNumber
	|acumulator i esMayor|		
	esMayor:= true.
	aNaturalNumber = I ifTrue:[^ self].	
	i:=I.
	acumulator:=I.
	[acumulator ~= self next] whileTrue:[ 
		esMayor:= false.
 		acumulator := acumulator + aNaturalNumber.
		i := i next.
	].
	esMayor ifTrue:[self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor]	.
	^ i previous.
	
	
	
	! !

!II class methodsFor: 'as yet unclassified' stamp: 'VV 8/30/2021 18:20:38'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	^'descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor'! !

!II class methodsFor: 'as yet unclassified' stamp: 'FM 9/2/2021 11:02:25'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := I.
	next := III.! !

!II class methodsFor: 'as yet unclassified' stamp: 'VV 8/26/2021 21:32:41'!
next
	next ifNotNil:[^next].
	next _ II createChildNamed: self name, 'I'.
	next previous: self.
	^ next ! !

!II class methodsFor: 'as yet unclassified' stamp: 'VV 8/26/2021 21:21:50'!
previous
	^previous.! !

!II class methodsFor: 'as yet unclassified' stamp: 'VV 8/26/2021 21:26:46'!
previous: aNaturalNumber
	previous:= aNaturalNumber
	! !


!classDefinition: #III category: '00-Numeros Naturales'!
II subclass: #III
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '00-Numeros Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'III class' category: '00-Numeros Naturales'!
III class
	instanceVariableNames: ''!

!III class methodsFor: 'as yet unclassified' stamp: 'FM 9/2/2021 11:02:25'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := II.
	next := IIII.! !


!classDefinition: #IIII category: '00-Numeros Naturales'!
II subclass: #IIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '00-Numeros Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIII class' category: '00-Numeros Naturales'!
IIII class
	instanceVariableNames: ''!

!IIII class methodsFor: 'as yet unclassified' stamp: 'FM 9/2/2021 11:02:25'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := III.
	next := IIIII.! !


!classDefinition: #IIIII category: '00-Numeros Naturales'!
II subclass: #IIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '00-Numeros Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIII class' category: '00-Numeros Naturales'!
IIIII class
	instanceVariableNames: ''!

!IIIII class methodsFor: 'as yet unclassified' stamp: 'FM 9/2/2021 11:02:25'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := IIII.
	next := IIIIII.! !


!classDefinition: #IIIIII category: '00-Numeros Naturales'!
II subclass: #IIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '00-Numeros Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIII class' category: '00-Numeros Naturales'!
IIIIII class
	instanceVariableNames: ''!

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'FM 9/2/2021 11:02:25'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := IIIII.
	next := IIIIIII.! !


!classDefinition: #IIIIIII category: '00-Numeros Naturales'!
II subclass: #IIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '00-Numeros Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIIII class' category: '00-Numeros Naturales'!
IIIIIII class
	instanceVariableNames: ''!

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'FM 9/2/2021 11:02:25'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := IIIIII.
	next := IIIIIIII.! !


!classDefinition: #IIIIIIII category: '00-Numeros Naturales'!
II subclass: #IIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '00-Numeros Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIIIII class' category: '00-Numeros Naturales'!
IIIIIIII class
	instanceVariableNames: ''!

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'FM 9/2/2021 11:02:25'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := IIIIIII.
	next := IIIIIIIII.! !


!classDefinition: #IIIIIIIII category: '00-Numeros Naturales'!
II subclass: #IIIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '00-Numeros Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIIIIII class' category: '00-Numeros Naturales'!
IIIIIIIII class
	instanceVariableNames: ''!

!IIIIIIIII class methodsFor: 'as yet unclassified' stamp: 'FM 9/2/2021 11:02:25'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := IIIIIIII.
	next := nil.! !

II initializeAfterFileIn!
III initializeAfterFileIn!
IIII initializeAfterFileIn!
IIIII initializeAfterFileIn!
IIIIII initializeAfterFileIn!
IIIIIII initializeAfterFileIn!
IIIIIIII initializeAfterFileIn!
IIIIIIIII initializeAfterFileIn!