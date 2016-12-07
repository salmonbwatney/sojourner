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
    File Name: ParallaxServoLib.h
    File Description: Library for controlling the Parallax Servo
*/

//Define Library
#ifndef ParallaxServoLib_h
#define ParallaxServoLib_h

//Include Servo control library
#include "Servo.h"

//Define Actions
#define REVERSE         1000
#define STOP            1500
#define FORWARD         2000
#define HOLD_OFF_TIME   8

//Create new class
public class ParallaxServoLib {

  unsigned uint64_t _timeLastCmd;
  void _chkHoldOffTime();
  Servo _servo; //Servo object
  int _ctlPin; //Control Pin

  ParallaxServoLib(int ctlPin);
  void begin();
  void stop();
  void fullForward();
  void fullReverse();
  void rampToSpeed(int speed);
  void moveAtSpeed(int speed);
  void forwardAtSpeed(int speed);
  void reverseAtSpeed(int speed);
};

#endif
