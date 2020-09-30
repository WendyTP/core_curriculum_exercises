/*
Question: a function that returns a string with a staggered capitalization schem, but ignore non-alphabetic chars when determine case changes
Algo:
  - transform each char of string
  - if char is non-alphabetic, return char unchaged
  - if indication is uppercae, return char upperased
  - if indication is lowercase, return char lowercased
  - change indication to opposite case
*/

function staggeredCase(string) {
  let isUppercase = true;

  return string.split('').map(char => {
    
    if (/[a-zA-Z]/.test(char) !== true) {
      return char;
    }

    if (isUppercase) {
      char = char.toUpperCase();
    } else {
      char = char.toLowerCase();
    }

    isUppercase = !isUppercase;
    return char;
  }).join('');
}


console.log(staggeredCase('I Love Launch School!'));
console.log(staggeredCase('ALL_CAPS'));
console.log(staggeredCase('ignore 77 the 4444 numbers'));