/*
accept one arg. - array
returns the first element (removed)
returns undefined if argument is empty arr
mutate original arr
*/

/*
function shift(arr) {
  let shiftedElement = arr.reverse().pop();
  arr.reverse();
  return shiftedElement;
}
*/

function shift(arr) {
  let result;

  if (arr.length !== 0) {
    result = arr.splice(0,1).pop();
  }

  return result;
}

console.log(shift([1, 2, 3]));
console.log(shift([]));
console.log(shift([[1, 2, 3], 4, 5]));

let testArr = [1,2,3]
console.log(shift(testArr));
console.log(testArr);
