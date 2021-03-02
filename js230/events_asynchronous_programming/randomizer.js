/*
reqeust: a function that accepts n callbacks and call each callback  at some random point in time between
  now and 2 * n seconds from now. 
  While running, randomizer should log the elapsed time every second: 1, 2, 3, ..., 2 * n.

data: array of callbacks
algo:
  - log second at every second and cancel logging when second is > deadline
  - randomly executes callbacks within timeframe
  


*/

function callback1() {
  console.log('callback1');
}

function callback2() {
  console.log('callback2');
}

function callback3() {
  console.log('callback3');
}

function randomizer(...callbacks) {
  let endTimeInSecond = 2 * callbacks.length;
  let secondElapsed = 0;

  let timeLogger = setInterval(() => {
    secondElapsed += 1;
    //console.log(timeLogger);
    console.log(secondElapsed);
    

    if (secondElapsed >= endTimeInSecond) {
      clearInterval(timeLogger);
      //console.log(timeLogger);
    }
  }, 1000)

  callbacks.forEach(callBack => {
    let executionTime = Math.floor(Math.random() * (endTimeInSecond * 1000));
    setTimeout(callBack, executionTime);
  })
}

randomizer(callback1, callback2, callback3);

// Output:
// 1
// 2
// "callback2"
// 3
// "callback3"
// 4
// 5
// "callback1"
// 6