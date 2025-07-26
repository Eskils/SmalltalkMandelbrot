#ifndef GST_COCOA_IMAGE_VIEW_H
#define GST_COCOA_IMAGE_VIEW_H 1

#include <AppKit/AppKit.h>

NSImageView *cocoa_image_view_make(double x, double y, double width, double height);
void cocoa_image_view_setImage(NSImageView *imageView, CGImageRef image);
void cocoa_image_view_setImageScalinge(NSImageView *imageView, NSImageScaling imageScaling);

unsigned int kCocoaImageScaleProportionallyDown();
unsigned int kCocoaImageScaleAxesIndependently();
unsigned int kCocoaImageScaleNone();
unsigned int kCocoaImageScaleProportionallyUpOrDown();

#endif