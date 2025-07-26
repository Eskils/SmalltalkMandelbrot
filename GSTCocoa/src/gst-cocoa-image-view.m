#include "gst-cocoa-image-view.h"
#include <AppKit/AppKit.h>

NSImageView *cocoa_image_view_make(double x, double y, double width, double height) {
    return [[NSImageView alloc] initWithFrame:CGRectMake((CGFloat)x, (CGFloat)y, (CGFloat)width, (CGFloat)height)];
}

void cocoa_image_view_setImage(NSImageView *imageView, CGImageRef image) {
    NSSize size = CGSizeMake(CGImageGetWidth(image), CGImageGetHeight(image));
    NSImage *nsImage = [[NSImage alloc] initWithCGImage:image size:size];
    [imageView setImage:nsImage];
}