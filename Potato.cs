/*
    Copyright 2016 © Isaac Lee, Some Rights Reserved

    Licensed under the GNU General Public License, Version 3.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.gnu.org/licenses/gpl.html

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for specific language governing permissions and
    limitations under the License.

    Program Created by: 	Isaac Lee
	  Date Created:			    December 15, 2016
	  Date Last Modified: 	December 15, 2016
    File Name: 				    Keyboard Input 2.0
    File Description: 		Allows for keyboard input for the rover
*/
using System;
using System.Net.Sockets;
using System.Threading;
using System.Diagnostics;
using System.Runtime.InteropServices;
using System.Windows.Forms;

namespace Potato {
  public event KeyEventHandler KeyDown;
  protected virtual void OnKeyDown(KeyEventArgs e);
  // Boolean flag used to determine when a character other than a number is entered.
private bool nonNumberEntered = false;

// Handle the KeyDown event to determine the type of character entered into the control.
private void textBox1_KeyDown(object sender, System.Windows.Forms.KeyEventArgs e)
{
  // Initialize the flag to false.
  nonNumberEntered = false;

  // Determine whether the keystroke is a number from the top of the keyboard.
  if (e.KeyCode < Keys.D0 || e.KeyCode > Keys.D9)
  {
      // Determine whether the keystroke is a number from the keypad.
      if (e.KeyCode < Keys.NumPad0 || e.KeyCode > Keys.NumPad9)
      {
          // Determine whether the keystroke is a backspace.
          if(e.KeyCode != Keys.Back)
          {
              // A non-numerical keystroke was pressed.
              // Set the flag to true and evaluate in KeyPress event.
              nonNumberEntered = true;
          }
      }
  }
  //If shift key was pressed, it's not a number.
  if (Control.ModifierKeys == Keys.Shift) {
      nonNumberEntered = true;
  }
}
// This event occurs after the KeyDown event and can be used to prevent
// characters from entering the control.
private void textBox1_KeyPress(object sender, System.Windows.Forms.KeyPressEventArgs e)
{
  // Check for the flag being set in the KeyDown event.
  if (nonNumberEntered == true)
  {
      // Stop the character from being entered into the control since it is non-numerical.
      e.Handled = true;
  }
}

public event KeyPressEventHandler KeyPress;
protected virtual void OnKeyPress(KeyPressEventArgs e);
case (char)65:
case (char)68:
case (char)83:
case (char)87:
  MessageBox.Show("Control.KeyPress: " + e.KeyChar.ToString() + " consumed.");
  e.Handled = true;
  break;
// Boolean flag used to determine when a character other than a number is entered.
private bool nonNumberEntered = false;

// Handle the KeyDown event to determine the type of character entered into the control.
private void textBox1_KeyDown(object sender, System.Windows.Forms.KeyEventArgs e)
{
  // Initialize the flag to false.
  nonNumberEntered = false;

  // Determine whether the keystroke is a number from the top of the keyboard.
   if (e.KeyCode < Keys.D0 || e.KeyCode > Keys.D9)
  {
      // Determine whether the keystroke is a number from the keypad.
      if (e.KeyCode < Keys.NumPad0 || e.KeyCode > Keys.NumPad9)
      {
          // Determine whether the keystroke is a backspace.
          if(e.KeyCode != Keys.Back)
          {
              // A non-numerical keystroke was pressed.
              // Set the flag to true and evaluate in KeyPress event.
              nonNumberEntered = true;
          }
      }
  }
  //If shift key was pressed, it's not a number.
  if (Control.ModifierKeys == Keys.Shift) {
      nonNumberEntered = true;
  }
}

// This event occurs after the KeyDown event and can be used to prevent
// characters from entering the control.
private void textBox1_KeyPress(object sender, System.Windows.Forms.KeyPressEventArgs e)
{
  // Check for the flag being set in the KeyDown event.
  if (nonNumberEntered == true)
  {
      // Stop the character from being entered into the control since it is non-numerical.
      e.Handled = true;
  }
}
public event KeyEventHandler KeyUp;
protected virtual void OnKeyUp(KeyEventArgs e);
private void textBox1_KeyUp(object sender, System.Windows.Forms.KeyEventArgs e)
{
  // Determine whether the key entered is the F1 key. Display help if it is.
  if(e.KeyCode == Keys.F1)
  {
      // Display a pop-up help topic to assist the user.
      Help.ShowPopup(textBox1, "Enter your first name", new Point(textBox1.Right, this.textBox1.Bottom));
  }
}
