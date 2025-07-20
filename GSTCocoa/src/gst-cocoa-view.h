#ifndef GST_COCOA_VIEW_H
#define GST_COCOA_VIEW_H 1

#include <AppKit/AppKit.h>

typedef enum CocoaViewAutoresizingMask {
    kCocoaViewNotSizable = NSViewNotSizable,
    kCocoaViewMinXMargin = NSViewMinXMargin,
    kCocoaViewWidthSizable = NSViewWidthSizable,
    kCocoaViewMaxXMargin = NSViewMaxXMargin,
    kCocoaViewMinYMargin = NSViewMinYMargin,
    kCocoaViewHeightSizable = NSViewHeightSizable,
    kCocoaViewMaxYMargin = NSViewMaxYMargin
} CocoaViewAutoresizingMask;

NSView *cocoa_view_make(double x, double y, double width, double height);
void cocoa_view_addSubview(NSView *view, NSView *subview);
void cocoa_view_setFrame(NSView *view, double x, double y, double width, double height);
void cocoa_view_setAutoresizingMask(NSView *view, unsigned int mask);
void cocoa_view_setBackground(NSView *view, unsigned int red, unsigned int green, unsigned int blue);

#endif