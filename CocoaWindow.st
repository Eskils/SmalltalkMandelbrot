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

makeWindowOfSize: aWidth height: aHeight title: aTitle
    "I make a window in Cocoa of the given size and title."
    <cCall: 'cocoa_makeWindow' returning: #void
        args: #( #int #int #string )>!

! !