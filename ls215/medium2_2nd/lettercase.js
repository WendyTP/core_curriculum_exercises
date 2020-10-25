/*
18:01 - 18: 21
input: a string (non empty)
  - invalid input: non string -- 'invalid input'
output: an object

rules:
  - 3 keys : strings 
  - values : strings (percentage)
  - percentage: 2 digits after point. (ex. '0.00')
data: input: string
      object for compute
algo:
  - validate input 
  - create an object {lowercase: 0, uppercase,...} for sum of char count
  - iterate string:
    - if char is a-z, lowerase += 1
    ...
  - iterate through object by its keys, transform each value to string percentage:
    - percentage : current value / string length; 
    - transform to string with 2 digits after point
  - return object

*/

function letterPercentages(string) {
  if (typeof string !== 'string') {
    return 'invalid input!'
  }

  let countResult = {lowerase: 0, uppercase: 0, neither: 0};

  for (let idx = 0; idx < string.length; idx += 1) {
    if (/[a-z]/.test(string[idx])) {
      countResult['lowerase'] += 1;
    } else if (/[A-Z]/.test(string[idx])) {
      countResult['uppercase'] += 1;
    } else {
      countResult['neither'] += 1;
    }
  }

  Object.keys(countResult).forEach(charType => {
    let percentage = countResult[charType] / string.length * 100;
    countResult[charType] = percentage.toFixed(2);
  })

  return countResult;
}

//console.log(letterPercentages(1233))   // 'invalid input'

console.log(letterPercentages('abCdef 123'));  // 5, 1, 4
// { lowercase: "50.00", uppercase: "10.00", neither: "40.00" }

console.log(letterPercentages('AbCd +Ef'));   //3, 3, 2
// { lowercase: "37.50", uppercase: "37.50", neither: "25.00" }

console.log(letterPercentages('123'));  // 0, 0, 3
// { lowercase: "0.00", uppercase: "0.00", neither: "100.00" }