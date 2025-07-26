Object subclass: #CoreGraphicsContext
    instanceVariableNames: 'contextReference'
    classVariableNames: ''
    poolDictionaries: ''
    category: 'Graphics'! !

!CoreGraphicsContext class methodsFor: 'Instance creation'!

width: aWidth height: aHeight
    "I create a new context of the given dimensions."
    ^CoreGraphicsContext contextWithReference:
        (CoreGraphicsContext cg_context_create: aWidth height: aHeight)!

contextWithReference: reference
    "I create a new context with the given reference."
    ^super new
        contextReference: reference!

!CoreGraphicsContext methodsFor: 'Accessors'!

contextReference
    ^contextReference!

contextReference: reference
    contextReference := reference!

!CoreGraphicsContext methodsFor: 'Operations'!

fillWithRed: aRedComponent green: aGreenComponent blue: aBlueComponent
    "I fill the context with the specified color"
    CoreGraphicsContext cg_context_fill: contextReference red: aRedComponent green: aGreenComponent blue: aBlueComponent!

updateFromByteArray: aByteArray
    "I will copy the contents of the given byte array to the graphics context."
    CoreGraphicsContext cg_context_copy: contextReference source: aByteArray length: (aByteArray size)!

image
    "I produce a Core Graphics image from this graphics context."
    ^CoreGraphicsContext cg_image_create_from_context: contextReference!

!CoreGraphicsContext class methodsFor: 'C call-outs'!

cg_context_create: aWidth height: aHeight
    <cCall: 'cg_context_create' returning:#cObject
        args: #( #int #int )>!

cg_context_fill: aContext red: aRedComponent green: aGreenComponent blue: aBlueComponent
    <cCall: 'cg_context_fill' returning:#void
        args: #( #cObject #uInt #uInt #uInt )>!

cg_context_copy: aContext source: aSource length: aLength
    <cCall: 'cg_context_copy' returning:#void
        args: #( #cObject #byteArray #int )>!

cg_image_create_from_context: aContext
    <cCall: 'cg_image_create_from_context' returning:#cObject
        args: #( #cObject )>!

! !