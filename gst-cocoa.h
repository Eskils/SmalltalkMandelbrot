#ifndef GST_COCOA_H
#define GST_COCOA_H 1

void cocoa_start();
void cocoa_output(char* text);
void cocoa_makeWindow(int width, int height, char* title);
void cocoa_startRunLoop();
void cocoa_stopRunLoop();

#endif