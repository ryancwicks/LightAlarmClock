// Set these to your desired credentials.
#include <WiFi.h>
#include <WebServer.h>

WebServer server(80);

void handleRoot() {
    server.send(200, "text/plain", "hello from esp32!");
}

void handleSetupRoot() {
    server.send(200, "text/plain", "hello from esp32 in setup mode!");
}

void handleSubmitCredentials() {
    server.send(200, "text/json", "{ success: True }");
}

void handleNotFound() {
  String message = "File Not Found\n\n";
  message += "URI: ";
  message += server.uri();
  message += "\nMethod: ";
  message += (server.method() == HTTP_GET) ? "GET" : "POST";
  message += "\nArguments: ";
  message += server.args();
  message += "\n";
  for (uint8_t i = 0; i < server.args(); i++) {
    message += " " + server.argName(i) + ": " + server.arg(i) + "\n";
  }
  server.send(404, "text/plain", message);
  
}