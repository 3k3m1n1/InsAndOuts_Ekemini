// name: ekemini nkanta
// title: polaroid
// instructions: click for a new image.

/* memories.
what is it like to slowly forget the people around you?

canvas matches the size of a polaroid.
handwritten text at the bottom asks "do you remember?".
load one image from an array of many.
as you try to reflect on the image,
you notice it is slowly being scratched away. */

PImage[] moments = new PImage[6];
PFont handwriting;
int current = 0;

void setup() {
  size(400, 500);
  background(255);
  fill(0);
  stroke(255);
  
  LoadAllPictures();
  WriteInNewFont();
}

// gradually "erase" the image
void draw() {
  line(30, random(0, 400), 370, random(0, 400));
}

// switch to a new image on mouse click
void mousePressed() {
  if (current == 5) {
    current = 0;
  } else {
    current++;
  }
  image(moments[current], 200, 200, 340, 340);
}

void LoadAllPictures() {
  for (int i = 0; i < 6; i++) {
    moments[i] = loadImage(i + ".jpg");
  }
  imageMode(CENTER);
  image(moments[current], 200, 200, 340, 340);
}

void WriteInNewFont() {
  handwriting = createFont("AllisonScript-Regular", 50);
  textFont(handwriting);
  textAlign(CENTER);
  text("do you remember?", 200, 440);
}

// edited to add 2 original functions! array + conditional were already there
