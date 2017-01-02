'''
    Copyright 2016 © Samantha Rachel Belnavis, Some Rights Reserved
    
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
    Date Created:		January 2, 2016
    Date Last Modified: 	January 2, 2016
    File Name: 			webserver.py
    File Description: 		the server file
'''

# import required libraries
import RPi.GPIO as gpio
import os
import sys
import time
from flask import Flask


app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')
