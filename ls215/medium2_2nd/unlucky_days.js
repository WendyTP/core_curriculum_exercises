/*
10:06 - 10:25
input: year (integer > 1753)
  invalid input: non integer
output: integer (>= 0) (count of Friday 13th in that year)
rules:
  - 12 months 
  - 13th / month
data: 
  - date obj
  - counter : 0
algo:
  - create counter = 0
  - create a date obj with given yr, jan, 13th
  - while month <= 12th month:
    - if date obj 's day is friday
      - counter += 1
    - date obj increase 1 month
  - return counter
*/

function fridayThe13ths(year) {
  let counter = 0;
  let month = 0;
  let date13th = new Date(year, month, 13, 8);
  
  while (month <= 11) {
    if (date13th.getDay() === 5) {
      counter += 1;
    }
    month += 1;
    date13th.setMonth(month);
  }

  return counter;

}


console.log(fridayThe13ths(1986));      // 1
console.log(fridayThe13ths(2015));      // 3
console.log(fridayThe13ths(2017));      // 2
