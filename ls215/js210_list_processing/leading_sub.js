/*
Question: a function that takes a string argument, and returns a list of all substrings
 that start from the beginning of the string, ordered from shortest to longest.
Algo:

*/

function leadingSubstrings(str) {
  let arrayOfLetters = str.split('')
  return arrayOfLetters.map((letter, currentIdx) => {
    return arrayOfLetters.slice(0, currentIdx + 1).join('');
  })
}

console.log(leadingSubstrings('abc'));
console.log(leadingSubstrings('a'));
console.log(leadingSubstrings('xyzzy'));