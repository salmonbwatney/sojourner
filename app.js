// required dependancies

var express = require('express'),
    http = require('http'),
    path = require('path'),
    async = require('async'),
    gpio = require('pigpio'),
    Pigpio = require('js-pigpio'),
    app = express();

// set app port
app.set('port', process.env.PORT || 5000);

//serve static files from static directory
app.use(express.static(path.join(__dirname, '/static')));

//create the server
var http = http.createServer(app).listen(app.get('port'), function(){
  console.log('Express server listening on port ' + app.get('port'));
});

//init socket.io
var io = require('socket.io')(http);

var PiGPIO = new Pigpio();
// new car object
var car = {

  motorControls: {
    drivePin: 12, // Enable Pin 1
    drivePin: 16, // Input 1

    dutyCycleFwd: 10,
    dutyCycleRev: 55,
    dutyCycleLeft: 5,
    dutyCycleRight: 55,
    dutyCycleIdle: 0
  },

  //enable gpio pins
  init: function(){
    PiGPIO.set_PWM_dutycycle(this.drivePin, this.dutyCycleIdle);
    PiGPIO.set_PWM_dutycycle(this.steerPin, this.dutyCycleIdle);

  },

  //moving forwards
  mvForward: function() {
    async.parallel([
      PiGPIO.set_PWM_dutycycle(this.drivePin, this.dutyCycleFwd)
    ]);
  },

  mvBackward: function() {
    async.parallel([
      PiGPIO.set_PWM_dutycycle(this.drivePin, this.dutyCycleRev)

    ]);
  },

  tLeft: function() {
    async.parallel([
      PiGPIO.set_PWM_dutycycle(this.steerPin, this.dutyCycleLeft)

    ]);
  },

  tRight: function() {
    async.parallel([
      PiGPIO.set_PWM_dutycycle(this.steerPin, this.dutyCycleRight)
    ]);
  },

  dIdle: function() {
    async.parallel([
      PiGPIO.set_PWM_dutycycle(this.drivePin, this.dutyCycleIdle)
    ]);
  },

  tIdle: function() {
    async.parallel([
      PiGPIO.set_PWM_dutycycle(this.steerPin, this.dutyCycleIdle)
    ]);
  },
};

//listen for socket connection
io.sockets.on('connection', function(socket) {
  //listen for move signal
  socket.on('move', function(direction) {
    switch(direction){
     case 'up':
        car.mvForward();
        break;
      case 'down':
        car.mvBackward();
        break;
      case 'left':
        car.tLeft();
        break;
      case 'right':
        car.tRight();
        break;
    }
  });
  //listen for stop signal
  socket.on('stop', function(dir){
    car.dIdle();
    car.tIdle();
  });
});

car.init();
