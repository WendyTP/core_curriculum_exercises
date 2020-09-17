"use strict";

//odd 13 / 2 = 6.5 ==> idx 6
//even 12/ 2 = 6 ==> idx 5 6


function centerOf(str) {
  let middle = Math.floor(str.length / 2);
  if (str.length % 2 === 0) {
    return str[middle - 1] + str[middle];
  } else {
    return str[middle];
  }
}

console.log(centerOf('I Love JavaScript'));
console.log(centerOf('Launch School'));
console.log(centerOf('Launch'));
console.log(centerOf('Launchschool'));
console.log(centerOf('x'));