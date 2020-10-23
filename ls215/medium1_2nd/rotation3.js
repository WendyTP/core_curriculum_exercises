/*
09:31 -10:02
input: number
output: rotated number (max)
rules:
  - not mutate original number
  - place first digit to last
  - keep 1st digit, rotate (n - 1) digits  (combine 1st and rotated part)
  - keep 2nd , rotate (n - 2)
  - keep n - 2, rotate (n - (n -2)) digits
  - each rotation:
    - place first digit to last
data:
  - array of string digits
algo:
  - rotate array of digits
    - slice arr from idx 1 to last, concat with arr[0]
  - rotate last n digits
    - split untouched part
    - rotate array of digits (last n digits)
    - combine untouched with rotated part
  -  iterate from n (length of digits):
    - rotate last n digits
    - n - 1
    - continue the iteration until n - (n - 2)

*/

function rotateArray(arr) {
  return arr.slice(1).concat(arr.slice(0,1));
}

function rotateRighMostDigits(arr, digits) {
  let untouchedPart = arr.slice(0, arr.length - digits);
  let rotatedPart = rotateArray(arr.slice(arr.length - digits));

  return untouchedPart.concat(rotatedPart);
}

function maxRotation(number) {
  let allDigitsInString = String(number).split('');
  let allDigitsLength = allDigitsInString.length;

  for (let rotateDigits = allDigitsLength; rotateDigits >= 2; rotateDigits -= 1) {
    allDigitsInString = rotateRighMostDigits(allDigitsInString, rotateDigits);
  }

  if (allDigitsInString[0] === '0') {
    allDigitsInString.shift();
  }

  return parseInt(allDigitsInString.join(''), 10);
}

//console.log(rotateRighMostDigits([3,2,9,1,7,5], 4))  // [3,2,1,7,5,9]
//console.log(rotateArray([4,5,2]))  // [5,2,4]

console.log(maxRotation(735291));          // 321579

console.log(maxRotation(3));               // 3
console.log(maxRotation(35));              // 53
console.log(maxRotation(105));             // 15 -- the leading zero gets dropped
console.log(maxRotation(8703529146));      // 7321609845

/*
7 35291 => 352917  (rotate n === 6)
3 52917 => 3 29175 (n - 1)
32 9175 => 32 1759 (n -2)
321 759 => 321 597 (n -3)
3215 97 => 3215 79 (n - 4)

*/