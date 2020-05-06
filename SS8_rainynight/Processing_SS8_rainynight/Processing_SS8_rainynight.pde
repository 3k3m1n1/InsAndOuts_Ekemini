/*
name: ekemini nkanta
title: rainy night
instructions: move the mouse left & right
*/

import processing.serial.*;
Serial myPort;
int val = 0;

Drop[] d = new Drop[20];

//var rain;
//function preload() {
//  rain = loadSound('heavyRain.wav');
//}

void setup() {
  size(400, 400);
  //background(0);

  for (int i = 0; i < 20; i++) {
    // generate i raindrops at the start, these will be reused throughout
    d[i] = new Drop(random(0, width), random(0, height), random(1, 2.4)); //x, y, s
  }
  
  String portName = Serial.list()[1];
  myPort = new Serial(this, portName, 9600);
  
  //noLoop();
}

void draw() {
  if ( myPort.available() > 0) { // If data is available,
    val = myPort.read(); // read it and store it in val
  }
  
  // fade effect: shade background with alpha bkgd
  noStroke();
  fill(0, 30);
  rect(0, 0, width, height);
  
  //rain.setVolume(map(mouseX, 0, 1000, 0.1, 1));
  
  // updates each particle on screen
  for (int i = 0; i < d.length; i++) {
    d[i].run();
  }
}

//void mouseClicked() {
//  // user interaction is required before autoplay, otherwise i wouldn't do this
//  //rain.setVolume(0.4);
//  //rain.loop();

//  loop(); // let's start draw()
//}
