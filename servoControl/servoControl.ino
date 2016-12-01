/*
    Copyright 2016 © Samantha Rachel Belnavis
    Licensed under the GNU General Public License, Version 3.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.gnu.org/licenses/gpl.html

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for specific language governing permissions and
    limitations under the License.

    Program Created by: Samantha Rachel Belnavis
    Date Last Modified: November 30, 2016
    File Name: servoControl.ino
    File Description: Controls the Servo Motors

    Adopted from sketch by zoomkat
*/

#include <Servo.h>                      //  You need to include Servo.h as it is used by the HB-25 Library
#include "HB25MotorControl.h"

const byte controlPin = 9;              //  Pin Definition
String readString;

HB25MotorControl motorControl(controlPin);

void setup() {
  Serial.begin(9600);
  Serial.println("HB-25 Motor Control Library Test");
  Serial.println("Enter a speed between -500 and 500.");
  Serial.println("A negative speed will reverse the motor direction. 0 will stop.");
  motorControl.begin();
}

void loop() {
  while (Serial.available()) {
    char c = Serial.read();             //  Gets one byte from the serial buffer
    readString += c;
    delay(2);                           //  Slow looping to allow buffer to fill with the next character
  }

  if (readString.length() > 0) {
    Serial.print("\nString entered: ");
    Serial.print(readString);        // Echo captured string
    int n = readString.toInt();        // Convert readString into a number
    n = constrain(n, -500, 500);

    if (n > 0) {
      Serial.print("Set Forward Speed: ");
    } else if (n < 0) {
      Serial.print("Set Reverse Speed: ");
    } else {
      Serial.print("Stop Motor. Speed: ");
    }
    Serial.println(n);
    motorControl.moveAtSpeed(n);

    readString = "";                  //  Empty string for the next input
  }
}
