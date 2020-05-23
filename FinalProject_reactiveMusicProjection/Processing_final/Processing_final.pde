/*
name: ekemini nkanta
instructions: just play the guitar :) chords and bumps/taps trigger various effects

did i mention i'm horrible at math and waves are hard
*/

import processing.serial.*;
Serial myPort;
int messenger = 0;  //arduino -> processing
float radius = 54;

int angle = 0;
int amplitude = 0;
float frequency = 4*PI; //values i like, 1.5, 4, 16
int flatlineLength = 150;
//boolean goingUp = true;

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
    case 1:  //percussion (shock)
      radius = 0;
      messenger = 0;
      break;
    case 2:  //chord (big sound)
      //trigger?
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
  
  for (int f = flatlineLength; f < width-flatlineLength; f+=frequency) {  //frequency!
    circle(f, height/2 + sin(angle)*amplitude, 2);  //point() was too small
    angle += 2*frequency;
  }
  if (amplitude >= 0) {
    amplitude -= PI;  //sorry i'm just veryyy intrigued by the magic PI creates accidentally
  }  
  //if (goingUp) {
  //  amplitude += 6;
  //} else {
  //  amplitude -= 4;
  //}
  //if (amplitude > 140) {
  //  goingUp = false;
  //}
  //if (amplitude < -140) {
  //  goingUp = true;
  //}
  //angle = 0;
  angle -= 2*frequency; //whoaaa this controls the speed??
                        //higher the multiplier, slower the wave (0 freezes it)
  
  //right end of wave
  //line(width, height/2, width-flatlineLength, height/2); 
  bezier(width, height/2, width-flatlineLength, height/2, width, height/2, width-flatlineLength, height/2 + sin(angle)*amplitude); 
  //bezier(_, _, _, _, x1, x2, y1, y2);
}

void mouseClicked() {
  amplitude = 140;
}

void keyPressed() {
  radius = 0;
}
