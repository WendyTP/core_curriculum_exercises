let rlSync = require('readline-sync');

let bill = rlSync.question('What is the bill? ');
bill = Number.parseFloat(bill);

let tipPercentage = rlSync.question('What is the tip percentage? ');
tipPercentage = Number.parseFloat(tipPercentage);


let tip = bill * (tipPercentage / 100);
let total = bill + tip;

console.log(`The tip is ${tip.toFixed(2)}`);
console.log(`The total is ${total.toFixed(2)}`);
