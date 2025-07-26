#ifndef GST_CORE_GRAPHICS_SHIMS_H
#define GST_CORE_GRAPHICS_SHIMS_H 1

#include <CoreGraphics/CoreGraphics.h>

CGContextRef cg_context_create(int width, int height);
void cg_context_fill(CGContextRef cgContext, unsigned int red, unsigned int green, unsigned int blue);
void cg_context_copy(CGContextRef cgContext, char *source, int size);
CGImageRef cg_image_create_from_context(CGContextRef cgContext);

#endif