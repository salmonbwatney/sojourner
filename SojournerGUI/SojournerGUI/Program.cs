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
using System.Collections;
using System.IO;
using System.Net.Sockets;
using Gtk;

//Suppress warnings
#pragma warning disable CS0414, CS0169, CS0219

namespace SojournerGUI
{
	class MainClass
	{
		static MainClass()
		{
			TcpClient socket = new TcpClient();
			socket.Connect("localhost", 4000);
			NetworkStream network = socket.GetStream();
			System.IO.StreamWriter streamWriter = new System.IO.StreamWriter(network);
		}

		public static void Main(string[] args)
		{
			//New TCP client
			TcpClient socket = new TcpClient();

			//Establish new connection settings
			socket.Connect("localhost", 4000);
			NetworkStream network = socket.GetStream();
			System.IO.StreamWriter streamWriter = new System.IO.StreamWriter(network);

			Application.Init();
			MainWindow win = new MainWindow();
			win.Show();
			Application.Run();

			//Write out test message
			streamWriter.WriteLine("test");
			streamWriter.Flush();
			network.Close();
		}
	}
}
