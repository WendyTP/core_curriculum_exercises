/*
 3 args: arr, begin int, end int;
 begin int and end int are >= 0;
 If the value of begin or end is greater than the length of the array, set it to equal the length
  begin -- return empty arr
  end --- return whole arr
 returns new arr containing the extracted elements starting from begin up to but not including end.
 does not mutate original arr.
*/

function slice(arr, begin, end) {
  let newArr = [];
  if (begin > arr.length) {
    begin = arr.length;
  }

  if (end > arr.length) {
    end = arr.length;
  }

  if (begin < arr.length && end > 0) {
    for (let idx = begin; idx < end; idx += 1) {
      newArr.push(arr[idx]);
      if (idx >= arr.length) {
        break;
      }
    }
  }

  return newArr;
}

console.log(slice([1, 2, 3], 1, 2));
console.log(slice([1, 2, 3], 2, 0));
console.log(slice([1, 2, 3], 5, 1));
console.log(slice([1, 2, 3], 0, 5));

const arr1 = [1, 2, 3];
console.log(slice(arr1, 1, 3));
console.log(arr1);

