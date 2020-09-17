
const DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];

function integerToString(number) {
  let result = '';
  
  do {
    let remainder = number % 10;
    number = Math.floor(number / 10);

    result = DIGITS[remainder] + result;
  } while (number > 0)
  
  return result;
}

function signedIntegerToString(number) {
  let absoluteNum = Math.abs(number);
  let stringNum = integerToString(absoluteNum);

  if (number > 0) {
    return '+' + stringNum;
  } else if (number < 0) {
    return '-' + stringNum;
  } else {
    return stringNum;
  }
}

console.log(signedIntegerToString(4321));
console.log(signedIntegerToString(-123));
console.log(signedIntegerToString(0));