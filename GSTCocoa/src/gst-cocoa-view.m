#include "gst-cocoa-view.h"

NSView *cocoa_view_make(double x, double y, double width, double height) {
    return [[NSView alloc] initWithFrame:CGRectMake((CGFloat)x, (CGFloat)y, (CGFloat)width, (CGFloat)height)];
}

void cocoa_view_addSubview(NSView *view, NSView *subview) {
    [view addSubview:subview];
}

void cocoa_view_setFrame(NSView *view, double x, double y, double width, double height) {
    [view setFrame:CGRectMake((CGFloat)x, (CGFloat)y, (CGFloat)width, (CGFloat)height)];
}

void cocoa_view_setAutoresizingMask(NSView *view, unsigned int mask) {
    [view setAutoresizingMask: (NSUInteger)mask];
}

void cocoa_view_setBackground(NSView *view, unsigned int red, unsigned int green, unsigned int blue) {
    CGFloat fRed = (CGFloat)(red & 0xFF) / 255.0;
    CGFloat fGreen = (CGFloat)(green & 0xFF) / 255.0;
    CGFloat fBlue = (CGFloat)(blue & 0xFF) / 255.0;
    NSColor *color = [NSColor colorWithRed:fRed green:fGreen blue:fBlue alpha:1.0];
    [view setWantsLayer:YES];
    CALayer *layer = [view layer];
    if (layer) {
        [layer setBackgroundColor: [color CGColor]];
    }
}

unsigned int kCocoaViewNotSizable() { return NSViewNotSizable; }
unsigned int kCocoaViewMinXMargin() { return NSViewMinXMargin; }
unsigned int kCocoaViewWidthSizable() { return NSViewWidthSizable; }
unsigned int kCocoaViewMaxXMargin() { return NSViewMaxXMargin; }
unsigned int kCocoaViewMinYMargin() { return NSViewMinYMargin; }
unsigned int kCocoaViewHeightSizable() { return NSViewHeightSizable; }
unsigned int kCocoaViewMaxYMargin() { return NSViewMaxYMargin; }