FileStream fileIn: './GSTCocoa/GSTCocoa.st'.

application := CocoaApplication start.
window := application makeWindowOfWidth: 300 andHeight: 200.
window setTitle: 'Mandelbrot'.

contentView := window contentView.
box := CocoaImageView x: 8 y: 8 width: (300 - 16) height: (200 - 16).
box setBackgroundRed: 50 green: 100 blue: 200.
box setAutoresizingMask: (CocoaView widthSizable) + (CocoaView heightSizable).
contentView addSubview: box.

context := CoreGraphicsContext width: 100 height: 100.
context fillWithRed: 255 green: 0 blue: 0.
box setImage: (context image).

application startRunLoop.