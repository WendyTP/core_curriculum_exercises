/*
Question: Write a function that returns a list of all substrings of a string that are palindromic.
palindromic: each substring must consist of the same sequence of characters forwards as backwards.
assume that single characters are not palindromes.
case and characters sensitive
Algo:
  - to get all substrings:
     - create an array of letters (from str)
    - iterate (transform) through each letters :
      - create a substr from current letter til end of str
      - create arrays of substrigs of each substr
      - return arrays to main array
  to select palindrom strings:
    - iterate through each substr:
      - create backward substr
      - return true if substr and backward substr are the same; otherwise return false
*/

function palindromes(str) {
  let allSubStrs = substrings(str);

  return allSubStrs.filter(subStr => {

    let backwardStr = subStr.split('').reverse().join('');

    if (subStr.length !== 1 && subStr === backwardStr) {
      return true;
    } else {
      return false;
    }
    
  })
}

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


console.log(palindromes('abcd'));
console.log(palindromes('madam'));

console.log(palindromes('hello-madam-did-madam-goodbye'));
console.log(palindromes('knitting cassettes'));
