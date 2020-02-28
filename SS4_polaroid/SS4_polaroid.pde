// name: ekemini nkanta
// title: polaroid
// theme: memories. what is it like to slowly forget the people around you?
// instructions: click for a new image.

PImage[] moments = new PImage[6];
PFont handwriting;
int j = 0;

void setup() {
  size(400, 500);
  background(255);
  imageMode(CENTER);
  fill(0);      // text
  stroke(255);  // lines
    
  for (int i = 0; i < 6; i++) { moments[i] = loadImage(i + ".jpg"); }
  image(moments[j], 200, 200, 340, 340);
  
  fill(0);
  handwriting = createFont("Lato", 30);
  textFont(handwriting);
  text("do you remember?", 60, 450);
}

void draw() {
  // white lines
  stroke(255);
  line(30, random(0, 400), 370, random(0, 400));
}

void mousePressed() {
  if (j == 5) {
    j = 0;
  } else {
    j++;
  }
  
  image(moments[j], 200, 200, 340, 340);
}

/* canvas matches the size of a polaroid.
handwritten text at the bottom asks "do you remember?".
load one image from an array of many.
as you try to reflect on the image you notice it is
slowly being scratched away. */
