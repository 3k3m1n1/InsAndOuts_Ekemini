// name: ekemini nkanta
// title: mirror, mirror
// instructions: switch webcam filters using the left & right arrow keys.

import processing.video.*;
Capture webcam;

color[] palette = {color(88, 24, 69), color(159, 12, 63), color(199, 94, 57), color(255, 195, 15)};
int xPos, yPos;
int pixel; // 16 is full-on blocks, 4 feels "lo-fi," 2 is like an optimized mirror
color c;
float intensity;
PImage rec;
float rHeight;
int state = 1;

void setup() {
  size(640, 480);
  noStroke();
  rec = loadImage("rec.png");
  
  webcam = new Capture(this, 640, 480);  // creates a reference to your webcam
  webcam.start();  // turns on webcam
}

void draw() {
  // saves current webcam frame as an image, so we can mess with it
  if (webcam.available()) {
    webcam.read();
  }

  // draws webcam image to canvas
  image(webcam, 0, 0);

  // state changes: color palette (1), pixelate (2), glitch (3)
  if (state == 1) {
    ColorPalette();
  } else if (state == 2) {
    Pixelate();
  } else {
    Glitch();
  }
}

// use the arrow keys to switch filters
void keyPressed() {
  if (keyCode == LEFT) {
    state--;
  } else if (keyCode == RIGHT) {
    state++;
  }
  
  // reset # when it goes out of bounds
  if (state < 1) { state = 3; }
  if (state > 3) { state = 1; }
}

void ColorPalette() {
  noTint();
  for (xPos = 0; xPos < width; xPos += pixel) {       //repeats the columns across canvas width
    for (yPos = 0; yPos < height; yPos += pixel) {    //column of pixels
      c = get(xPos, yPos);                            //grabs the color from each pixel (sorta like an eyedropper tool)
      intensity = red(c) + green(c) + blue(c);        //**adds together r, g, and b to calculate color's intensity
      
      // picks a color from the palette based on intensity
      if (intensity < 182) {
        fill(palette[0]);
      } else if (intensity < 364) {
        fill(palette[1]);
      } else if (intensity < 546) {
        fill(palette[2]);
      } else {
        fill(palette[3]);
      }
      
      // draws pixel
      pixel = 4;
      square(xPos, yPos, pixel);
    }
  }
}

void Pixelate() {
  noTint();
  for (xPos = 0; xPos < width; xPos += pixel) {       //repeats the columns across canvas width
    for (yPos = 0; yPos < height; yPos += pixel) {    //column of pixels
      c = get(xPos, yPos);                            //grabs the color from each pixel
      fill(c);                                        //**makes it the fill color
      
      pixel = 16;
      square(xPos, yPos, pixel); 
    }
  }
}

void Glitch() {
  image(rec, 30, 40);                                 //nice finishing touch :)
  //filter(GRAY);                                     //the plan was to add pops of color, but i can't tint B&W
  
  //shifts random parts of the image
  for (yPos = 0; yPos < height; yPos += int(random(110, 200))) { 
    rHeight = random(5, 120);
    blend(0, yPos, width, int(rHeight), int(random(-20, 30)), yPos, width, int(rHeight), DODGE);
    
    //DODGE (lighter) looks good! gives me "into the spiderverse" (chromatic abberation) vibes
    //SOFT_LIGHT is more gentle
    //SCREEN is like DODGE, but with less color distortion going on.
    //REPLACE makes my eyes blur (in a good way?) try it out ;)
  }
  
  //lo-fi lines? wish i could make them fuzzier
  for (yPos = 0; yPos < height; yPos += 6) {
    fill(0, 40);
    rect(0, yPos, width, 2);
  }
  
}
