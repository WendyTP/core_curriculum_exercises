"use strict";

function isConsonant(char) {
  if (char.match(/[^a-zA-Z]/)) {
    return false;
  }

  if (char.match(/[aeiou]/i)) {
    return false;
  }

  return true;
}

function doubleConsonants(str) {
  let doubledLetters = '';

  for (let idx = 0; idx < str.length; idx += 1) {
    if (isConsonant(str[idx])) {
      doubledLetters += (str[idx] + str[idx]);
    } else {
      doubledLetters += str[idx];
    }
  }

  return doubledLetters;
}

console.log(doubleConsonants('String'))
console.log(doubleConsonants('Hello-World!'))
console.log(doubleConsonants('July 4th'))
console.log(doubleConsonants(''))