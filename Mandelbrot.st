FileStream fileIn: './GSTCocoa/GSTCocoa.st'.

| application window |
application := CocoaApplication start.
window := application makeWindowOfWidth: 300 andHeight: 200.
window setTitle: 'Mandelbrot'.
application startRunLoop.