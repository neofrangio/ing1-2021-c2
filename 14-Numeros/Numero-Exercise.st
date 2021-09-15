!classDefinition: #NumeroTest category: 'Numero-Exercise'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs three eight negativeOne negativeTwo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:11'!
test01isCeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:12'!
test02isCeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:14'!
test05EnteroAddsWithEnteroCorrectly

	self assert: one + one equals: two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:18'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: two * two equals: four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:20'!
test07EnteroDividesEnteroCorrectly

	self assert: two / two equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:38'!
test08FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := (Entero with: 7) / (Entero with: 10).

	self assert: oneFifth + oneHalf equals: sevenTenths! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:52'!
test09FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: oneFifth * twoFifth equals: twoTwentyfifth! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:56'!
test10FraccionDividesFraccionCorrectly
"
    La division de fracciones es:
	 
	(a/b) / (c/d) = (a.d) / (b.c)
"

	self assert: oneHalf / oneFifth equals: fiveHalfs! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test11EnteroAddsFraccionCorrectly
"
	Ahora empieza la diversion!!
"

	self assert: one + oneFifth equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test12FraccionAddsEnteroCorrectly

	self assert: oneFifth + one equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:50'!
test13EnteroMultipliesFraccionCorrectly

	self assert: two * oneFifth equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:52'!
test14FraccionMultipliesEnteroCorrectly

	self assert: oneFifth * two equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:57'!
test15EnteroDividesFraccionCorrectly

	self assert: one / twoFifth equals: fiveHalfs  ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:59'!
test16FraccionDividesEnteroCorrectly

	self assert: twoFifth / five equals: twoTwentyfifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:38'!
test17AFraccionCanBeEqualToAnEntero

	self assert: two equals: four / two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:39'!
test18AparentFraccionesAreEqual

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:40'!
test19AddingFraccionesCanReturnAnEntero

	self assert: oneHalf + oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test20MultiplyingFraccionesCanReturnAnEntero

	self assert: (two/five) * (five/two) equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test21DividingFraccionesCanReturnAnEntero

	self assert: oneHalf / oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:43'!
