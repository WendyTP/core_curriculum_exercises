/*
year 0 - 1751: leap yr: yr % 4 === 0
year 1752 onward: leap yr:
  yr % 400 === 0
  yr % 4 === 0 && yr % 100 !== 0
*/

function isLeapYear(year) {
  const FIRST_GREGORIAN_YEAR = 1752;

  if (!Number.isInteger(year) || year <= 0) {
    return false;
  }
 
  if (year < FIRST_GREGORIAN_YEAR) {
    return  year % 4 === 0; 
  } else  {
    return  year % 400 === 0 || (year % 4 === 0 && year % 100 !== 0);
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