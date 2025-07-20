#ifndef GST_COCOA_H
#define GST_COCOA_H 1

#include <stdio.h>
#include <AppKit/AppKit.h>
#include "GSTCocoaAppDelegate.h"

void cocoa_application_start();
void cocoa_application_startRunLoop();
void cocoa_application_stopRunLoop();
NSWindow *cocoa_window_make(int width, int height);
void cocoa_window_setTitle(NSWindow *window, char *title);
void cocoa_output(char *text);

#endif