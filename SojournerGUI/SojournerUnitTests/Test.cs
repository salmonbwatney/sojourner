using NUnit.Framework;
using System;
using System.Net.Sockets;
using System.Threading;
using System.Text;
using System.Windows.Input;


namespace SojournerUnitTests
{
	[TestFixture()]
	public class Test
	{
		[Test()]
		public static System.Net.Sockets.Socket Connection()
		{
			while (true)
			{
				try
				{
					System.Net.Sockets.Socket sck = new System.Net.Sockets.Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
					Console.WriteLine(sck.Connected.ToString());

					System.Net.IPEndPoint destAddress = new System.Net.IPEndPoint(System.Net.IPAddress.Parse("0.0.0.0"), 4001);
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
	}
}
