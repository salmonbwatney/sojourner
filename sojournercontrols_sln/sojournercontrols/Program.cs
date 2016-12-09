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
    Program Created by: 	Samantha Rachel Belnavis
	Date Created:			December 8, 2016
	Date Last Modified: 	December 8, 2016
    File Name: 				SojournerControlGUI.java
    File Description: 		A basic GUI controller for the Sojourner Rover
*/

//Import required libraries
using System;
using System.Collections;
using System.IO;
using Gtk;

//Suppress "unused" warnings
#pragma warning disable CS0414, CS0169

namespace sojournercontrols
{

	class MainClass 
	{
		

		public static void Start() 
		{
			
		}
		private void KeyDown(KeyEventArgs e)
		{
			if (e.KeyCode == Keys.Left)
			{
			}
		}
		public static void Main(string[] args) 
		{
			Application.Init();
			MainWindow win = new MainWindow();
			win.Show();
			Application.Run();
		}
	}
}