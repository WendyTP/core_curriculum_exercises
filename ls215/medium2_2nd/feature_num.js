/*
10:28 -10:37 (9 min)
11: 08 - 11:38   (30)
inpput: integer (positive / negative ?) -- assume positive
oputput: positive integer or error message
rules:
  feature num:
    - odd num
    - multiple of 7
    - digits occur once each
  output > input (even if input is feature num)
data: 
  - num obj
  - array of digits
algo:
- if (num >= 9876543201) => return error message
- if input % 7 !== 0
    input - (input % 7)
loop until num >= limit:
- input is even , add 7
  check if digits occur once && new num > input
  return new num if found
- input is odd , add 14
  check if digits occur once && new num > input
- return error message
- check digits occur once:
    - create empty arr []
    - split digits to arr of string char
    - if [].includes digit? => return false
      - otherwise, push digit to arr
    - return true
*/

function featured(number) {
  if (number >= 9876543201) {
    return 'No next featured number!'
  }

  let startNum;

  if (number % 7 !== 0) {
    startNum = number - (number % 7);
  } else {
    startNum = number;
  }

  let increaseNums = startNum % 2 === 0 ? 7 : 14;

  while (startNum < 9876543201) {
    startNum += increaseNums;
    if (singleDigits(startNum) && startNum > number) {
      return startNum;
    }
  }

  return 'No next featured number!'

  

}


function singleDigits(number) {
  let digits = [];
  let stringNum = String(number);

  for (let idx = 0; idx < stringNum.length; idx += 1) {
    if (digits.includes(stringNum[idx])) {
      return false;
    } else {
      (digits.push(stringNum[idx]))
    }
  }

  return true;
}

//console.log(singleDigits(12))  // true
//console.log(singleDigits(133))  // false


console.log(featured(12));           // 21
// 
console.log(featured(20));           // 21
console.log(featured(21));           // 35
// 21 + 7 === 35
console.log(featured(997));          // 1029
console.log(featured(1029));         // 1043
console.log(featured(999999));       // 1023547
console.log(featured(999999987));    // 1023456987
//console.log(featured(9876543201));   // no next featured number
