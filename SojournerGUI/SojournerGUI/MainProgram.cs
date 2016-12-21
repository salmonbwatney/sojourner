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
	Date Created:			December 12, 2016
	Date Last Modified: 	December 20, 2016
    File Name: 				MainProgram.cs
    File Description: 		Main GUI controller for Sojourner
*/

using System;
using System.Net.Sockets;
using System.Threading;
using System.Diagnostics;
using System.Runtime.InteropServices;
using System.Text;
using System.Windows.Forms;
using NUnit.Framework;
using Gtk;
using GLib;

//Suppress "unused private variable" / "unused class" / "unused variable" / "declared but never used"
#pragma warning disable CS0414, CS0169, CS0219, CS0168

namespace SojournerGUI
{
	public class PyConnect
	{

		//Connection method for connecting to Python Server
		public static System.Net.Sockets.Socket ConnSocket()
		{
			while (true)
			{
				try
				{
					System.Net.Sockets.Socket sck = new System.Net.Sockets.Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);

					//Write Connection details to application output console
					Console.WriteLine(sck.Connected.ToString());

					System.Net.IPEndPoint destAddress = new System.Net.IPEndPoint(System.Net.IPAddress.Parse("localhost"), 4001);
					sck.Connect(destAddress);

					//Write to console again
					Console.WriteLine(sck.Connected.ToString());

					//Return socket details
					if (sck.Connected == true)
					{
						return sck;
					}
				}
				//Reconnect if it fails
				catch (Exception ex)
				{
					Console.WriteLine("Could not connect to server. Retrying in 3 seconds");
					//Sleep before reconnecting
					System.Threading.Thread.Sleep(3000);
				}
			}
		}

		// Get Key states and write to network stream
		[GLib.ConnectBefore()]
		public static void KeyPressEvent(object sender, Gtk.KeyPressEventArgs args)
		{
			//Storage for key pressed
			var keyOut = args.Event.Key;

			
			// -------------- Key definitions --------------

			//If key pressed / held is "w" or "W"
			if (args.Event.KeyValue == 0x057 || args.Event.KeyValue == 0x077)
			{
				Console.WriteLine("Keypress: {0}", args.Event.Key);
				byte[] msgOut = new byte[] { };
				msgOut = Encoding.ASCII.GetBytes("mov_fwd");

			}

			//If key pressed / held is "a" or "A"
			if (args.Event.KeyValue == 0x041 || args.Event.KeyValue == 0x061)
			{
				Console.WriteLine("Keypress: {0}", args.Event.Key);
			}

			//If key pressed / held is "s" or "S"
			if (args.Event.KeyValue == 0x053 || args.Event.KeyValue == 0x073)
			{
				Console.WriteLine("Keypress: {0}", args.Event.Key);
			}

			//If key pressed / held is "d" or "D"
			if (args.Event.KeyValue == 0x044 || args.Event.KeyValue == 0x064)
			{
				Console.WriteLine("Keypress: {0}", args.Event.Key);
			}

			//Extra Peripherals

			//If key pressed is "c" or "C"
			if (args.Event.KeyValue == 0x043 || args.Event.KeyValue == 0x063)
			{
				Console.WriteLine("Keypress: {0}", args.Event.Key);
				//@TODO Camera control code
			}

			//If key pressed is "l" or "L"
			if (args.Event.KeyValue == 0x04c || args.Event.KeyValue == 0x06c)
			{

			}
		}

		// GUI Specific Events

		//Runs when the window is cloaed
		static void delete_event(object obj, DeleteEventArgs args)
		{
			Gtk.Application.Quit();
		}

		// Runs when the "test button" button is pressed
		static void test(object obj, EventArgs args)
		{
			Console.WriteLine("button was pressed");
		}

		public static void Main(string[] args)
		{
			Gtk.Application.Init();

			//New Button
			Gtk.Button btn = new Gtk.Button("Test Button");

			// Run something when a button is pressed 
			btn.Clicked += new EventHandler(test);


			MainWindow win = new MainWindow();
			win.KeyPressEvent += new Gtk.KeyPressEventHandler(PyConnect.KeyPressEvent);

			//Add buttons to new window
			win.Add(btn);
			win.ShowAll();

			Gtk.Application.Run();
		}

	}
}
