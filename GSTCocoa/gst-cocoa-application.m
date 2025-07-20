#include "gst-cocoa-application.h"

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