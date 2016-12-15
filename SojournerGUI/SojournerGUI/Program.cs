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
	Date Last Modified: 	December 12, 2016
    File Name: 				Program.cs
    File Description: 		GUI controller for Sojourner
*/

using System;
using System.Net.Sockets;
using System.Threading;
using System.Diagnostics;
using System.Runtime.InteropServices;

using System.Windows.Forms;

using Gtk;
using GLib;

//Suppress warnings
#pragma warning disable CS0414, CS0169, CS0219

namespace SojournerGUI
{
	public class PyConnect
	{
		//Connection method for connecting to Python Server
		/*
		public NetworkStream Connection()
		{
			//Create new connection socket
			TcpClient socket = new TcpClient();
			socket.Connect("localhost", 4001);
			NetworkStream network = socket.GetStream();
			return network;
		}*/

		public static void PythonServer(object netOut, NetworkStream e)
		{
			TcpClient socket = new TcpClient();
			socket.Connect("localhost", 4001);
			NetworkStream network = socket.GetStream();

		}

		// Get Key states and write to network stream
		[GLib.ConnectBefore()]
		public static void KeyPressEvent(object sender, Gtk.KeyPressEventArgs args)
		{
			//Write to console
			//System.Console.WriteLine("Keypress: {0}", args.Event.Key);


			//New Storage Variable for the key pressed
			var dataOutput = args.Event.Key;

			//PyConnect activeConnection = new PyConnect();

			//New StreamWriter
			var netStream = activeConnection.Connection;
			System.IO.StreamWriter streamWriter = new System.IO.StreamWriter();


			// -------------- Key definitions --------------

			//If key pressed / held is "w" or "W"
			if (args.Event.KeyValue == 0x057 || args.Event.KeyValue == 0x077)
			{
				Console.WriteLine("Keypress: {0}", args.Event.Key);
				streamWriter.WriteLine("mov_fwd");
				streamWriter.Flush();
			}

			//If key pressed / held is "a" or "A"
			if (args.Event.KeyValue == 0x041 || args.Event.KeyValue == 0x061)
			{
				Console.WriteLine("Keypress: {0}", args.Event.Key);
				streamWriter.WriteLine("turn_left");
				streamWriter.Flush();
			}

			//If key pressed / held is "s" or "S"
			if (args.Event.KeyValue == 0x053 || args.Event.KeyValue == 0x073)
			{
				Console.WriteLine("Keypress: {0}", args.Event.Key);
				streamWriter.WriteLine("mov_rev");
				streamWriter.Flush();
			}

			//If key pressed / held is "d" or "D"
			if (args.Event.KeyValue == 0x044 || args.Event.KeyValue == 0x064)
			{
				Console.WriteLine("Keypress: {0}", args.Event.Key);
				streamWriter.WriteLine("turn_right");
				streamWriter.Flush();
			}

			//Extra Peripherals

			//If key pressed is "c" or "C"
			if (args.Event.KeyValue == 0x043 || args.Event.KeyValue == 0x063)
			{
				Console.WriteLine("Keypress: {0}", args.Event.Key);
				streamWriter.WriteLine("toggle_camera");
				streamWriter.Flush();

				//@TODO Camera control code
			}

			//If key pressed is "l" or "L"
			if (args.Event.KeyValue == 0x04c || args.Event.KeyValue


		public static void Main(string[] args)
		{
			Gtk.Application.Init();
			MainWindow win = new MainWindow();
			win.KeyPressEvent += new Gtk.KeyPressEventHandler(PyConnect.KeyPressEvent);
			win.ShowAll();
			Gtk.Application.Run();
		}

	}
}
