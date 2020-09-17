"use strict";

function average(arr) {
  let totalSum = arr.reduce((sum, num) => sum + num);
  return Math.floor(totalSum / arr.length);
}

console.log(average([1, 5, 87, 45, 8, 8]));
console.log(average([9, 47, 23, 95, 16, 52]));