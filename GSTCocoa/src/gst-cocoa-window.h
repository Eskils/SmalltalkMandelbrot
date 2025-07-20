#ifndef GST_COCOA_WINDOW_H
#define GST_COCOA_WINDOW_H 1

#include <AppKit/AppKit.h>

NSWindow *cocoa_window_make(int width, int height);
void cocoa_window_setTitle(NSWindow *window, char *title);

#endif