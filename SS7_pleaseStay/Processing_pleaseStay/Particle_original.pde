class Particle {

  PVector loc, dir, vel;
  float speed;
  int d=1; // direction change
  color col;

  Particle(PVector _loc, PVector _dir, float _speed) {
    loc = _loc;
    dir = _dir;
    speed = _speed;
  }

  void run() {
    move();
    checkEdges();
    update();
  }

  void move() {
    noiseScale = map(distance, 2, 20, 1200, 500);
    noiseStrength = map(distance, 2, 20, 4, 8);
    
    float angle=noise(loc.x/noiseScale, loc.y/noiseScale, frameCount/noiseScale)*TWO_PI*noiseStrength;
      //0 goes to the right, 3.14 goes to the left... OHHH. THE SCALE IS PI
      //0, PI/2, PI, 3PI/4, 2PI -> 0, 90, 180, 270, 360
    
    dir.x = cos(angle);
    dir.y = sin(angle);
      //returns a # between 0 and 1 (duh). points the particle in the direction of the angle (not so duh).
    
    speed = map(distance, 2, 20, 0.6, 2); //****
    
    vel = dir.get();
    vel.mult(speed*d);
    loc.add(vel);
      //???? haven't figured this bit out yet
  }

  void checkEdges() {
    if (loc.x<0 || loc.x>width || loc.y<0 || loc.y>height) {    //out of bounds
      loc.x = random(width*1.2);
      loc.y = random(height);
    }
  }

  void update() {
    fill(255);
    ellipse(loc.x, loc.y, loc.z, loc.z);
  }
}

/*for my spin-off (when i add the ultrasonic sensor)
  
  peace: CLOSE
  slow down (speed = 0.6)
  trails become longer (background 0, 4)
  noise -> scale 1200, strength 4
  
  chaos state: FAR
  particles move faster (speed = 2?)
  shorter trails (background 0, 10)
  noise -> scale 500, strength 8
*/
