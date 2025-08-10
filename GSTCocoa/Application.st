Object subclass: #CocoaApplication
    instanceVariableNames: ''
    classVariableNames: ''
    poolDictionaries: ''
    category: 'Systems'! !

!CocoaApplication class methodsFor: 'Instances'!

start
    "I start a new Cocoa application instance. My most important puprose is to make a memory pool and a shared application instance."
    CocoaApplication cocoa_application_start.
    ^CocoaApplication new!

!CocoaApplication methodsFor: 'Run loop'!

startRunLoop
    "I start the run loop."
    <cCall: 'cocoa_application_startRunLoop' returning: #void
        args: #()>!

stopRunLoop
    "I stop the run loop."
    <cCall: 'cocoa_application_stopRunLoop' returning: #void
        args: #()>!

!CocoaApplication methodsFor: 'Windows & Panels'!

makeWindowOfWidth: aWidth andHeight: aHeight
    "Answer a CocoaWindow of size aWidth by aHeight"
    ^CocoaWindow width: aWidth height: aHeight! !

!CocoaApplication class methodsFor: 'C call-outs'!

cocoa_application_start
    "Use “CocoaApplication start” instead. I start a new Cocoa application instance. My most important puprose is to make a memory pool and a shared application instance."
    <cCall: 'cocoa_application_start' returning: #void
        args: #()>!

! !