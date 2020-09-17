/*
leap yr:
yr % 400 === 0;
yr $ 4 === 0 && yr % 100 !== 0

*/

function isLeapYear(year) {
  if (Number.isInteger(year) && year > 0) {
    if (year % 400 === 0 || (year % 4 === 0 && year % 100 !== 0)) {
      return true;
    } else {
      return false;
    }
  } else {
    return 'unvalid input';
  }
}

console.log(isLeapYear(2016))
console.log(isLeapYear(2015))
console.log(isLeapYear(2100))
console.log(isLeapYear(2400))
console.log(isLeapYear(240000))
console.log(isLeapYear(240001))
console.log(isLeapYear(2000))
console.log(isLeapYear(1900))
console.log(isLeapYear(1752))
console.log(isLeapYear(1700))
console.log(isLeapYear(1))
console.log(isLeapYear(100))
console.log(isLeapYear(400))
