/*
Question: a function that checks if all alphabetic chars are uppercase
  - arg: a string
  - return: true / false
  - ignore non-alphabetic chars
  - empty string returns true
Algo:
  - create another string which is uppercase version of given arg.
  - compare the 2nd string to given arg.
*/

function isUppercase(string) {
  let allUppers = string.toUpperCase();
  return string === allUppers;
}


console.log(isUppercase('t'));
console.log(isUppercase('T'));
console.log(isUppercase('Four Score'));
console.log(isUppercase('FOUR SCORE'));
console.log(isUppercase('4SCORE!'));
console.log(isUppercase(''));    //true  