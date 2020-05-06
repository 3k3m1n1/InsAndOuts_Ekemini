/* i was honestly taking the easy way out with this one flashing LED...
 *  ...but this would actually look cooler if i spread out multiple LEDs to act as the raindrop splashes
 *  so the digital rain has a physical presence? if that makes sense
*/

const int red = 11;
const int green = 10;
const int blue = 9;

byte val;

void setup() {
  pinMode(red, OUTPUT);
  pinMode(green, OUTPUT);
  pinMode(blue, OUTPUT);

  Serial.begin(9600);
}

void loop() {
  if (Serial.available()) {
    val = Serial.read();
  }

  if (val == 1) { //a raindrop hit the ground
    //then blink
    analogWrite(red, 100);
    analogWrite(green, 30);
    analogWrite(blue, 70);
    delay(100);
    analogWrite(red, 50);
    analogWrite(green, 1);
    analogWrite(blue, 28);
    val = 0;
    
  } else {
    analogWrite(red, 50);
    analogWrite(green, 1);
    analogWrite(blue, 28);
    delay(10);
  }
}
