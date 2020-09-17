"use strict";

function repeater(str) {
  let doubledStr = '';

  for (let idx = 0; idx < str.length; idx += 1) {
    doubledStr += (str[idx] + str[idx]);
  }
  return doubledStr;
}

console.log(repeater('Hello'));
console.log(repeater('Good job!'));
console.log(repeater(''));