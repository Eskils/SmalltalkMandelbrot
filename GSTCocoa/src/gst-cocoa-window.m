#include "gst-cocoa-window.h"
#include <AppKit/AppKit.h>

NSWindow *cocoa_window_make(int width, int height) {
    NSUInteger windowStyle = NSWindowStyleMaskTitled | NSWindowStyleMaskClosable | NSWindowStyleMaskResizable;
    NSRect windowRect = NSMakeRect(0, 0, width, height);
    NSWindow * window = [[NSWindow alloc] initWithContentRect:windowRect
                                          styleMask:windowStyle
                                          backing:NSBackingStoreBuffered
                                          defer:NO];
    [window autorelease];

    NSWindowController * windowController = [[NSWindowController alloc] initWithWindow:window];
    [windowController autorelease];

    [window center];
    [window makeKeyWindow];
    [window setLevel:NSStatusWindowLevel];
    [window makeKeyAndOrderFront:NSApp];
    
    return window;
}

void cocoa_window_setTitle(NSWindow *window, char *title) {
    [window setTitle:[NSString stringWithCString:title encoding:NSUTF8StringEncoding]];
}

NSView *cocoa_window_contentView(NSWindow *window) {
    return [window contentView];
}