test22DividingEnterosCanReturnAFraccion

	self assert: two / four equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test23CanNotDivideEnteroByZero

	self 
		should: [ one / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test24CanNotDivideFraccionByZero

	self 
		should: [ oneHalf / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test25AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test26AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 4/15/2021 16:45:35'!
test27EnteroSubstractsEnteroCorrectly

	self assert: four - one equals: three! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:47:41'!
test28FraccionSubstractsFraccionCorrectly
	
	self assert: twoFifth - oneFifth equals: oneFifth.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:48:00'!
test29EnteroSubstractsFraccionCorrectly

	self assert: one - oneHalf equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:05'!
test30FraccionSubstractsEnteroCorrectly

	| sixFifth |
	
	sixFifth := (Entero with: 6) / (Entero with: 5).
	
	self assert: sixFifth - one equals: oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:08'!
test31SubstractingFraccionesCanReturnAnEntero

	| threeHalfs |
	
	threeHalfs := (Entero with: 3) / (Entero with: 2).
	
	self assert: threeHalfs - oneHalf equals: one.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:48:48'!
test32SubstractingSameEnterosReturnsZero

	self assert: one - one equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:01'!
test33SubstractingSameFraccionesReturnsZero

	self assert: oneHalf - oneHalf equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:14'!
test34SubstractingAHigherValueToANumberReturnsANegativeNumber

	| negativeThreeHalfs |
	
	negativeThreeHalfs := (Entero with: -3) / (Entero with: 2).	

	self assert: one - fiveHalfs equals: negativeThreeHalfs.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:23'!
test35FibonacciZeroIsOne

	self assert: zero fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:32'!
test36FibonacciOneIsOne

	self assert: one fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:39'!
test37FibonacciEnteroReturnsAddingPreviousTwoFibonacciEnteros

	self assert: four fibonacci equals: five.
	self assert: three fibonacci equals: three. 
	self assert: five fibonacci equals: four fibonacci + three fibonacci.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:47'!
test38FibonacciNotDefinedForNegativeNumbers

	self 
		should: [negativeOne fibonacci]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Entero negativeFibonacciErrorDescription ].! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:55'!
test39NegationOfEnteroIsCorrect

	self assert: two negated equals: negativeTwo.
		! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:03'!
test40NegationOfFraccionIsCorrect

	self assert: oneHalf negated equals: negativeOne / two.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:11'!
test41SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (negativeOne / negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:17'!
test42SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (one / negativeTwo)! !


!NumeroTest methodsFor: 'setup' stamp: 'NR 9/23/2018 23:46:28'!
setUp

	zero := Entero with: 0.
	one := Entero with: 1.
	two := Entero with: 2.
	three:= Entero with: 3.
	four := Entero with: 4.
	five := Entero with: 5.
	eight := Entero with: 8.
	negativeOne := Entero with: -1.
	negativeTwo := Entero with: -2.
	
	oneHalf := one / two.
	oneFifth := one / five.
	twoFifth := two / five.
	twoTwentyfifth := two / (Entero with: 25).
	fiveHalfs := five / two.
	! !


!classDefinition: #Numero category: 'Numero-Exercise'!
Object subclass: #Numero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
* aMultiplier

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
+ anAdder

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 22:21:28'!
- aSubtrahend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
/ aDivisor

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
invalidNumberType

	self error: self class invalidNumberTypeErrorDescription! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 23:37:13'!
negated
	
	^self * (Entero with: -1)! !


!Numero methodsFor: 'testing' stamp: 'NR 9/23/2018 23:36:49'!
isNegative

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isOne

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isZero

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: 'Numero-Exercise'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'NR 4/15/2021 16:42:02'!
canNotDivideByZeroErrorDescription

	^'No se puede dividir por cero!!!!!!'! !

!Numero class methodsFor: 'error descriptions' stamp: 'NR 4/15/2021 16:42:09'!
invalidNumberTypeErrorDescription
	
	^ 'Tipo de número inválido!!!!!!'! !


!classDefinition: #Entero category: 'Numero-Exercise'!
Numero subclass: #Entero
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Entero methodsFor: 'arithmetic operations' stamp: 'VV 9/13/2021 21:55:31'!
* aMultiplier 
	^ aMultiplier multiplyToEntero: self.
	
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'VV 9/15/2021 14:19:57'!
+ anAdder 
	^ anAdder addToEntero: self.
	
! !

!Entero methodsFor: 'arithmetic operations' stamp: 'VV 9/15/2021 14:20:18'!
- aSubtrahend 
	^ aSubtrahend substractToEntero: self.
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'VV 9/15/2021 14:20:40'!
/ aDivisor 
	^ aDivisor divideToEntero: self.
	
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'VV 9/15/2021 15:27:10'!
// aDivisor 
	
	^Entero with: value // aDivisor integerValue! !

!Entero methodsFor: 'arithmetic operations' stamp: 'VV 9/15/2021 14:14:22'!
addToEntero: anAdderEntero
	^Entero with: (anAdderEntero integerValue) + (self integerValue).
	
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'VV 9/15/2021 14:15:34'!
addToFraccion: anAdderFraccion
	^Fraccion with: anAdderFraccion numerator + (anAdderFraccion denominator * self) over: anAdderFraccion denominator.
	
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'VV 9/15/2021 14:29:14'!
divideToEntero: aDividendEntero
	^Fraccion with: aDividendEntero over: self.
	
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'VV 9/15/2021 14:18:59'!
divideToFraccion: aDividendFraccion
	^Fraccion with: aDividendFraccion numerator over: aDividendFraccion denominator * self.
	
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'VV 9/15/2021 15:30:17'!
fibonacci

	self subclassResponsibility.
		! !

!Entero methodsFor: 'arithmetic operations' stamp: 'VV 9/15/2021 15:27:16'!
greatestCommonDivisorWith: anEntero 
	
	^Entero with: (value gcd: anEntero integerValue)! !

!Entero methodsFor: 'arithmetic operations' stamp: 'VV 9/13/2021 21:41:33'!
multiplyToEntero: aMultiplierEntero
	^Entero with: (aMultiplierEntero integerValue) * (self integerValue).
	
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'VV 9/13/2021 21:35:22'!
multiplyToFraccion: aMultiplierFraccion 
	^Fraccion with: (aMultiplierFraccion numerator * self ) over: aMultiplierFraccion denominator.
	
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'VV 9/15/2021 14:16:58'!
substractToEntero: anMinuendEntero
	^Entero with: (anMinuendEntero integerValue) - (self integerValue).
	
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'VV 9/15/2021 14:18:06'!
substractToFraccion: anMinuendFraccion
	^Fraccion with: anMinuendFraccion numerator - (anMinuendFraccion denominator * self) over: anMinuendFraccion denominator.
	
	! !


!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 21:01'!
= anObject

	^(anObject isKindOf: self class) and: [ value = anObject integerValue ]! !

!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:17'!
hash

	^value hash! !


!Entero methodsFor: 'initialization' stamp: 'VV 9/15/2021 15:18:38'!
createEnteroWith: aValue 
	
	self subclassResponsibility.! !

!Entero methodsFor: 'initialization' stamp: 'HernanWilkinson 5/7/2016 20:09'!
initalizeWith: aValue 
	
	value := aValue! !


!Entero methodsFor: 'value' stamp: 'HernanWilkinson 5/7/2016 21:02'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	^value! !


!Entero methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:53:19'!
printOn: aStream

	aStream print: value ! !


!Entero methodsFor: 'testing' stamp: 'NR 9/23/2018 22:17:55'!
isNegative
	
	^value < 0! !

!Entero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 20:14'!
isOne
	
	^value = 1! !

!Entero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 20:12'!
isZero
	
	^value = 0! !


!Entero methodsFor: 'fraccion initialization' stamp: 'VV 9/15/2021 17:03:25'!
createFraccionWithNumerator: aNumerator
	^(Fraccion new) initializeWith: aNumerator over: self.
	
		! !

!Entero methodsFor: 'fraccion initialization' stamp: 'VV 9/15/2021 17:05:58'!
denominatorInitializeFraccion: aFraccion withNumerator: aNumerator
		
	aFraccion initializeNumerator: aNumerator.
	aFraccion initializeDenominator: self.
	! !

!Entero methodsFor: 'fraccion initialization' stamp: 'VV 9/15/2021 17:14:41'!
denominatorWithNumerator: aNumerator
	|greatestCommonDivisor numerator	 denominator|
	greatestCommonDivisor := aNumerator greatestCommonDivisorWith: self. 
	numerator := aNumerator // greatestCommonDivisor.
	denominator := self // greatestCommonDivisor.
	^denominator createFraccionWithNumerator: numerator.
		! !

!Entero methodsFor: 'fraccion initialization' stamp: 'VV 9/15/2021 17:22:36'!
numeratorInitializeFraccion: aFraccion withDenominator: aDenominator.
	
	^aDenominator denominatorInitializeFraccion: aFraccion withNumerator: self.! !

!Entero methodsFor: 'fraccion initialization' stamp: 'VV 9/15/2021 17:14:28'!
numeratorWithDenominator: aDenominator
	^aDenominator denominatorWithNumerator: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Entero class' category: 'Numero-Exercise'!
Entero class
	instanceVariableNames: ''!

!Entero class methodsFor: 'instance creation' stamp: 'NR 4/15/2021 16:42:24'!
negativeFibonacciErrorDescription
	^ ' Fibonacci no está definido aquí para Enteros Negativos!!!!!!'! !

!Entero class methodsFor: 'instance creation' stamp: 'VV 9/15/2021 15:17:40'!
with: aValue 
	
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].
	^(self subclasses detect: [:aEnteroSubclass | aEnteroSubclass createEnteroWith: aValue]) new initalizeWith: aValue	.
	! !


!classDefinition: #EnteroMayorAUno category: 'Numero-Exercise'!
Entero subclass: #EnteroMayorAUno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!EnteroMayorAUno methodsFor: 'arithmetic operations' stamp: 'VV 9/15/2021 15:30:38'!
fibonacci
	|one two|
	one := Entero with: 1.
	two := Entero with: 2.	
	
	^ (self - one) fibonacci + (self - two) fibonacci! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EnteroMayorAUno class' category: 'Numero-Exercise'!
EnteroMayorAUno class
	instanceVariableNames: ''!

!EnteroMayorAUno class methodsFor: 'subclass differenciation' stamp: 'VV 9/15/2021 15:23:53'!
createEnteroWith: aValue 
	
	^ aValue >1.! !


!classDefinition: #EnteroNegativo category: 'Numero-Exercise'!
Entero subclass: #EnteroNegativo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!EnteroNegativo methodsFor: 'arithmetic operations' stamp: 'VV 9/15/2021 16:34:11'!
denominatorWithNumerator: aNumerator.
	^aNumerator negated / self negated! !

!EnteroNegativo methodsFor: 'arithmetic operations' stamp: 'VV 9/15/2021 15:28:38'!
fibonacci
	self error: Entero negativeFibonacciErrorDescription.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EnteroNegativo class' category: 'Numero-Exercise'!
EnteroNegativo class
	instanceVariableNames: ''!

!EnteroNegativo class methodsFor: 'subclass differenciation' stamp: 'VV 9/15/2021 15:23:44'!
createEnteroWith: aValue 
	
	^ aValue < 0.
	! !


!classDefinition: #EnteroUno category: 'Numero-Exercise'!
Entero subclass: #EnteroUno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!EnteroUno methodsFor: 'arithmetic operations' stamp: 'VV 9/15/2021 15:29:14'!
fibonacci
	^ self.! !


!EnteroUno methodsFor: 'fraccion initialization' stamp: 'VV 9/15/2021 16:40:49'!
createFraccionWithNumerator: aNumerator
	^aNumerator.	 ! !

!EnteroUno methodsFor: 'fraccion initialization' stamp: 'VV 9/15/2021 17:24:10'!
denominatorInitializeFraccion: aFraccion withNumerator: aNumerator
	 self error: 'una fraccion no puede tener denominador 1 porque sino es un entero'.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EnteroUno class' category: 'Numero-Exercise'!
EnteroUno class
	instanceVariableNames: ''!

!EnteroUno class methodsFor: 'subclass differenciation' stamp: 'VV 9/15/2021 15:25:43'!
createEnteroWith: aValue
	^ aValue = 1.! !


!classDefinition: #EnteroZero category: 'Numero-Exercise'!
Entero subclass: #EnteroZero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!EnteroZero methodsFor: 'arithmetic operations' stamp: 'VV 9/15/2021 15:29:37'!
fibonacci
	^ Entero with: 1.! !


!EnteroZero methodsFor: 'fraccion initialization' stamp: 'VV 9/15/2021 16:42:10'!
denominatorWithNumerator: aNumerator.
 	self error: self class canNotDivideByZeroErrorDescription.! !

!EnteroZero methodsFor: 'fraccion initialization' stamp: 'VV 9/15/2021 17:23:16'!
numeratorInitializeFraccion: aFraccion withDenominator: aDenominator
 	self error: 'una fraccion no puede ser cero'.! !

!EnteroZero methodsFor: 'fraccion initialization' stamp: 'VV 9/15/2021 16:32:33'!
numeratorWithDenominator: aDenominator.
 	^self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EnteroZero class' category: 'Numero-Exercise'!
EnteroZero class
	instanceVariableNames: ''!

!EnteroZero class methodsFor: 'subclass differenciation' stamp: 'VV 9/15/2021 15:25:47'!
createEnteroWith: aValue
	^aValue = 0.! !


!classDefinition: #Fraccion category: 'Numero-Exercise'!
Numero subclass: #Fraccion
	instanceVariableNames: 'numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Fraccion methodsFor: 'arithmetic operations' stamp: 'VV 9/13/2021 21:55:58'!
* aMultiplier 
	
	^aMultiplier multiplyToFraccion: self.
	! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'VV 9/15/2021 14:26:32'!
+ anAdder 
  	^ anAdder addToFraccion: self.
	
	
	! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'VV 9/15/2021 14:27:11'!
- aSubtrahend 
	^ aSubtrahend substractToFraccion: self.
	
	
! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'VV 9/15/2021 14:27:27'!
/ aDivisor 
	^aDivisor divideToFraccion: self.
	
	! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'VV 9/15/2021 14:22:28'!
addToEntero: aAdderEntero
	
	^Fraccion with: self numerator + (self denominator * aAdderEntero) over: self denominator.
	
	! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'VV 9/15/2021 14:23:16'!
addToFraccion: aAdderFraccion
	
	^Fraccion with: (self numerator * aAdderFraccion denominator) + (self denominator * aAdderFraccion numerator) over: self denominator * aAdderFraccion denominator.
	
	! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'VV 9/15/2021 14:25:18'!
divideToEntero: aDividendEntero
	
	^Fraccion with: (self denominator * aDividendEntero) over: self numerator.
	
	! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'VV 9/15/2021 14:25:55'!
divideToFraccion: aDividendFraccion
	
	^Fraccion with: (self denominator * aDividendFraccion numerator) over: self numerator * aDividendFraccion denominator.
	
	! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'VV 9/13/2021 21:50:01'!
multiplyToEntero: aMultiplierEntero
	
	^Fraccion with: self numerator * aMultiplierEntero over: self denominator.
	
	! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'VV 9/13/2021 21:37:59'!
multiplyToFraccion: aMultiplierFraccion
	
	^Fraccion with: self numerator * aMultiplierFraccion numerator over: self denominator * aMultiplierFraccion denominator.
	
	! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'VV 9/15/2021 14:24:26'!
substractToEntero: aMinuendEntero
	
	^Fraccion with: (self denominator * aMinuendEntero) - self numerator over: self denominator.
	
	! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'VV 9/15/2021 14:23:56'!
substractToFraccion: aMinuendFraccion
	
	^Fraccion with: (self denominator * aMinuendFraccion numerator) - (self numerator * aMinuendFraccion denominator) over: self denominator * aMinuendFraccion denominator.
	
	! !


!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:42'!
= anObject

	^(anObject isKindOf: self class) and: [ (numerator * anObject denominator) = (denominator * anObject numerator) ]! !

!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:50'!
hash

	^(numerator hash / denominator hash) hash! !


!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
denominator

	^ denominator! !

!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
numerator

	^ numerator! !


!Fraccion methodsFor: 'initialization' stamp: 'VV 9/15/2021 15:56:51'!
initializeDenominator: aDenominator

	
	denominator:= aDenominator.
	
	! !

!Fraccion methodsFor: 'initialization' stamp: 'VV 9/15/2021 15:56:37'!
initializeNumerator: aNumerator

	
	numerator:= aNumerator.
	
	! !

!Fraccion methodsFor: 'initialization' stamp: 'VV 9/15/2021 17:23:35'!
initializeWith: aNumerator over: aDenominator

	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"
	aNumerator numeratorInitializeFraccion: self withDenominator: aDenominator.
	
	! !


!Fraccion methodsFor: 'testing' stamp: 'NR 9/23/2018 23:41:38'!
isNegative
	
	^numerator < 0! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isOne
	
	^false! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isZero
	
	^false! !


!Fraccion methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:54:46'!
printOn: aStream

	aStream 
		print: numerator;
		nextPut: $/;
		print: denominator ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Fraccion class' category: 'Numero-Exercise'!
Fraccion class
	instanceVariableNames: ''!

!Fraccion class methodsFor: 'instance creation' stamp: 'VV 9/15/2021 17:09:53'!
with: aDividend over: aDivisor
	
	^aDividend numeratorWithDenominator: aDivisor.
	
	
	! !
