class Drop {
  
  float x1, y1, x2, y2;    //drop position
  float s;                 //speed
  float mx;                //stores mouse position (horizontal)
  float len = 4;           //length of drop
  
  Drop(float x, float y, float sp) {
    x1 = x;
    y1 = y;
    s = sp;
  }
  
  void run() {
    convert();
    display();
    groundCheck();
  }
  
  void convert() {
    // converts mouse position to numbers i can work with
    mx = mouseX / 120;
    if (mx <= 0) {
      mx = 0.5; // default, works as a failsafe
    }
    
    y1 = y1 + (s * mx); // scales speed according to mouse position
    x2 = x1;
    y2 = y1 + len;
    
    len += 0.02 * mx; // length didn't look right when approaching the lowest/highest speed, so this tweaks it
  }

  void display() {
    // draws raindrop
    stroke(200);
    line(x1, y1, x2, y2);
  }
  
  void groundCheck() {
    if (y1 >= height - random(10, 70)) { //did the drop hit the ground?
      //tell arduino LED to blink
      val = 1;
      myPort.write(val);  //sends data to arduino (0-255)
      myPort.write(0);  //reset back to 0, or else the light stays on forever
      
      //draw a splash
      noFill();
      noStroke();
      fill(255, 150);
      ellipse(x1, y2 + random(8), random(3, 9), random(2, 5));
      
      //recycle the drop by sending it to the top of the canvas (no need to generate new ones)
      x1 = random(0, width);
      y1 = -120;
      len = 4;
    }
  }

}
