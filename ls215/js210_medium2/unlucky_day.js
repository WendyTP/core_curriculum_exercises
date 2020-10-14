/* 
33 min
input: a number as year (> 1752);
output: a number >= 0
rule:
  - check every 13th day of the month, to see if it's a friday
  - 12 months
  - 7 days in week
data:
  - counter: integer
  - date obj 
algo:
  - create a new date obj, with the arg. year and 13th jan
  - intialise a counter = 0
  - check if that date is friday
    - if yes, counter+= 1
  - continue iterete to Feb... Dec
  - return counter
*/


function fridayThe13ths(year) {
  let dateThirteenth = new Date(year, 0, 13);
  let counterThirteen = 0;

  let month = 0;
  while (month <= 11) {
    if (dateThirteenth.getDay() === 5) {
      counterThirteen += 1;
    }
    month += 1;
    dateThirteenth.setMonth(month);
  }
  return counterThirteen;

}


console.log(fridayThe13ths(1986));      // 1
console.log(fridayThe13ths(2015));      // 3
console.log(fridayThe13ths(2017));      // 2