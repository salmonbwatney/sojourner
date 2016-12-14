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

using Gtk;
using GLib;

//Suppress warnings
#pragma warning disable CS0414, CS0169, CS0219

namespace SojournerGUI
{
	public class PyConnect
	{
		//Connection method for connecting to Python Server
		public NetworkStream Connection()
		{
			//Create new connection socket
			TcpClient socket = new TcpClient();
			socket.Connect("localhost", 4000);
			NetworkStream network = socket.GetStream();
			return network;
		}

		// Get Key states and write to network stream
		[GLib.ConnectBefore()]
		public static tvoid KeyPressEvent(object obj, KeyPressEventArgs args)
		{
			//Write to console
			System.Console.WriteLine("Keypress: {0}", args.Event.Key);

			//New Storage Variable for the key pressed
			var dataOutput = args.Event.Key;

			PyConnect activeConnection = new PyConnect();

			//New StreamWriter
			var netStream = activeConnection.Connection();
			System.IO.StreamWriter streamWriter = new System.IO.StreamWriter(netStream);

			//Send data to server
			streamWriter.WriteLine(args.Event.Key);
			//streamWriter.Flush();
			
		}

		public static void Main(string[] args)
		{
			Application.Init();
			MainWindow win = new MainWindow();
			win.KeyPressEvent += new KeyPressEventHandler(KeyPressEvent);
			win.ShowAll();
			Application.Run();
		}

	}
}
