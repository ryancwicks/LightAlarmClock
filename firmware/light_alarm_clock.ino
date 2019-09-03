/**
 * light_alarm_clock.ino
 * 
 * Ryan Wicks (ryancwicks@gmail.com)
 * 
 * Firmware for the light alarm clock.
 * 
 * The code has been split into different ino files that are appended at the end of the main .ino.
 * 
 */

//-------------------------------------------
// FileSystem
//-------------------------------------------
// You only need to format FFat the first time you run a test
void listDir(fs::FS &fs, const char * dirname, uint8_t levels);
bool isFile (fs::FS &fs, const char * path);
void readFile(fs::FS &fs, const char * path);
void writeFile(fs::FS &fs, const char * path, const char * message);
void appendFile(fs::FS &fs, const char * path, const char * message);
void renameFile(fs::FS &fs, const char * path1, const char * path2);
void deleteFile(fs::FS &fs, const char * path);

//-------------------------------------------
// Wifi and Web Server
//-------------------------------------------
#include <WiFi.h>
#include <WiFiClient.h>
#include <WebServer.h>
#include <WiFiAP.h>
#include <ESPmDNS.h>
//default credentials for the setup access point
const char *ssid = "light_alarm_clock_setup";
const char *password = "wake_me_up";
extern WebServer server;

void handleRoot();
void handleSetupRoot();
void handleNotFound();
void handleSubmitCredentials();

//------------------------------------------
// File Locations
//------------------------------------------
const char wifi_credentials[] = "/wifi_credentials.txt"; 
const char index_file[] = "/index.html";
const char setup_file[] = "/setup.html";
const char css_file[] = "/static/style.css"; 
const char clock_viewer_js_file[] = "/static/clock_viewer.js";
const char light_clock_js_file[] = "/static/light_clock_api.js";
const char light_clock_page_controls_js_file[] = "/static/light_clock_page_controls.js";
const char time_object_js_file[] = "/static/time_object.js";

//-------------------------------------------
// Display
//-------------------------------------------
void setupDisplay();
void helloWorld();
void helloIPAddress(const char * ip);

//-------------------------------------------
// LEDs
//-------------------------------------------
void setupLEDs();
void setOverallGridColour(uint8_t red, uint8_t green, uint8_t blue);

//-------------------------------------------
// Pinouts
//-------------------------------------------
const int LED = 2;

//-------------------------------------------
// Global Variables
//-------------------------------------------
bool wifi_credentials_loaded = false;

void setup()
{
    //Serial Setup
    Serial.begin(115200);
    Serial.setDebugOutput(true);
    
    //Set up the file system
    Serial.println("Attempting to load file system.");
    if(!FFat.begin()){
        //if the file system fails to build, try formatting it (this will wipe settings)
        Serial.println("First load attempt failed. Formatting the file system.");
        FFat.format();
        
        if (!FFat.begin()) {
           Serial.println("FFat Mount Failed");
           return;
        }
    }
    Serial.println("File System Loaded");
    Serial.printf("Total space: %10lu\r\n", FFat.totalBytes());
    Serial.printf("Free space: %10lu\r\n", FFat.freeBytes());

    //setup the Display
    setupDisplay();
    helloWorld();

    //determine status of wifi_credentials
    wifi_credentials_loaded = isFile(FFat, wifi_credentials);

    //Setup 
    IPAddress myIP;
    if (wifi_credentials_loaded) {
        Serial.println("Wifi credentials file found, loading credentials.");

        char ssid[256];
        char password[256];

        //load credentials

        WiFi.mode(WIFI_STA);
        WiFi.begin(ssid, password);

        // Wait for connection
        while (WiFi.status() != WL_CONNECTED) {
            delay(500);
            Serial.print(".");
        }
        Serial.println("");
        Serial.print("Connected to ");
        Serial.println(ssid);
        Serial.print("IP address: ");
        Serial.println(WiFi.localIP());
        helloIPAddress(WiFi.localIP().toString().c_str());

        if (MDNS.begin("light_alarm_clock")) {
            Serial.println("MDNS responder started");
        }

        server.on("/", handleRoot);
        //Add api paths here
    }
    if (!wifi_credentials_loaded) {   
        Serial.println("No wifi credentials found, starting setup access point.");

        WiFi.softAP(ssid, password);
        Serial.print("AP IP address: ");
        Serial.println(WiFi.softAPIP());
        helloIPAddress(WiFi.softAPIP().toString().c_str());

        server.on("/", handleSetupRoot);
        server.on("/submit_network_info", handleSubmitCredentials);
    } 

    server.onNotFound(handleNotFound);


    server.begin();

    Serial.println("Server started");

    //Set up the outputs.
    pinMode(LED, OUTPUT);
    digitalWrite(LED, LOW);
}

void loop()
{
    server.handleClient();
    delay(500);
    digitalWrite(LED, HIGH);
	delay(500);
    digitalWrite(LED, LOW);
}