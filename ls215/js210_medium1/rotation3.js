/*
11:04 - 12:13  
input: an integer
  invalid input: non integer and non positive 
output: maximum rotation of the integer

rules:
total: n digits (ex. 6)
1:first digit to end: 735291 ==> 7 35291 ==> 35291 7 ==> 352917   (rotate n digits)
2: keep 1 digit (rotate last n -1 digits (5)) and rotate remaining (first digit to end) ==> (3) 5 2917  => (3) 2917 5 ==> 329175
3. keep 2 digits (rotate last n -2 digits (4)) and rotate remaining ==> (32) 9 175 => (32) 175 9 => 321759
4. keep 3 digits (rotate last n - 3 digits (3)): 321597
4. keep 4 digits (n-1) (rotate last n - 4 digits (2): 321579
5. keep 5 digits (rotate last n-5 (1)): 321579

data structure: an array of string numbers 
algo:
  - validate input
  - rotate the first digit to end
      - slice array from idx 1 til end , then concat with 0 idx
  - iterate through array, start from counting idx = (n - 1) digits, after each iteration, idx -=1, until idx > n - n
    - split array : rotate array = array.slice(-idx) ; remaining array = array.slice(0, arr.length - idx)
    - rotate the rotate array
    - concate remaining array with the rotated array
  - if idx 0 item is '0', remove it
  - joint the string numbers, then transform to integer
  
*/

function maxRotation(integer) {
  if (!Number.isInteger(integer) || integer <= 0) {
    return 'invalid input!'
  }

  let stringNums = String(integer).split('');

  for (let rotateDigits = stringNums.length; rotateDigits > 0; rotateDigits -= 1) {
    stringNums = rotateRightMostDigits(stringNums, rotateDigits);
  }

  if (stringNums[0] === '0') {
    stringNums.shift();
  }

  return parseInt(stringNums.join(''), 10);
}


function rotateRightMostDigits(arr, digits) {
  let unchangedPart = arr.slice(0, arr.length - digits);
  let rotatePart = arr.slice(-digits);
  
  return unchangedPart.concat(rotateArray(rotatePart))
}


function rotateArray(arr) {
  return arr.slice(1).concat(arr[0]);
}

/*
console.log(rotateRightMostDigits(['1', '2', '3', '4'], 4))  // 2341
console.log(rotateRightMostDigits(['1', '2', '3', '4'], 3))  // ['1', '3', '4', '2]
console.log(rotateRightMostDigits(['1', '2', '3', '4'], 2))  // 1243
console.log(rotateRightMostDigits(['1', '2', '3', '4'], 1)) //1234

//console.log(rotateArray(['1','2','3']))  // ['2', '3', '1']
*/


console.log(maxRotation('we'))  // invalid input
console.log(maxRotation(-3))    // invalid input

/*
console.log(maxRotation(735291));  // 321579
console.log(maxRotation(3));     // 3
console.log(maxRotation(35));    // 53 ==> 5 3
console.log(maxRotation(105));   // 051  => 0 51 => 0 15 => 015 => drop 0 => 15
console.log(maxRotation(8703529146)); // 7321609845
*/