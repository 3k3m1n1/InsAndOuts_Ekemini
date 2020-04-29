int trigPin = 11;
int echoPin = 12;
long duration, cm;

void setup() {
  pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);

  Serial.begin(9600); //debug
}

void loop() {
  // Random Nerd Tutorials: "The sensor is triggered by a HIGH pulse of 10 or more microseconds.
  // Give a short LOW pulse beforehand to ensure a clean HIGH pulse:"
  digitalWrite(trigPin, LOW);
  delayMicroseconds(5);
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);

  // convert the delay between sending the signal & receiving the echo into an estimated distance
  duration = pulseIn(echoPin, HIGH);
  cm = (duration/2) / 29.1;

  Serial.write(cm); //send data to Processing
  //Serial.println(cm);
  delay(100);
}
