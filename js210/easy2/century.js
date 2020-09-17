/*
1st 21st 31st...(11th)
2nd 22nd 32nd... (12th)
3rd 23rd 33rd 43rd... (13th)

*/

const YEARS_PER_CENTURY = 100;

function century(year) {
  let centuryYr = Math.floor(year / YEARS_PER_CENTURY);
  let remainder = year % YEARS_PER_CENTURY;
  if (remainder !== 0) {
    centuryYr += 1;
  }

  return String(centuryYr) + centurySuffix(centuryYr);
}

function centurySuffix(century) {
  let lastDigit = century % 10;
  let remainderOfHundred = century % 100;
  
  if (lastDigit === 1 && remainderOfHundred !== 11) {
    return 'st';
  } else if (lastDigit === 2 && remainderOfHundred !== 12) {
    return 'nd';
  } else if (lastDigit === 3 && remainderOfHundred !== 13) {
    return 'rd';
  } else {
    return 'th';
  }
}

//console.log(centurySuffix(101))

console.log(century(2000));
console.log(century(2001));
console.log(century(1965));
console.log(century(256));
console.log(century(5));
console.log(century(10103));
console.log(century(1052));
console.log(century(1127));
console.log(century(11201));