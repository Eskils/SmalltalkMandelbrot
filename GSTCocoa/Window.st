Object subclass: #CocoaWindow
    instanceVariableNames: 'windowReference'
    classVariableNames: ''
    poolDictionaries: ''
    category: 'Windows & Panels'! !

!CocoaWindow class methodsFor: 'Instances'!

windowWithReference: aReference
    "Answer a CocoaWindow using aReference as its backing window"
    ^super new
        windowReference: aReference!

width: aWidth height: aHeight
    "Answer a CocoaWindow of size aWidth by aHeight"
    ^CocoaWindow windowWithReference: 
        (CocoaWindow cocoa_window_make: aWidth height: aHeight)!

!CocoaWindow methodsFor: 'Accessors'!

windowReference
    "Answer the reference backing the receiver"
    ^windowReference!

windowReference: reference
    "Set the reference backing the receiver"
    windowReference := reference!

!CocoaWindow methodsFor: 'Customizations'!

title: aTitle
    "Set the title of the receiver"
    CocoaWindow window: windowReference setTitle: aTitle! !

!CocoaWindow methodsFor: 'Views'!

contentView
    "Answer the content view of the receiver"
    ^CocoaView viewWithReference:
        (CocoaWindow contentViewForWindow: windowReference)!

!CocoaWindow class methodsFor: 'C call-outs'!

cocoa_window_make: aWidth height: aHeight
    "I make a new window with the given dimensions."
    <cCall: 'cocoa_window_make' returning: #cObject
        args: #( #int #int )>!

window: windowReference setTitle: aTitle
    "I change the title of this window"
    <cCall: 'cocoa_window_setTitle' returning: #void
        args: #( #cObject #string )>!

contentViewForWindow: windowReference
    "I tell you about the content view of this window"
    <cCall: 'cocoa_window_contentView' returning: #cObject
        args: #( #cObject )>!
! !