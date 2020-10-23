/*
17:55 - 18: 27
input: a number and last n digits (between 1 and length of number)
  invalid input: non positive integers
     if n > length => treat it as length
output: rotated number 
rule: 
  - not mutate original number
  - keep number length - n untouched
  - rotate n
data: array of string nums
algo:
  - validate input:
    - if both inputs are not positive integers => return 'invalid input'
    - if 2nd input is bigger than lenggth of number, change to length of number
  - turn input to string, then split by chars
  - slice arr from idx 0 to last n, concat with last n digits of arr (rotated)
  
  - rotated last n digits of arr:
    - slice arr from idx 1 to last, concat with arr[0]
*/


function rotateRightmostDigits(number, digits) {
  if (!ispositiveInteger(number) || !ispositiveInteger(digits)) {
    return 'invalid input!';
  }

  let allDigits = String(number).split('');
  digits = digits > allDigits.length ? allDigits.length : digits;

  let unRoatePart = allDigits.slice(0, allDigits.length - digits)
  let rotatedPart = rotateArray(allDigits.slice(-digits));

  return parseInt(unRoatePart.concat(rotatedPart).join(''), 10)
}


function ispositiveInteger(num) {
  return Number.isInteger(num) && num > 0;
}


function rotateArray(arr) {
  return arr.slice(1).concat(arr.slice(0,1));
}

//console.log(rotateArray([3,4,5])) // [4,5,3]


console.log(rotateRightmostDigits(735291, 1));      // 735291

console.log(rotateRightmostDigits(735291, 2));      // 735219

console.log(rotateRightmostDigits(735291, 3));      // 735912
console.log(rotateRightmostDigits(735291, 4));      // 732915
console.log(rotateRightmostDigits(735291, 5));      // 752913
console.log(rotateRightmostDigits(735291, 6));      // 352917
