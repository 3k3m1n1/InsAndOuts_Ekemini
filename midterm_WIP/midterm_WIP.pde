import processing.video.*;
Capture webcam;

color[] palette = {color(88, 24, 69), color(159, 12, 63), color(199, 94, 57), color(255, 195, 15)};
int xPos, yPos;
int pixel; // 16 is full-on pixelated, 4 feels "lo-fi," 2 is like an optimized mirror
color c;
float intensity;

void setup() {
  size(640, 480);
  noStroke();
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

  // no state changes yet, just trying each filter individually. comment out one of the 2 below to test
  
  //Pixelate();
  ColorPalette();
}

void Pixelate() {
  for (xPos = 0; xPos < width; xPos += pixel) { // repeats the columns across canvas width
    for (yPos = 0; yPos < height; yPos += pixel) {  // column of pixels
      c = get(xPos, yPos); // grabs the color from each pixel (sorta like an eyedropper tool)
      fill(c);  // makes it the fill color
      
      pixel = 16; // ***when i add state changes, this line will only be called once: on key press
      
      square(xPos, yPos, pixel);  // draws each pixel
    }
  }
}

void ColorPalette() {
  for (xPos = 0; xPos < width; xPos += pixel) { // repeats the columns across canvas width
    for (yPos = 0; yPos < height; yPos += pixel) {  // column of pixels
      c = get(xPos, yPos);  // grabs the color from each pixel
      intensity = red(c) + green(c) + blue(c); // adds together r, g, and b to calculate color's intensity
      
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
      
      // draw pixel
      pixel = 4; // ***will be moved
      square(xPos, yPos, pixel);
    }
  }
}
