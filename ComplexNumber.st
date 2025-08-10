Object subclass: #ComplexNumber
    instanceVariableNames: 'real imaginary'
    classVariableNames: ''
    poolDictionaries: ''
    category: 'Numbers'! !

!ComplexNumber class methodsFor: 'Instance creation'!

real: aRealComponent imaginary: anImaginaryComponent
    "Answer a ComplexNumber with aRealComponent as its real part and anImaginaryComponent as its imaginary part"
    ^(super new real: aRealComponent) 
        imaginary: anImaginaryComponent!

magnitude: aLength argument: anAngle
    "Answer a ComplexNumber with aLength as its magnitude and anAngle as its argument"
    ^(super new real: aLength * anAngle cos)
        imaginary: aLength * anAngle sin!

zero
    "Answer a ComplexNumber with a magnitude of zero"
    ^ComplexNumber real: 0 imaginary: 0!

!ComplexNumber methodsFor: 'Accessing'!

real
    "Answer the real part of the receiver"
    ^real!

real: aRealComponent
    "Set the real part of the receiver"
    real := aRealComponent!

imaginary
    "Answer the imaginary part of the receiver"
    ^imaginary!

imaginary: anImaginaryComponent
    "Set the imaginray part of the receiver"
    imaginary := anImaginaryComponent!

argument
    "Answer the argument of the receiver"
    ^imaginary arcTan: real!

magnitude
    "Answer the magnitude of the receiver"
    ^(real squared + imaginary squared) sqrt!

magnitudeSquared
    "Answer the squared magnitude of the receiver"
    ^real squared + imaginary squared!

!ComplexNumber methodsFor: 'Operations'!

+ aComplexNumber
    "Answer the sum of the receiver and aComplexNumber"
    ^ComplexNumber 
        real: (self real + aComplexNumber real) 
        imaginary: (self imaginary + aComplexNumber imaginary)!

raisedTo: aNumber
    "Answer the receiver raised to aNumber power"
    | raisedMagnitude raisedArgument |
    raisedMagnitude := self magnitude raisedTo: aNumber.
    raisedArgument := (self argument * aNumber) rem: (2 * Float pi).
    ^ComplexNumber
        magnitude: raisedMagnitude
        argument: raisedArgument

! !

