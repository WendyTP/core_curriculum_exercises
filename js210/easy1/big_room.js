let rlSync = require('readline-sync');

console.log ('Enter the length of the room in meters:');
let length = rlSync.prompt();
length = parseInt(length, 10);

console.log('Enter the width of the room in meters:');
let width = rlSync.prompt();
width = parseInt(width, 10);

const SQUARE_METER_TO_SQUARE_FEET  = 10.7639;

let squareMeter = length * width;
let squareFeet = squareMeter * SQUARE_METER_TO_SQUARE_FEET;

console.log(`The area of the room is ${squareMeter.toFixed(2)} square meters (${squareFeet.toFixed(2)} square feet).`)