Object subclass: #CocoaWindow
    instanceVariableNames: 'windowReference'
    classVariableNames: ''
    poolDictionaries: ''
    category: 'Windows & Panels'! !

!CocoaWindow class methodsFor: 'Instances'!

windowWithReference: reference
    "I instantiate a new CocoaWindow instance"
    ^super new
        windowReference: reference!

width: aWidth height: aHeight
    "I make a new window with the given dimensions."
    ^CocoaWindow windowWithReference: 
        (CocoaWindow cocoa_window_make: aWidth height: aHeight)!

!CocoaWindow methodsFor: 'Accessors'!

windowReference
    ^windowReference!

windowReference: reference
    windowReference := reference!

!CocoaWindow methodsFor: 'Customizations'!

setTitle: aTitle
    "I change the title of this window"
    CocoaWindow window: windowReference setTitle: aTitle! !

!CocoaWindow class methodsFor: 'C call-outs'!

cocoa_window_make: aWidth height: aHeight
    "I make a new window with the given dimensions."
    <cCall: 'cocoa_window_make' returning: #cObject
        args: #( #int #int )>!

window: windowReference setTitle: aTitle
    "I change the title of this window"
    <cCall: 'cocoa_window_setTitle' returning: #void
        args: #( #cObject #string )>!
! !