Object subclass: #ComplexNumber
    instanceVariableNames: 'real imaginary'
    classVariableNames: ''
    poolDictionaries: ''
    category: 'Numbers'! !

!ComplexNumber class methodsFor: 'Instance creation'!

real: aRealComponent imaginary: anImaginaryComponent
    "I create a new complex number with the specified real and imaginary parts."
    ^(super new real: aRealComponent) 
        imaginary: anImaginaryComponent!

magnitude: aLength argument: anAngle
    "I create a new complex number with the specified magnitude and argument."
    ^(super new real: aLength * anAngle cos)
        imaginary: aLength * anAngle sin!

zero
    "I create a new complex number with a magnitude of 0."
    ^ComplexNumber real: 0.0 imaginary: 0.0!

!ComplexNumber methodsFor: 'Accessing'!

real
    ^real!

real: aRealComponent
    real := aRealComponent!

imaginary
    ^imaginary!

imaginary: anImaginaryComponent
    imaginary := anImaginaryComponent!

argument
    ^imaginary arcTan: real!

magnitude
    ^(real squared + imaginary squared) sqrt!

magnitudeSquared
    ^real squared + imaginary squared!

!ComplexNumber methodsFor: 'Operations'!

+ aComplexNumber
    "I answer the sum of this complex number with the sent complex number."
    ^ComplexNumber 
        real: (self real + aComplexNumber real) 
        imaginary: (self imaginary + aComplexNumber imaginary)!

raisedTo: aNumber
    "I answer this complex number raised to the requested power."
    | raisedMagnitude raisedArgument |
    raisedMagnitude := self magnitude raisedTo: aNumber.
    raisedArgument := (self argument * aNumber) rem: (2 * Float pi).
    ^ComplexNumber
        magnitude: raisedMagnitude
        argument: raisedArgument

! !

