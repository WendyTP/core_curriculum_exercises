/*
15:32 - 16:32
input: an integer
  invalid input: negative or zero? non-integer type?  --> return 'invalid input'
output: an integer (feature number) or error message
rules:
  - feature num: odd num && multiple of 7 && all digits appear once
  - largest possible featured number is 9876543201
  - if an arg is > larget feat. num ||  if it's multiples of 7 > feat. num
      - error message (no feat. num)
data: number
algo:
  - get to the closet previous multiple of 7:
      - arg - (arg % 7)
  - if new arg is odd:
      - continue add 14 (break if num > largest num)
        - check if all digits occur once
          - if yes, stop iterate, and return new fea num
        - if not, continue the loop
  - if ne arg is even: 
      - continue add 7 (break if num > largest num)
        - check if all digits occur once
    - check if all digits occur once:
      String(num), iterate each char, push char to an array. if char already exist in array, return false
      
*/

function featured(number) {
  let largestFeatureNum = 9876543201;

  if (number >= largestFeatureNum) {
    return 'No largest featured number!';
  }

  let multipleSeven = number - (number % 7);
  let addMultiple;
 
  if (multipleSeven % 2 !== 0) {
    addMultiple = 7 * 2;
  } else {
    addMultiple = 7;
  }

  while (multipleSeven < largestFeatureNum) {
    multipleSeven += addMultiple;
    if (digitsOccurOnce(multipleSeven)) {
      return multipleSeven;
    }
  }

  return 'No largest featured number!'
}

function digitsOccurOnce(num) {
  let digits = String(num);
  let occurence = [];

  for (let idx = 0; idx < digits.length; idx += 1) {
    if (occurence.includes(digits[idx])) {
      return false;
    }

    occurence.push(digits[idx]);
  }

  return true;
}

/*
console.log(digitsOccurOnce(21));  // true
console.log(digitsOccurOnce(11));   // false
console.log(digitsOccurOnce(35));   // true
*/


console.log(featured(12));    // 21
// 12 - (12 % 7 ) === 7
//  7 + 14 = 21
console.log(featured(20));     // 21
// 20 - (20 % 7) === 14
//  14 + 7  === 21
console.log(featured(21));    //35
console.log(featured(997));   //1029
console.log(featured(1029));   //1043
console.log(featured(999999));  // 1023547
console.log(featured(999999987));   // 1023456987
console.log(featured(9876543201))
