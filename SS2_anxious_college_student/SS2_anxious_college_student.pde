// name: ekemini nkanta
// title: anxious college student
// instructions: click to panic over deadlines and question all your life choices

float positionX, positionY, freezeX, freezeY;
float speedX, speedY;

int rand;

String[] innerThoughts = {
  "just slept thru my final hahahahaha",
  "do i even belong here?",
  "only one working on the group project again",
  "oh no oh fuck",
  "this isn't getting done by 11:59",
  "who needs sleep anyway lol",
  "what if i never find a job",
  "is it too late to drop this class",
  "how many days til break?",
  "i can't do this",
  "how did i end up here",
  "4 hours should be fine right?",
  "coffee can fix this",
  "aaaaaa",
  "aaaAAAAAAAAAA",
  "deep breaths deeeeep breaths",
  "i'll just go to school to go to college to go to work to...???",
  "i need money to get a degree but i need a degree to get a job and i need a job to get money",
  "??????"};

void setup() {
  size(500, 200);
  background(240);
  fill(0);
  
  textAlign(CENTER);
  textSize(12);
  
  positionX = width/2;
  positionY = height/2;
}

void draw() {
  background(240);
  circle(positionX, positionY, 7);
  
  positionX = positionX + speedX;
  positionY = positionY + speedY;
  
  speedX = (speedX + random(-7, 7)) / 2;
  speedY = (speedY + random(-2, 2)) / 2;
  /* i wish there was a way to make this smoother? probably requires
        taking the average of a rolling array or something */
  
  text(innerThoughts[rand], freezeX, freezeY);
}

void mousePressed() {
  // spawn existential crisis above/below the dot
  rand = int(random(18));
  freezeX = positionX;
  if (positionY > 50) {
    freezeY = positionY - 25; //above
  } else {
    freezeY = positionY + 25; //below
  }
  
}
