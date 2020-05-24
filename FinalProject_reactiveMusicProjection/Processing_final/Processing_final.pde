/*
name: ekemini nkanta
final project: reactive projection art?
instructions: just play the guitar (:
              chords and knocks/taps trigger fun effects

inspired by everyone mentioning arctic monkeys after my demo :')

(did i mention i'm horrible at math and waves are hard)
*/

import processing.serial.*;
Serial myPort;
int messenger = 0;  //arduino -> processing
float radius = 54;

int f;
int angle = 0;
int amplitude = 0;
float frequency = 4*PI; //values i like, 1.5, 4, 16
int flatlineLength = 150;

float lastX, lastY;

void setup() {
  size(800, 500);  //16:10
  background(0);
  
  String portName = Serial.list()[1];
  myPort = new Serial(this, portName, 9600);
}

void draw() {
  if (myPort.available() > 0) {
    messenger = myPort.read();
  }
  
  switch(messenger) {
    case 1:  //percussion (shock sensor)
      radius = 0;
      messenger = 0;
      break;
    case 2:  //chord (big sound sensor)
      amplitude = 100;
      messenger = 0;
      break;
  }
 
////////////////////

  //alpha background
  noStroke();
  fill(0, 100);
  rect(0, 0, width, height);

////////////////////

  //percussion
  noFill();
  stroke(255);
  strokeWeight(8);
  triangle(400, 250-20*radius, 400-20*radius, 250+20*radius, 400+20*radius, 250+20*radius);  //midwidth = 400, midheight = 250
  if (radius < 54) {  //no point in incrementing forever
    radius += 1.4;
  }
  
////////////////////
  
  //play a chord
  fill(255);
  strokeWeight(4);
  
  //left end of wave
  bezier(0, height/2, flatlineLength, height/2, 0, height/2, flatlineLength, height/2 + sin(angle)*amplitude);
  
  lastX = flatlineLength;
  lastY = height/2 + sin(angle)*amplitude;
  for (f = flatlineLength+1; f <= width-flatlineLength; f+=frequency) {  //frequency!
    //circle(f, height/2 + sin(angle)*amplitude, 2);  //gotta connect the dots somehow
    line(lastX, lastY, f, height/2 + sin(angle)*amplitude);  
    lastX = f;
    lastY = height/2 + sin(angle)*amplitude;
    angle += 2*frequency;
  }
  if (amplitude >= 0) {  amplitude -= PI;  }  
  angle -= 2*frequency; //whoaaa this controls the speed??
                         //higher the multiplier, slower the wave (0 freezes it)
  
  //right end of wave
  bezier(width, height/2, (width-flatlineLength)-frequency, height/2, width, height/2, width-flatlineLength, height/2 + sin(angle)*amplitude); 
}

////////////////////

//debugging without arduino

void mouseClicked() {
  amplitude = 100;
}

void keyTyped() {
  radius = 0;
}
