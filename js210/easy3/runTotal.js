/*
function runningTotal(numbers) {
  let sumArr = [];
  let sumResult = 0;
  
  numbers.forEach((num) => {
    sumResult = sumResult + num;
    sumArr.push(sumResult);
  })

  return sumArr;
}
*/

function runningTotal(numbers) {
  let sumResult = 0;

  return numbers.map((num) => {
    return sumResult += num;
  })
}


console.log(runningTotal([2, 5, 13]));
console.log(runningTotal([14, 11, 7, 15, 20]));
console.log(runningTotal([3]));
console.log(runningTotal([]));