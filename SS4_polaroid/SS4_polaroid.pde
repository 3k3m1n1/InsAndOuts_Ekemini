// name: ekemini nkanta
// title: polaroid
// theme: memories. what is it like to slowly forget the people around you?
// instructions: click for a new image.

PImage[] moments = new PImage[6];
int j = 0;
float circleX = random(60, 340), circleY = random(60, 340);

void setup() {
  size(400, 500);
  background(255);
  imageMode(CENTER);
  
  for (int i = 0; i < 6; i++) {
    moments[i] = loadImage(i + ".jpg");
  }
  
  image(moments[j], 200, 200, 340, 340);
  
  fill(0);
  textSize(30);
  text("do you remember?", 60, 450);
}

void draw() {
  //white scribble
  fill(255);
  noStroke();
  //circle(circleX, circleY, 20);
  //circleX += random(-14, 14);
  //circleY += random(-14, 14);
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
