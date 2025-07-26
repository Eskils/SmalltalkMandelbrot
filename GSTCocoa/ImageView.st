CocoaView subclass: #CocoaImageView
    instanceVariableNames: ''
    classVariableNames: ''
    poolDictionaries: ''
    category: 'Views'! !

!CocoaImageView class methodsFor: 'Instances'!

x: anXCoordinate y: aYCoordinate width: aWidth height: aHeight
    "I make a new view at the given coordinates and with the given dimensions."
    ^CocoaImageView viewWithReference: 
        (CocoaImageView cocoa_image_view_make: anXCoordinate y: aYCoordinate width: aWidth height: aHeight)!

!CocoaImageView methodsFor: 'Displaying images'!

setImage: anImage
    "I set the image of the given image view"
    CocoaImageView cocoa_image_view_setImage: viewReference image: anImage!

setImageScaling: anImageScaling
    "I set the mode for scaling the displayed image."
    CocoaImageView cocoa_image_view_setImageScaling: viewReference imageScaling: anImageScaling!

!CocoaImageView class methodsFor: 'Image Scaling'!

scaleProportionallyDown
    <cCall: 'kCocoaImageScaleProportionallyDown' returning: #uInt
        args: #( )>!

scaleAxesIndependently
    <cCall: 'kCocoaImageScaleAxesIndependently' returning: #uInt
        args: #( )>!

scaleNone
    <cCall: 'kCocoaImageScaleNone' returning: #uInt
        args: #( )>!

scaleProportionallyUpOrDown
    <cCall: 'kCocoaImageScaleProportionallyUpOrDown' returning: #uInt
        args: #( )>!

!CocoaImageView class methodsFor: 'C call-outs'!

cocoa_image_view_make: anXCoordinate y: aYCoordinate width: aWidth height: aHeight
    "I make a new image view with the given coordinates and dimensions."
    <cCall: 'cocoa_image_view_make' returning: #cObject
        args: #( #double #double #double #double )>!

cocoa_image_view_setImage: aReference image: anImage
    "I set the image of the given image view"
    <cCall: 'cocoa_image_view_setImage' returning: #void
        args: #( #cObject #cObject )>!

cocoa_image_view_setImageScaling: aReference imageScaling: anImageScaling
    "I set the image of the given image view"
    <cCall: 'cocoa_image_view_setImageScaling' returning: #void
        args: #( #cObject #uInt )>!

! !