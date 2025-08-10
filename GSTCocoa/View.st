Object subclass: #CocoaView
    instanceVariableNames: 'viewReference'
    classVariableNames: ''
    poolDictionaries: ''
    category: 'Views'! !

!CocoaView class methodsFor: 'Instances'!

viewWithReference: reference
    "I instantiate a new CocoaView instance from a reference"
    ^super new
        viewReference: reference!

x: anXCoordinate y: aYCoordinate width: aWidth height: aHeight
    "I make a new view at the given coordinates and with the given dimensions."
    ^CocoaView viewWithReference: 
        (CocoaView cocoa_view_make: anXCoordinate y: aYCoordinate width: aWidth height: aHeight)!

!CocoaView methodsFor: 'Accessors'!

viewReference
    ^viewReference!

viewReference: reference
    viewReference := reference!

!CocoaView methodsFor: 'Style'!

backgroundRed: aRedComponent green: aGreenComponent blue: aBlueComponent
    "I change the background color of this view"
    CocoaView view: viewReference setBackgroundRed: aRedComponent green: aGreenComponent blue: aBlueComponent!

!CocoaView methodsFor: 'Layout'!

frame: anXCoordinate y: aYCoordinate width: aWidth height: aHeight
    "I change the size and position of this view"
    CocoaView view: viewReference setFrame: anXCoordinate y: aYCoordinate width: aWidth height: aHeight!

autoresizingMask: aMask
    "I change the autoresizing mask of this view"
    CocoaView view: viewReference setAutoresizingMask: aMask!

addSubview: aSubview
    CocoaView view: viewReference addSubview: (aSubview viewReference)!

!CocoaView class methodsFor: 'Autoresizing Mask Options'!

notSizable
    <cCall: 'kCocoaViewNotSizable' returning: #uInt
        args: #( )>!

minXMargin
    <cCall: 'kCocoaViewMinXMargin' returning: #uInt
        args: #( )>!

widthSizable
    <cCall: 'kCocoaViewWidthSizable' returning: #uInt
        args: #( )>!

maxXMargin
    <cCall: 'kCocoaViewMaxXMargin' returning: #uInt
        args: #( )>!

minYMargin
    <cCall: 'kCocoaViewMinYMargin' returning: #uInt
        args: #( )>!

heightSizable
    <cCall: 'kCocoaViewHeightSizable' returning: #uInt
        args: #( )>!

maxYMargin
    <cCall: 'kCocoaViewMaxYMargin' returning: #uInt
        args: #( )>!

!CocoaView class methodsFor: 'C call-outs'!

cocoa_view_make: anXCoordinate y: aYCoordinate width: aWidth height: aHeight
    "I make a new view with the given coordinates and dimensions."
    <cCall: 'cocoa_view_make' returning: #cObject
        args: #( #double #double #double #double )>!

view: aViewReference addSubview: aSubviewReference
    "I change the autoresizing mask of this view"
    <cCall: 'cocoa_view_addSubview' returning: #void
        args: #( #cObject #cObject )>!

view: aViewReference setFrame: anXCoordinate y: aYCoordinate width: aWidth height: aHeight
    "I change the size and position of this view"
    <cCall: 'cocoa_view_setFrame' returning: #void
        args: #( #cObject #double #double #double #double )>!

view: aViewReference setAutoresizingMask: aMask
    "I change the autoresizing mask of this view"
    <cCall: 'cocoa_view_setAutoresizingMask' returning: #void
        args: #( #cObject #uInt )>!

view: aViewReference setBackgroundRed: aRedComponent green: aGreenComponent blue: aBlueComponent
    "I change the background color of this view"
    <cCall: 'cocoa_view_setBackground' returning: #void
        args: #( #cObject #uInt #uInt #uInt )>!
! !