// name: ekemini nkanta
// title: mountains (well, more like trees)
// instructions: mouse over the sun to draw another range

/*
theme is elements again! (last time was a river, this one's more earth + landscapes)
but i guess it could be emotions too, bc the colors feel calm if not lonely
*/


int i, count, circleX, a = 20;
int mountainHeight = 200;

void setup() {
  size(900, 600);
}

void draw() {
  background(200);
  
  stroke(240, 242, 215);
  circleX = int(random(200, 400)); // made this a variable so i could check it in mouseover func
  circle(circleX, mountainHeight, 80);
  
  for(i = 0; i <= width; i++) {    // draws mountains across entire screen width
  
    for(count = mountainHeight; count <= height; count++) {  // creates a gradient, point by point...
      
      stroke(3, 94, 123, a);
      point(i, count);                                       // ...from top to bottom
      
      if (a > 0) {
        a--;   // fade opacity
      }
      
    }
    
    a = 255;   // reset a
    mountainHeight = mountainHeight + int(random(-10, 10)); // ugh mountainHeight must be an int
    // i really wanted to get this working with perlin noise but it just doesn't make sense to me atm haha
    // could be bc i had to flatten all the output to an int?
  }
  
  noLoop();
}

// MOUSEOVER - uhhh hover over sun to draw another mountain?
void mouseMoved() {
  if (mouseX < (circleX + 40) && mouseX > (circleX - 40)) {
    if (mouseY < (mountainHeight+40) && mouseY > (mountainHeight-40)) {
      loop();
    }
  }
}
