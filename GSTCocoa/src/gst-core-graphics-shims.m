#include "gst-core-graphics-shims.h"

CGContextRef cg_context_create(int width, int height) {
    int components = 4;
    int bitsPerComponent = 8;
    int bytesPerRow = width * components;
    CGColorSpaceRef space = CGColorSpaceCreateDeviceRGB();
    CGBitmapInfo bitmapInfo = kCGBitmapAlphaInfoMask & kCGImageAlphaPremultipliedLast;

    CGContextRef context = CGBitmapContextCreate(NULL, width, height, bitsPerComponent, bytesPerRow, space, bitmapInfo);
    CFRelease(space);
    return context;
}

void cg_context_fill(CGContextRef cgContext, unsigned int red, unsigned int green, unsigned int blue) {
    void *data = CGBitmapContextGetData(cgContext);
    uint8_t *bitmap = (uint8_t *)data;
    int width = CGBitmapContextGetWidth(cgContext);
    int height = CGBitmapContextGetHeight(cgContext);
    int components = 4;
    
    int y, x;
    for (y = 0; y < height; y++) {
        for (x = 0; x < width; x++) {
            int offset = components * (y * width + x);
            bitmap[offset + 0] = (uint8_t)red;
            bitmap[offset + 1] = (uint8_t)green;
            bitmap[offset + 2] = (uint8_t)blue;
            bitmap[offset + 3] = 255;
        }
    }
}

void cg_context_copy(CGContextRef cgContext, char *source, int size) {
    void *data = CGBitmapContextGetData(cgContext);
    uint8_t *bitmap = (uint8_t *)data;
    int width = CGBitmapContextGetWidth(cgContext);
    int height = CGBitmapContextGetHeight(cgContext);
    int components = 4;
    int imageSize = components * width * height;
    int bytesToCopy = (size < imageSize) ? size : imageSize;
    
    int i;
    for (i = 0; i < bytesToCopy; i++) {
        bitmap[i] = source[i];
    }
}

CGImageRef cg_image_create_from_context(CGContextRef cgContext) {
    CGImageRef image = CGBitmapContextCreateImage(cgContext);
    return image;
}