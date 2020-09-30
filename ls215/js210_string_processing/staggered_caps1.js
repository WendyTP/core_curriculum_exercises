/*
Question: a function that returns a string with a staggered capitalization schem
First letter is capitalized, next char should be lowercase or non-alphabetic char, the following be uppercase or non-alphabetic char, and so on
non-alphabetic char is counted as char
Algo:
  - split each char of string
  - transform each char:
    - if indication is uppercase, change char to uppercase
    - if indication is lowercase, change char to lowercase
    - change indication to opposite case
  - return the transformed string
*/

function staggeredCase(string) {
  let isUpperCase = true;

  return string.split('').map(char => {
    if (isUpperCase) {
      char = char.toUpperCase();
    } else {
      char = char.toLowerCase();
    }

    isUpperCase = !isUpperCase;
    return char;

  }).join('');

}

console.log(staggeredCase('I Love Launch School!'));
console.log(staggeredCase('ALL_CAPS'));
console.log(staggeredCase('ignore 77 the 4444 numbers'));