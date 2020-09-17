var logValue = 'foo';

function logValue() {
  console.log('Hello, world!');
}

console.log(typeof logValue);  // string


/* 
hoisting:

function logValue() {
  console.log('Hello, world!');       // typeof logValue = function
}

var logValue = 'foo';                // typeof logValue = 'foo'

console.log(typeof logValue);

// when a function and variable (who are on the same scope) have the same name, JS hoist the function first, then the variable.

*/