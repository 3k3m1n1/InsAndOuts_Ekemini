const int knockPin = 7;
const int soundPin = 8;

bool noKnockDetected = HIGH; //default when no knocks are detected
bool chordPlayed = LOW; //default when no sound is detected

void setup() {
  pinMode(knockPin, INPUT);
  pinMode(soundPin, INPUT);
  Serial.begin(9600);
}

void loop() {
  noKnockDetected = digitalRead(knockPin);
  if (noKnockDetected == LOW) {
//    Serial.println("knock");
//    Serial.write(1);
    noKnockDetected = HIGH;
//    delay(100);
  }

  //***um my knock sensor isn't working anymore????
  //just using the sound sensor for now
  
  chordPlayed = digitalRead(soundPin);
  if (chordPlayed) {
//    Serial.println("chord!");
    Serial.write(1);
    chordPlayed = LOW; //reset
    delay(400); //chords ring out so long that it ends up spamming the serial monitor unless the delay is high
                //ik i'll have to switch to a timer in order to not halt the knock detection 
  }
}
