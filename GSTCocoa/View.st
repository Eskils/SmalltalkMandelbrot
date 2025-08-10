Object subclass: #CocoaView
    instanceVariableNames: 'viewReference'
    classVariableNames: ''
    poolDictionaries: ''
    category: 'Views'! !

!CocoaView class methodsFor: 'Instances'!

viewWithReference: aReference
    "Answer a CocoaView using aReference as its backing view"
    ^super new
        viewReference: aReference!

x: anXCoordinate y: aYCoordinate width: aWidth height: aHeight
    "Answer a CocoaView of size aWidth by aHeight, placed at (anXCoordinate, aYCoordinate)"
    ^CocoaView viewWithReference: 
        (CocoaView cocoa_view_make: anXCoordinate y: aYCoordinate width: aWidth height: aHeight)!

!CocoaView methodsFor: 'Accessors'!

viewReference
    "Answer the reference backing the receiver"
    ^viewReference!

viewReference: reference
    "Set the reference backing the receiver"
    viewReference := reference!

!CocoaView methodsFor: 'Style'!

backgroundRed: aRedComponent green: aGreenComponent blue: aBlueComponent
    "Set the background color of the receiver"
    CocoaView view: viewReference setBackgroundRed: aRedComponent green: aGreenComponent blue: aBlueComponent!

!CocoaView methodsFor: 'Layout'!

frame: anXCoordinate y: aYCoordinate width: aWidth height: aHeight
    "Set the size and position of the receiver"
    CocoaView view: viewReference setFrame: anXCoordinate y: aYCoordinate width: aWidth height: aHeight!

autoresizingMask: aMask
    "Set the autoresizing mask of the receiver"
    CocoaView view: viewReference setAutoresizingMask: aMask!

addSubview: aSubview
    "Add aSubview as a subview of the receiver"
    CocoaView view: viewReference addSubview: (aSubview viewReference)!

!CocoaView class methodsFor: 'Autoresizing Mask Options'!

notSizable
    "The view cannot be resized.
    My NSAutoresizingMaskOptions counterpart is NSViewNotSizable"
    <cCall: 'kCocoaViewNotSizable' returning: #uInt
        args: #( )>!

minXMargin
    "The left margin between the view and its superview is flexible.
    My NSAutoresizingMaskOptions counterpart is NSViewMinXMargin"
    <cCall: 'kCocoaViewMinXMargin' returning: #uInt
        args: #( )>!

widthSizable
    "The view’s width is flexible.
    My NSAutoresizingMaskOptions counterpart is NSViewWidthSizable"
    <cCall: 'kCocoaViewWidthSizable' returning: #uInt
        args: #( )>!

maxXMargin
    "The right margin between the view and its superview is flexible.
    My NSAutoresizingMaskOptions counterpart is NSViewMaxXMargin"
    <cCall: 'kCocoaViewMaxXMargin' returning: #uInt
        args: #( )>!

minYMargin
    "The bottom margin between the view and its superview is flexible.
    My NSAutoresizingMaskOptions counterpart is NSViewMinYMargin"
    <cCall: 'kCocoaViewMinYMargin' returning: #uInt
        args: #( )>!

heightSizable
    "The view’s height is flexible.
    My NSAutoresizingMaskOptions counterpart is NSViewHeightSizable"
    <cCall: 'kCocoaViewHeightSizable' returning: #uInt
        args: #( )>!

maxYMargin
    "The top margin between the view and its superview is flexible.
    My NSAutoresizingMaskOptions counterpart is NSViewMaxYMargin"
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