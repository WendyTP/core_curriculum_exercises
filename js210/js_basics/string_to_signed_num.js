/*
a funtion takes a string digits (with/without + - sign), return integer number
assume the string will always contain a valid number.
+ or no sign --> positive int
- sign --> negative int
*/

/* first approach
function stringToSignedInteger(stringDigits) {
  let sign;
  if (stringDigits[0] === '-' || stringDigits[0] === '+') {
    sign = stringDigits[0]
    stringDigits = stringDigits.slice(1);
  }

  if (sign === '-') {
    return -Number(stringDigits);
  } else {
    return Number(stringDigits);
  }
}
*/

function stringToSignedInteger(string) {
  switch (string[0]) {
    case '-': return Number(string.slice(1));
    case '+': return Number(string.slice(1));
    default: return Number(string);
  }
}


let num = '+100'
console.log(stringToSignedInteger('4321'));
console.log(stringToSignedInteger('-570'));
console.log(stringToSignedInteger(num));

console.log(num)