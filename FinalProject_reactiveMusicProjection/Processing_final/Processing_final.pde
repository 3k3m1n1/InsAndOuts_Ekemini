import processing.serial.*;
Serial myPort;
int messenger = 0;  //arduino -> processing

float i = 54;

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
      i = 0;
      messenger = 0;
      break;
    case 2:  //chord (big sound)
      //
      break;
  }
  
  //alpha background
  noStroke();
  fill(0, 100);
  rect(0, 0, width, height);
  
  //percussion
  noFill();
  stroke(255);
  strokeWeight(8);
  triangle(400, 250-20*i, 400-20*i, 250+20*i, 400+20*i, 250+20*i);  //midwidth = 400, midheight = 250
  if (i < 54) {  //no point in incrementing forever
    i += 1.4;
  }
  
  //chord
  //fill
  //stroke
  //shape
}
