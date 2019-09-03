#define ENABLE_GxEPD2_GFX 0

#include <GxEPD2_BW.h>
//#include "bitmaps/Bitmaps400x300.h"
#include <Fonts/FreeMonoBold9pt7b.h>

GxEPD2_BW<GxEPD2_420, GxEPD2_420::HEIGHT> display(GxEPD2_420(/*CS=5*/ 5, /*DC=*/ 17, /*RST=*/ 16, /*BUSY=*/ 4));

void setupDisplay() {
    display.init(115200);
    display.setRotation(0);
    display.setFont(&FreeMonoBold9pt7b);
    display.setTextColor(GxEPD_BLACK);
}

void helloWorld()
{
    centeredText("Hello World!");
}

void helloIPAddress(const char * ip) {
    centeredText(ip);
}

void centeredText(const char * text) {
    int16_t tbx, tby; uint16_t tbw, tbh;
    display.getTextBounds(text, 0, 0, &tbx, &tby, &tbw, &tbh);
    // center bounding box by transposition of origin:
    uint16_t x = ((display.width() - tbw) / 2) - tbx;
    uint16_t y = ((display.height() - tbh) / 2) - tby;
    display.setFullWindow();
    display.firstPage();
    do
    {
        display.fillScreen(GxEPD_WHITE);
        display.setCursor(x, y);
        display.print(text);
    }
    while (display.nextPage()); 
}