FileStream fileIn: './GSTCocoa/GSTCocoa.st'.
FileStream fileIn: './ComplexNumber.st'.

width := 200.
height := 200.
windowScale := 3.
components := 4.
iterations := 20.
power := 2.0.
translation := Point x: -0.5 y: 0.0.

application := CocoaApplication start.
window := application makeWindowOfWidth: windowScale * width andHeight: windowScale * height.
window setTitle: 'Mandelbrot'.

contentView := window contentView.
imageView := CocoaImageView x: 0 y: 0 width: windowScale * width height: windowScale * height.
imageView setBackgroundRed: 50 green: 100 blue: 200.
imageView setImageScaling: CocoaImageView scaleAxesIndependently.
imageView setAutoresizingMask: (CocoaView widthSizable) + (CocoaView heightSizable).
contentView addSubview: imageView.

imageData := ByteArray new: (components * width * height).

(0 to: height - 1) do: [ :y | 
    (0 to: width - 1) do: [ :x |
        | red green blue alpha offset c z i threshold |
        offset := components * (y * width + x) + 1.
        c := ComplexNumber
            real: 2.0 * (x asFloat / width) - 1.0 + translation x
            imaginary: 2.0 * (y asFloat / height) - 1.0 + translation y.
        z := c.
        i := 0.

        [
            z := (z raisedTo: power) + c.
            i := i + 1.
            (i < iterations) & (z magnitudeSquared < 4.0)
        ] whileTrue.

        threshold := 1.0 - (i / iterations asFloat).

        (i = iterations) 
            ifTrue: [
                red := 0.
                green := 0.
                blue := 0.
                alpha := 255.
            ]
            ifFalse: [
                blue := threshold * 255.
                red := 128 - (blue / 2).
                green := 128 + (blue / 2).
                alpha := 255.
            ].

        imageData at: (offset + 0) put: (red ceiling).
        imageData at: (offset + 1) put: (green ceiling).
        imageData at: (offset + 2) put: (blue ceiling).
        imageData at: (offset + 3) put: alpha.
    ].
].

context := CoreGraphicsContext width: width height: height.
context updateFromByteArray: imageData.
imageView setImage: (context image).

application startRunLoop.