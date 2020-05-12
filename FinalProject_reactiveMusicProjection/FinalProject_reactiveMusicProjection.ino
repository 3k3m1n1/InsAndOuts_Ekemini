const int knockPin = 7;
const int soundPin = 8;

bool knockState = HIGH; //default when no knocks are detected
bool chordPlayed = LOW; //default when no sound is detected

void setup() {
  // put your setup code here, to run once:
  pinMode(knockPin, INPUT);
  pinMode(soundPin, INPUT);
  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
  chordPlayed = digitalRead(soundPin);
  if (chordPlayed) {
    Serial.println("chord!");
    chordPlayed = LOW; //reset
    delay(400); //chords ring out so long that it ends up spamming the serial monitor unless the delay is high
                //ik i'll have to switch to a timer in order to not halt the knock detection 
  }
  
  knockState = digitalRead(knockPin);
  if (knockState == LOW) {
    Serial.println("knock");
    knockState = HIGH;
    delay(100);
  }

  
}
