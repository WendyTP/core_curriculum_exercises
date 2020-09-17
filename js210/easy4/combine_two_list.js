function interLeave(arr1, arr2) {
  let combinedArr = [];

  for (let idx = 0; idx < arr1.length; idx += 1) {
    combinedArr.push(arr1[idx], arr2[idx]);
  }

  return combinedArr;
}

console.log(interLeave([1, 2, 3], ['a', 'b', 'c']));