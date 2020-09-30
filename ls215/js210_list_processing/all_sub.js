/*
Question: Write a function that returns a list of all substrings of a string.
Algo:
  - create an array of letters (from str)
  - iterate (transform) through each letters :
    - create a substr from current letter til end of str
      - create arrays of substrigs of each substr
      - return arrays to main array
*/

function substrings(str) {
  let strInLetters = str.split('');

  return strInLetters.map((letter, idx) => {
    let subStr = strInLetters.slice(idx).join('');
    return leadingSubstrings(subStr);
  }).flat();
}

function leadingSubstrings(str) {
  let arrayOfLetters = str.split('')
  return arrayOfLetters.map((letter, currentIdx) => {
    return arrayOfLetters.slice(0, currentIdx + 1).join('');
  })
}

// leadingSubStrings('abc')   => ['a', 'ab', 'abc']

console.log(substrings('abcde'))