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
    File Name: servoControl.c
    File Description: Controls the Servo Motors
*/

#include <stdio.h>
#include "libraries/wiringPi/wiringPi.h"
#include "libraries/servo.h" //Servo Library
#include "libraries/ParallaxServoLib.h" //Library for Parallax Servo Control

const int controlPin = 9; //Set Pin
char readString[65535];


const int ctlPin1 = 12; //Set Pin for first servo
const int ctlPint2 = 11; //Set Pin for first servo

ParallaxServoLib servoControl = servo(ctlPin1); //New servo object

void setup() {
  //Setup wiringPi integration
  int wiringPiSetupGpio(void); //Using BCM

  servoControl.begin(); //Start Servo Control

}

void loop() {

}
