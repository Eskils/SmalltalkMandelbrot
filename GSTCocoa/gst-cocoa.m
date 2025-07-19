#include "gst-cocoa.h"

@interface GSTCocoaAppDelegate : NSObject <NSApplicationDelegate>
@end

@implementation GSTCocoaAppDelegate

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender {
    return YES;
}

@end

static GSTCocoaAppDelegate *appDelegate;
static NSAutoreleasePool *autoreleasePool;

void cocoa_application_start() {
    // Create a memory pool that will be drained upon release.
    autoreleasePool = [[NSAutoreleasePool alloc] init];
    
    // Create the shared application instance backing NSApp.
    [NSApplication sharedApplication];

    appDelegate = [[GSTCocoaAppDelegate alloc] init];
    [NSApp finishLaunching];
    [NSApp setDelegate:appDelegate];
}

void cocoa_application_startRunLoop() {
    [NSApp run];
    [autoreleasePool drain];
}

void cocoa_application_stopRunLoop() {
    [NSApp stop:NSApp];
}

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

    [window makeKeyWindow];
    [window orderFrontRegardless];
    
    return window;
}

void cocoa_window_setTitle(NSWindow *window, char *title) {
[window setTitle:[NSString stringWithCString:title encoding:NSUTF8StringEncoding]];
}

void cocoa_output(char *text) {
    printf("Output: %s\n", text);
}