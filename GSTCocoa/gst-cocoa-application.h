#ifndef GST_COCOA_APPLICATION_H
#define GST_COCOA_APPLICATION_H 1

#include <AppKit/AppKit.h>
#include "GSTCocoaAppDelegate.h"

void cocoa_application_start();
void cocoa_application_startRunLoop();
void cocoa_application_stopRunLoop();

#endif