var counter = 5;
var rate = 3;
console.log('The total value is ' + String(counter * rate));

function counter(count) {
  // ...
}
/*
function counter(count) {};
var rate;
counter = 5;
var rate = 3;
consloe.log ...
log:  'The total value is 15'
*/

function counter(count) {
  // ...
}

console.log('The total value is ' + String(counter * rate));

var counter = 5;
var rate = 3;

/*
logs: The total value is NaN  ; String(counter * rate) => 'NaN'
*/

var counter = 5;
var rate = 3;

function counter(count) {
  // ...
}

console.log('The total value is ' + String(counter * rate));

/*
function counter(count) {};
var rate;
counter = 5;
rate = 3;
console.log ...

logs: The total value is 15
*/

let counter = 5;
let rate = 3;

function counter(count) {
  // ...
}

console.log('The total value is ' + String(counter * rate));
/*
logs: SyntaxError: Identifier 'counter' is already declared.
*/