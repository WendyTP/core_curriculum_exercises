/*
15:56 - 
input: a number (integer) with 1 or more digits ; a number (positive integer) ==> n digits
  invalid input:
    - non positive integer
    - non number type
        return 'invalid input!'
    - 2nd arg more than total digits ?  ==> limit to digit length

output: a number (rotated)
rules:
  - rotate last n digits  (only change the last n digits)
  - move the first digit of last n digits to the end 
  - only 1 digit chose, rotate this 1 (no change to number)
  735291 ,5 ==> 7  35291 
  35291 ===> 52913
  7  52913   ==> 752913
data:
  array of split digits (in string form)
algo:
  -validate input
  - split digits (array)  (turn to string, split by chars)
  - slice off the last digits from the array ==> another array
  - rotate this sub array
    - slice arr from 2nd digits then concat the first element to the end of array
  - slice the first untouched array, then concat with the rotated array
  - join the chars then transform string to number

*/

function rotateRightmostDigits(number, digits) {
  if (!isPositiveInteger(number) || !isPositiveInteger(digits)) {
    return 'invalid input';
  }

  if (digits > String(number).length) {
    digits = String(number).length;
  }

  let allDigits = String(number).split('');
  let rotationPart = allDigits.slice(-digits);

  let result = allDigits.slice(0, allDigits.length - digits).concat(rotateArray(rotationPart));

  return parseInt(result.join(''),10);

}

function rotateArray(arr) {
  return arr.slice(1).concat(arr[0]);
}


function isPositiveInteger(num) {
  return Number.isInteger(num) && num > 0    
}


// invalid input
console.log(rotateRightmostDigits());      // invalid input
console.log(rotateRightmostDigits('we',2));   // invalid input
console.log(rotateRightmostDigits(735291,10));  // 352917



console.log(rotateRightmostDigits(735291, 1));   // 735291
console.log(rotateRightmostDigits(735291, 2));   // 735219
console.log(rotateRightmostDigits(735291, 3));   // 735912
console.log(rotateRightmostDigits(735291, 4));   // 732915
console.log(rotateRightmostDigits(735291, 5));   // 752913
console.log(rotateRightmostDigits(735291, 6))    // 352917

// not change original input
let num = 12345
console.log(rotateRightmostDigits(num,2));   //12354
console.log(num)  //12345
