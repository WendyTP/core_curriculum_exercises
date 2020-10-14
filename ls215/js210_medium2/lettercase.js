/*
11:33 - 12:13 (40 min)
input: a non-empty string
  invalid input: non string --> return 'invalid input!'
output: an object 3 key/value; value are string form of percentage
rule:
  - 3 key/value pairs --- lowercase, uppercase, niether(any non alphabet chars)
  - value : ex. 50% ==> '50.00'  (written in float with 2 digits after dot, assuming to round to last digit )
  - if 0% ==> '0.00'
data:
  - split input to array of chars
  - object - letter count {lowercase: 2, uppercase: 5, neither: 0}
  - total letter counts
algo:
  - validate input 
  - split input to array of chars
  - create an object for chars counts, initialize 3 keys with value of 0;
  - iterate through the array:
    - if char is a-z and uppercase, then obj[uppercase] += 1
    - if char is a-z and lowercase, then obj[lowercase] += 1
    - else: obj[neither] += 1
  - iterate through the object :
    - count percentage : value / total letter counts * 100 (float)
    - round the float to last 2 digits after dot
    - transfform the resulot to a string
    - transform the value with the new string

*/

function letterPercentages(string) {
  if (typeof string !== 'string') {
    return 'invalid input!';
  }
  
  let letterCountResult = {lowercase: 0, uppercase: 0, neither: 0,};
  let percentageResult = {lowercase: '', uppercase: '', neither: '',};
  let chars = string.split('');

  chars.forEach(char => {
    if (/[a-z]/.test(char)) {
      letterCountResult.lowercase += 1;
    } else if (/[A-Z]/.test(char)) {
      letterCountResult.uppercase += 1;
    } else {
      letterCountResult.neither += 1;
    }
  })

  Object.keys(letterCountResult).forEach(charType => {
    let percentage = letterCountResult[charType] / chars.length * 100;
    percentageResult[charType] = percentage.toFixed(2);
  })

  return percentageResult

}


//console.log(letterPercentages(12));   // 'invalid input!'

console.log(letterPercentages('abCdef 123'));
// { lowercase: "50.00", uppercase: "10.00", neither: "40.00" }
// lower: 5, upper: 1, neither: 4

console.log(letterPercentages('AbCd +Ef'));
// { lowercase: "37.50", uppercase: "37.50", neither: "25.00" }
// total 8; lower3; upper 3; ne: 2

console.log(letterPercentages('123'));
// { lowercase: "0.00", uppercase: "0.00", neither: "100.00" }
// lower 0, upper 0, niether: 3