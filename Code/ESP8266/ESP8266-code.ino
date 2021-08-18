#include <ESP8266WiFi.h>
#include <PubSubClient.h>
#include "wifi-secrets.h"

#define MQTT_SERVER "192.168.0.166"


WiFiClient espClient;
PubSubClient client(espClient);

int message = 0;

int lastMessage = 0;

void reconnect(){
  // Loop until we're reconnected
  while (client.connected() == false) {
    if (client.connect("doorbell")) {
      client.publish("doorBell","0");
      client.publish("doorMessage","0");
    } else {
      //Serial.print("failed, rc=");
      delay(5000);
    }
  }
}

void setup() {
  //Serial.begin(115200);
  //Serial.println("Starting");

  WiFi.begin(SECRET_SSID, SECRET_PASS);
  //Serial.print("Connecting to network ");
  //Serial.println(SECRET_SSID);

  while (WiFi.status() != WL_CONNECTED){
    delay(500);
    //Serial.print(".");
  }
  //Serial.println();

  //Serial.print("Connected, IP address: ");
  //Serial.println(WiFi.localIP());

  client.setServer(MQTT_SERVER, 1883);
//  client.setCallback(callback);

  pinMode(0, INPUT);
  pinMode(1, INPUT);
  pinMode(2, INPUT);
  pinMode(3, INPUT);
}

void loop() {
  client.loop();
  if (!client.connected() ){
    reconnect();
  }

if (digitalRead(3) == HIGH){
  client.publish("doorBell","door");
  delay(10000);
}
  int newMessage=0;
  lastMessage = message;
  if (digitalRead(0)== LOW){
    if (lastMessage != 1){
      message = 1;
      newMessage=1;
    }
  } else if (digitalRead(1)== LOW){
    if (lastMessage != 2){
      message = 2;
      newMessage = 1;
    }
  } else if (digitalRead(2)== LOW){
    if (lastMessage !=3){
      message = 3;
      newMessage = 1;
    }
  } else {
    if (lastMessage != 0){
      message =0;
      newMessage = 1;
    }
  }

  if (lastMessage != message){
    //publish no message
    client.publish("doorMessage","0");
  }
  if (newMessage == 1){
    switch (message){
      case 0:
        //No message
        client.publish("doorMessage","0");
        break;
      case 1:
        //Set message 1
        client.publish("doorMessage","1");
        break;
      case 2:
        //Set message 2
        client.publish("doorMessage","2");
        break;
      case 3:
        /Set message 3
        client.publish("doorMessage","3");
        break;                  
    }
  }

}
