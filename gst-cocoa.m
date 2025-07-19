#include "gst-cocoa.h"
#include <AppKit/AppKit.h>
#include <Foundation/Foundation.h>
#include <stdio.h>

@interface GSTCocoaAppDelegate : NSObject <NSApplicationDelegate>
@end

@implementation GSTCocoaAppDelegate

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender {
    return YES;
}

@end

static GSTCocoaAppDelegate *appDelegate;
static NSAutoreleasePool *autoreleasePool;

void cocoa_start() {
    // Create a memory pool that will be drained upon release.
    autoreleasePool = [[NSAutoreleasePool alloc] init];
    
    // Create the shared application instance backing NSApp.
    [NSApplication sharedApplication];

    appDelegate = [[GSTCocoaAppDelegate alloc] init];
    [NSApp finishLaunching];
    [NSApp setDelegate:appDelegate];
}

void cocoa_startRunLoop() {
    [NSApp run];
    [autoreleasePool drain];
}

void cocoa_stopRunLoop() {
    [NSApp stop:NSApp];
}

void cocoa_makeWindow(int width, int height, char *title) {
    NSUInteger windowStyle = NSWindowStyleMaskTitled | NSWindowStyleMaskClosable | NSWindowStyleMaskResizable;
    NSRect windowRect = NSMakeRect(0, 0, width, height);
    NSWindow * window = [[NSWindow alloc] initWithContentRect:windowRect
                                          styleMask:windowStyle
                                          backing:NSBackingStoreBuffered
                                          defer:NO];
    [window setTitle:[NSString stringWithCString:title encoding:NSUTF8StringEncoding]];
    [window autorelease];

    NSWindowController * windowController = [[NSWindowController alloc] initWithWindow:window];
    [windowController autorelease];

    [window makeKeyWindow];
    [window orderFrontRegardless];
}

void cocoa_output(char *text) {
    printf("Output: %s\n", text);
}