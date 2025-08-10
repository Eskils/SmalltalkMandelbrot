Object subclass: #CoreGraphicsContext
    instanceVariableNames: 'contextReference'
    classVariableNames: ''
    poolDictionaries: ''
    category: 'Graphics'! !

!CoreGraphicsContext class methodsFor: 'Instance creation'!

width: aWidth height: aHeight
    "Answer a CoreGraphicsContext of size aWidth by aHeight"
    ^CoreGraphicsContext contextWithReference:
        (CoreGraphicsContext cg_context_create: aWidth height: aHeight)!

contextWithReference: aReference
    "Answer a CoreGraphicsContext backed by aReference"
    ^super new
        contextReference: aReference!

!CoreGraphicsContext methodsFor: 'Accessors'!

contextReference
    "Answer the reference backing the receiver"
    ^contextReference!

contextReference: reference
    "Set the reference backing the receiver"
    contextReference := reference!

!CoreGraphicsContext methodsFor: 'Operations'!

fillWithRed: aRedComponent green: aGreenComponent blue: aBlueComponent
    "I fill the receiver with the sent color"
    CoreGraphicsContext cg_context_fill: contextReference red: aRedComponent green: aGreenComponent blue: aBlueComponent!

updateFromByteArray: aByteArray
    "I copy the contents of aByteArray to the receiver"
    CoreGraphicsContext cg_context_copy: contextReference source: aByteArray length: (aByteArray size)!

image
    "Answer a Core Graphics image produced from the receiver"
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