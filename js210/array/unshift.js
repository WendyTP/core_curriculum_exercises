/*
accept multiple arguments (1 arr minimum)
add extra elements to start of arr
return new length of arr
mutate original arr
*/

/*
function unshift(...arguments) {
  let arr = arguments[0]
  arr.reverse()
  for (let idx = 1; idx < arguments.length; idx += 1) {
    arguments[0].push(arguments[idx]);
  }
  arr.reverse();
  return arr.length;
}
*/

function unshift(...arguments) {
  let arr = arguments[0];
  for (let idx = 1; idx < arguments.length; idx += 1) {
    arr.splice(0, 0, arguments[idx]);
  }

  return arr.length;
}

console.log(unshift([1, 2, 3], 5, 6));
console.log(unshift([1, 2, 3]));
console.log(unshift([4, 5], [1, 2, 3]));

let testArr = [1,2,3]
console.log(unshift(testArr, 5,6));
console.log(testArr);