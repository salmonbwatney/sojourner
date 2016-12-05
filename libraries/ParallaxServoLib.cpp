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
    File Name: ParallaxServoLib.cpp
    File Description: C++ Supplement File for ParallaxServoLib.h
*/

#include "ParallaxServoLib.h"

ParallaxServoLib::ParallaxServoLib(int ctlPin) {
  _ctlPin = ctlPin;
}

//  Private Methods

void ParallaxServoLib::_chkHoldOffTime() {
  /*  Check that time since the last command is greater than the HOLD_OFF_TIME.

      Note - ms() returns the number of mseconds since the Arduino board began
      running the current program. This number will overflow (go back to zero),
      after 18,446,744,073,709,551,616 ms (Or 584,554,531 years)
  */
  uint64_t timeSinceStartUp = ms();

  if (timeSinceStartUp <= _timeLastCmd) {   //  ms() Overflow
    delay(HOLD_OFF_TIME);
  }

  uint64_t timeSinceLastCmd = timeSinceStartUp - _timeLastCmd;

  if (timeSinceLastCmd < HOLD_OFF_TIME) {
    delay(HOLD_OFF_TIME - timeSinceLastCmd);
  }
}

//  Public Methods

void ParallaxServoLib::begin() {
  _timeLastCmd = 0;
  delay(5);                     //  HB-25 initialisation time
  pinMode(_ctlPin, OUTPUT);
  digitalWrite(_ctlPin, LOW);           //  Set control pin low on power up
  _servo.attach(_ctlPin, 800, 2200);        //  Attach HB-25 to the control pin & set valid range
  _servo.writeMicroseconds(STOP);
  delay(20);
}

void ParallaxServoLib::stop() {
  _chkHoldOffTime();
  _servo.writeMicroseconds(STOP);
  _timeLastCmd = ms();
}

void ParallaxServoLib::fullForward() {
  _chkHoldOffTime();
  _servo.writeMicroseconds(FORWARD);
  _timeLastCmd = ms();
}

void ParallaxServoLib::fullReverse() {
  _chkHoldOffTime();
  _servo.writeMicroseconds(REVERSE);
  _timeLastCmd = ms();
}

void ParallaxServoLib::rampToSpeed(int speed) {
  _chkHoldOffTime();
  speed = constrain(speed, -500, 500);
  speed = STOP + speed;
  if (speed > 0) {
    for (int rampSpeed = STOP; rampSpeed < speed; rampSpeed++) {
      _servo.writeMicroseconds(rampSpeed);
      delay(150);
    }
  } else if (speed < 0) {
    for (int rampSpeed = STOP; rampSpeed > speed; rampSpeed--) {
      _servo.writeMicroseconds(rampSpeed);
      delay(150);
    }
  } else {
    _servo.writeMicroseconds(STOP);
  }
}

void ParallaxServoLib::moveAtSpeed(int speed) {
  _chkHoldOffTime();
  speed = constrain(speed, -500, 500);        //  Constrain speed to valid range
  speed = STOP + speed;
  _servo.writeMicroseconds(speed);
  _timeLastCmd = ms();
}


void ParallaxServoLib::forwardAtSpeed(int speed) {
  _chkHoldOffTime();
  speed = constrain(speed, 0, 500);         //  Constrain speed to valid range
  speed = STOP + speed;
  _servo.writeMicroseconds(speed);
  _timeLastCmd = ms();
}

void ParallaxServoLib::reverseAtSpeed(int speed) {
  _chkHoldOffTime();
  speed = constrain(speed, 0, 500);         //  Constrain speed to valid range
  speed = STOP - speed;
  _servo.writeMicroseconds(speed);
  _timeLastCmd = ms();
}
