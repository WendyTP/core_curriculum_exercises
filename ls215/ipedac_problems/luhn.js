/*
9:22 - 9:53 (31)
input: string (contain digits and/or other chars)
  invalid input:  non string ; empty string; string that doesn't have any digits
output: boolean true (if number is valid per formula). otherwise false
rules:
  ex. input 8763
  #1: 8763 ==> (16) 7 (12) 3
  # 2: subtract 9 from each digit if >= 10: (16) 7 (12) 3 => (16 -9) 7 (12-9) 3 => 7 7 3 3
  #3: add all digits : 7733 => 7 + 7 + 3 + 3 ==> 20
  #4: if total % 10 === 0, then the input number is valid; otherwise, its not valid
  - ignore non-digit chars in input
data:
  array of number digits 
algo:
  - remove non number chars from string (replace with '');
  - split number string and transform to number ex [1,1,1,1]
  - create copy of arr number,then reverse the copy
  - iterate and transform the reversed arr:
    - if idx is odd, double the digit
    - if digit >= 10, subtract 9 from it
  - add up all digits 
  - if sum % 10 === 0, return true, else, return false
*/

function validLuhnNumber(number){
  let allDigits = number.replace(/[^0-9]/g, '').split('').map(char => parseInt(char, 10));
  let reversedDigits = allDigits.slice().reverse();

  let digitSum = reversedDigits.map((digit, idx) => {
    if (idx % 2 !== 0) {
      digit *= 2;
    }

    if (digit >= 10) {
      digit -= 9;
    }
    return digit;
  }).reduce((sum, digit) => sum + digit);

  return digitSum % 10 === 0;
}

console.log(validLuhnNumber('1111'))  // false
console.log(validLuhnNumber('1-1dt11'))  // false
console.log(validLuhnNumber('8763'))  // true
console.log(validLuhnNumber('2323')) // false
console.log(validLuhnNumber('2323 2005 7766 3554')) // true