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
    Date Last Modified: December 6, 2016
    File Name: SojournerControlGUI.java
    File Description: A basic GUI controller for the Sojourner Rover
*/

//Import required files / libraries
import java.awt;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.Socket;
//import java.util.ArrayList;
//import java.util.Scanner;
import javax.swing.*;

@SuppressWarnings("serial")
public class SojournerControlGUI extends JApplet implements ActionListener {
  //Declare all GUI aspects for the applet

  //Buttons
  Button fwd, rev, stop, left, right, send, reset;

  //Fields and labels
  TextField sendField;
  JLabel sendLable;

  //Networking Variables
  String input = null;
  String serverResponse = null;
  Socket socket;
  PrintWriter serverOut;
  BufferedReader in;
  BufferedReader stdIn;

  // Initialize method
  public void init() {

    //Set size and layout
    setLayout(null);
    setSize(600,350);

    //Create GUI things
    fwd = new Button("Forwards");
    fwd.setBounds(100, 10, 80, 40);
    fwd.setBackground(Color.black);
    fwd.setForeground(Color.cyan);

    stop = new Button("Stop");
    stop.setBounds(100, 60, 80, 40);
    stop.setBackground(Color.black);
    stop.setForeground(Color.red);

    rev = new Button("Backwards");
    rev.setBounds(100, 110, 80, 40);
    rev.setBackground(Color.black);
    rev.setForeground(Color.cyan);

    left = new Button("Left");
    left.setBounds(10, 60, 80, 40);
    left.setBackground(Color.black);
    left.setForeground(Color.cyan);

    right = new Button("Right");
    right.setBounds(190, 60, 80, 40);
    right.setBackground(Color.black);
    right.setForeground(Color.cyan);

    send = new Button("Send");
    send.setBounds(350, 105, 80, 40);
    send.setBackground(Color.black);
    send.setForeground(Color.green);

    reset = new Button("Reset all the things");
    reset.setBounds(440, 105, 80, 40);
    reset.setBackground(Color.black);
    reset.setForeground(Color.orange);

    sendLabel = new JLabel("Enter Commands Below:");
    sendLabel.setBounds(365, 40, 150, 30);

    sendField = new TextField("p 0",35);
    sendField.setBounds(350, 70, 170, 30);

    speed = new Button("Speed");
    speed.setBounds(505, 170, 60, 30);
    speed.setBackground(Color.black);
    speed.setForeground(Color.pink);

    //Add the things to GUI
    add(fwd);
    add(rev);
    add(stop);
    add(left);
    add(right);
    add(send);
    add(reset);
    add(sendLabel);
    add(sendField);

    //Add action listeners to buttons
    fwd.addActionListener(this);
    rev.addActionListener(this);
    stop.addActionListener(this);
    left.addActionListener(this);
    right.addActionListener(this);
    send.addActionListener(this);
    reset.addActionListener(this);

    //Networking stuff
    try {
      //Establish connection to server
      //Create stream socket and connect to it
      socket = new Socket("0.0.0.0", 0000); //Replace with server details
      System.out.println("Successfully connected to server");

      //Create output stream with server
      //Get socket output stream and open new printwriter
      serverOut = new PrintWriter(new BufferedWriter(new OutputStreamWriter(socket.getOutputStream())));

      in = new BufferredReader(new InputStreamReader(socket.getInputStream()));
      stdIn = new BufferredReader(new InputStreamReader(System.in));

    } catch (Exception e) {
      System.out.println(e);
      System.out.println("Hey there buddy, you done goofed. Don't do it again.");
    }
  }

  //Method for mouse events
  public void actionPerformed(ActionEvent evnt) {
    if (evt.getSource() == fwd){
      System.out.println("FWD pressed");
      input = "fwd 1"
    }
    else if (evt.getSource() == rev) {
      System.out.println("REV was pressed");
      input = "rev";
    }
    else if (evt.getSource() == stop) {
      System.out.println("Stop was pressed.");
      input = "stop";
    }
    else if (evt.getSource() == left) {
      System.out.println("Left was pressed.");
      input = "rotL";
    }
    else if (evt.getSource() == right) {
      System.out.println("Right pressed.");
      input = "rotR";
    }
    else if (evt.getSource() == reset) {
      System.out.println("Reset was pressed");
      input = "command to be set"
    }
    else if (evt.getSource() = send) {
      input = sendField.getText(); //Get Text from box
      //Close connection if user types "exit"
      if("exit".equals(input)){
        try {
          System.out.println("Finished write");
          Thread.sleep(2000);
          //Close connection to server
          in.close();
          serverOut.close();
          socket.close();
          System.out.println("Closed Connection.");
        } catch (InterruptedException e) {
          //TODO Auto-generated catch
          e.printStackTrace();
        } catch (IOException e) {
          //TODO Auto-generated catch
          e.printStackTrace();
        }
      }
    }
    serverOut.println(input); //Write to server
    serverOut.flush(); //Clear variable
  }
}
