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
    Date Last Modified: November 28, 2016
    File Name: servoControl.rb
    File Description: Controls the Servo Motors
*/

// Declare Variables
int turnLeft = 0;
int turnRight = 0;
int pos = 0
const int turnCycles = 100 // Number of cycles that need to be done in order to turn
const int turnSpeed = 20 //How fast the servo controlling steering will move

// Import project specific libraries
#include <Servo.h>

Servo myservo ; //Create Servo object

void setup() {
  myservo.attach(9); //Attach object to pin 9
}

void loop() {
  //Turn Left
  if (turnLeft == 1) {
    for (pos = 0; i < turnCycles; i += 1) {
      myservo.write(pos);
      delay(turnSpeed);
    }
  }

  //Turn Right
  if (turnRight == 1) {
    for (pos = 0; i < turnCycles; pos -= 1) {
      myservo.write(pos);
      delay(turnSpeed);
    }
  }

  //Reset Position if input not detected
  if (turnLeft == 0 && turnRight == 0){
    //Check position
    if (pos < 0; pos += 1) {
      myservo.write(pos);
      delay(turnSpeed);
    }

    if (pos > 0; pos -= 1) {
      myservo.write(pos);
      delay(turnLeft);
    }
  }
}
