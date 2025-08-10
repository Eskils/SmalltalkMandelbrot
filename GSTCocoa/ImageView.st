CocoaView subclass: #CocoaImageView
    instanceVariableNames: ''
    classVariableNames: ''
    poolDictionaries: ''
    category: 'Views'! !

!CocoaImageView class methodsFor: 'Instance creation'!

x: anXCoordinate y: aYCoordinate width: aWidth height: aHeight
    "Answer a CocoaImageView of size aWidth by aHeight, placed at (anXCoordinate, aYCoordinate)"
    ^CocoaImageView viewWithReference: 
        (CocoaImageView cocoa_image_view_make: anXCoordinate y: aYCoordinate width: aWidth height: aHeight)!

!CocoaImageView methodsFor: 'Displaying images'!

image: anImage
    "Set anImage as the receiver’s image"
    CocoaImageView cocoa_image_view_setImage: viewReference image: anImage!

imageScaling: anImageScaling
    "Set anImageScaling as the mode for scaling the displayed image."
    CocoaImageView cocoa_image_view_setImageScaling: viewReference imageScaling: anImageScaling!

!CocoaImageView class methodsFor: 'Image Scaling'!

scaleProportionallyDown
    "If it is too large for the destination, scale the image down while preserving the aspect ratio.
    My NSImageScaling counterpart is NSImageScaleProportionallyDown"
    <cCall: 'kCocoaImageScaleProportionallyDown' returning: #uInt
        args: #( )>!

scaleAxesIndependently
    "Scale each dimension to exactly fit destination.
    My NSImageScaling counterpart is NSImageScaleAxesIndependently"
    <cCall: 'kCocoaImageScaleAxesIndependently' returning: #uInt
        args: #( )>!

scaleNone
    "Do not scale the image.
    My NSImageScaling counterpart is NSImageScaleNone"
    <cCall: 'kCocoaImageScaleNone' returning: #uInt
        args: #( )>!

scaleProportionallyUpOrDown
    "Scale the image to its maximum possible dimensions while both staying within the destination 
    area and preserving its aspect ratio.
    My NSImageScaling counterpart is NSImageScaleProportionallyUpOrDown"
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