/*
name: ekemini nkanta
title: please stay
description: when you're with me, i'm at peace.
             (move closer to / away from the ultrasonic sensor to control the particles.)

the plan was to rewrite the particle class i was referencing from scratch (my mind's
wrapped around like 90% of it!) and have the particles converge into a circle when "at
peace" and move independently otherwise.
*
but bc of time constraints, i'm bringing in the original code (with all of my
how-does-this-work comments) just so i can show that my sensor works.
*/

import processing.serial.*;
Serial myPort;
int distance = 0;

/*
int n = 100;
Particle[] particles = new Particle[n];

void setup() {
  size(400, 400);
  background(0);
  noStroke();
  
  String portName = Serial.list()[1]; //change the number in the [] for the port you need
  myPort = new Serial(this, portName, 9600);
}

void draw() {
  //playing with a shortcut i found in the ref. :)
  distance = (myPort.available() > 0) ? myPort.read() : 2;
  
  //background() won't accept alpha values, so here's a workaround:
  fill(0, 25);
  rect(0, 0, width, height);
  
  // this is where the magic happens
  for (int i=0; i<particles.length; i++) {
    particles[i].checkSensor();
    particles[i].move();
    particles[i].update();
  }
}
*/

int num = 500;  //how many particles. default was 1000
Particle[] particles = new Particle[num];
float noiseScale=500, noiseStrength=8;
  //noiseScale: default is 500. decrease -> more jitter, increase -> almost a straight line (like a shooting star)
  //noiseStrength: default is 1. increasing this seems to make the angle change more often
  //5000 & 10 makes a weird magnetic field- looking pattern, where nearly every particle converges on 1 line

void setup() {
  size(800, 600);
  background(0);
  noStroke();
  
  for (int i=0; i<num; i++) {
    PVector loc = new PVector(random(width*1.2), random(height), 1.2);  //loc.x, y, z. default was 2
      //if i wanted to spawn the particles in a particular lineup, i would change that here
      
      //say i want to generate the particles in a circle...
      //circle equation is x^2 + y^2 = r^2 (center is 0,0)
      //or (x-a)^2 + (y-b)^2 = r^2 (center is a,b)
    
    float angle = random(TWO_PI);
    PVector dir = new PVector(cos(angle), sin(angle));
    
    //float speed = random(.5, 2);
    float speed = 0.6; //debug
    
    //calling the constructor!
    particles[i]= new Particle(loc, dir, speed);
  }
  
  String portName = Serial.list()[1]; //change the number in the [] for the port you need
  myPort = new Serial(this, portName, 9600);
}

void draw() {
  //playing with a shortcut i found in the ref. :)
  distance = (myPort.available() > 0) ? myPort.read() : 2;
  
  //background(0);
  
  //fill(0, 10);
  fill(0, map(distance, 2, 20, 4, 10)); //****
  noStroke();
  rect(0, 0, width, height);
    //nice workaround! processing has been super annoying about alpha bkgds
  
  fill(255);  
  for (int i=0; i<particles.length; i++) {
    particles[i].run();
  }
}
