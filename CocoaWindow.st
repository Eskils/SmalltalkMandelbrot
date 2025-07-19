DLD addLibrary: './lib/libGSTCocoa.dylib'.

Object subclass: #CocoaWindow
    instanceVariableNames: ''
    classVariableNames: ''
    poolDictionaries: ''
    category: 'Cocoa Bindings'! !

!CocoaWindow class methodsFor: 'C call-outs'!

output: aText
    "I send the given text to the current output"
    <cCall: 'cocoa_output' returning: #void
        args: #( #string )>!

start
    "I start a Cocoa environment. My most important puprose is to make a memory pool and a shared application instance."
    <cCall: 'cocoa_start' returning: #void
        args: #()>!

makeWindowOfSize: aWidth height: aHeight title: aTitle
    "I make a window in Cocoa of the given size and title."
    <cCall: 'cocoa_makeWindow' returning: #void
        args: #( #int #int #string )>!

startRunLoop
    "I start the run loop."
    <cCall: 'cocoa_startRunLoop' returning: #void
        args: #()>!

stopRunLoop
    "I stop the run loop."
    <cCall: 'cocoa_stopRunLoop' returning: #void
        args: #()>!
! !