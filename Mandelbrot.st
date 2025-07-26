FileStream fileIn: './GSTCocoa/GSTCocoa.st'.

width := 300.
height := 200.
components := 4.

application := CocoaApplication start.
window := application makeWindowOfWidth: width andHeight: height.
window setTitle: 'Mandelbrot'.

contentView := window contentView.
box := CocoaImageView x: 0 y: 0 width: width height: height.
box setBackgroundRed: 50 green: 100 blue: 200.
box setImageScaling: CocoaImageView scaleAxesIndependently.
box setAutoresizingMask: (CocoaView widthSizable) + (CocoaView heightSizable).
contentView addSubview: box.

imageData := ByteArray new: (components * width * height).

x := 0.
y := 0.

height timesRepeat: [
    x := 0.
    width timesRepeat: [
        | red green blue alpha offset |
        red := (x asFloat / width) * 255.
        green := (y asFloat / height) * 255.
        blue := 255.0 - red.
        alpha := 255.
        
        offset := components * (y * width + x) + 1.

        imageData at: (offset + 0) put: (red ceiling).
        imageData at: (offset + 1) put: (green ceiling).
        imageData at: (offset + 2) put: (blue ceiling).
        imageData at: (offset + 3) put: alpha.

        x := x + 1.
    ].
    y := y + 1.
].

context := CoreGraphicsContext width: width height: height.
context updateFromByteArray: imageData.
box setImage: (context image).

application startRunLoop.