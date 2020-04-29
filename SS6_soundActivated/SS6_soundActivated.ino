int i;
int wait = 175;
int bigSound = 3;

bool noise = LOW;

int pins[] = {6, 7, 8, 9, 10, 11};

int led1[] = {0, 0, 1, 1, 1, 1, 1, 0, 0, 0};
int led2[] = {0, 1, 1, 1, 0, 1, 1, 1, 0, 0};
int led3[] = {1, 1, 1, 0, 0, 0, 1, 1, 1, 0};
int led4[] = {1, 1, 1, 0, 0, 0, 1, 1, 1, 0};
int led5[] = {0, 1, 1, 1, 0, 1, 1, 1, 0, 0};
int led6[] = {0, 0, 1, 1, 1, 1, 1, 0, 0, 0};

void setup() {
  // put your setup code here, to run once:
  for (i=0; i<=5; i++) { pinMode(pins[i], OUTPUT); }
  pinMode(bigSound, INPUT);
}

void loop() {
  // put your main code here, to run repeatedly:
  noise = digitalRead(bigSound);
  
  if (noise == HIGH) {
    for (i=0; i<=9; i++) {
      digitalWrite(pins[0], led1[i]);
      digitalWrite(pins[1], led2[i]);
      digitalWrite(pins[2], led3[i]);
      digitalWrite(pins[3], led4[i]);
      digitalWrite(pins[4], led5[i]);
      digitalWrite(pins[5], led6[i]);
      delay(wait);
    }
  } else {
    for (i=0; i<=5; i++) {
      digitalWrite(pins[i], LOW);
    }
  }
}
