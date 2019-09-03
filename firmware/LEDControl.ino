#include <Adafruit_NeoPixel.h>

#define LED_CTRL_PIN        6 // On Trinket or Gemma, suggest changing this to 1

#define NUMPIXELS 84 

Adafruit_NeoPixel pixels(NUMPIXELS, LED_CTRL_PIN, NEO_GRB + NEO_KHZ800);

#define DELAYVAL 500 // Time (in milliseconds) to pause between pixels

void setupLEDs(){
    pixels.begin();
    pixels.clear();
}

void setOverallGridColour(uint8_t red, uint8_t green, uint8_t blue) {
    pixels.clear();
    for (int i = 0; i < NUMPIXELS; ++i) {
        pixels.setPixelColor(i, pixels.Color(red, green, blue));
        pixels.show();   // Send the updated pixel colors to the hardware.
        delay(DELAYVAL); // Pause before next pass through loop
    }
}