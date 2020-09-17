"use strict";

function reverseNumber(num) {
  let reversedStringNum = String(num).split('').reverse().join('');
  return parseInt(reversedStringNum, 10);
}


console.log(reverseNumber(12345));
console.log(reverseNumber(12213));
console.log(reverseNumber(456));
console.log(reverseNumber(12000));
console.log(reverseNumber(1));