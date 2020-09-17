/*
Write a function that returns the number provided as an argument multiplied by two, 
unless the argument is a double number; return double numbers as-is.
double number: even-length digits; left === right;
*/

function isDoubleNumber(num) {
  let stringNum = String(num);
  if (stringNum.length % 2 !== 0) {
    return false;
  }
  let center = (stringNum.length) / 2;
  let firstPart = stringNum.slice(0, center);
  let secondPart = stringNum.slice(center);
  
  if (firstPart !== secondPart) {
    return false;
  }

  return true;
}

function twice(num) {
  if (isDoubleNumber(num)) {
    return num;
  } else {
    return num * 2;
  }
} 


console.log(twice(37));
console.log(twice(44));
console.log(twice(334433));
console.log(twice(444));
console.log(twice(107));
console.log(twice(103103));
console.log(twice(3333));
console.log(twice(7676));
