/*
  2 arrays containing same values, even in different order, are 
  considered equal.
  assume no array or object within each array. Only primitive values
  
  number of values must be the same,
  sort copy of each array and compare the sorted result
*/

function areArraysEqual(arr1, arr2) {
  if (arr1.length !== arr2.length) {
    return false;
  }

  let sortedArr1Copy = arr1.slice(0).sort();
  let sortedArr2Copy = arr2.slice(0).sort();
  //console.log(sortedArr2Copy)
  //console.log(sortedArr1Copy)
  
  for (let idx = 0; idx < sortedArr1Copy.length; idx += 1) {
    if (sortedArr1Copy[idx] !== sortedArr2Copy[idx]) {
      return false;
    }
  }
  return true;
}

console.log(areArraysEqual([1, 2, 3], [1, 2, 3]))
console.log(areArraysEqual([1, 2, 3], [3, 2, 1]));
console.log(areArraysEqual(['a', 'b', 'c'], ['b', 'c', 'a']));
console.log(areArraysEqual(['1', 2, 3], [1, 2, 3]));
console.log(areArraysEqual([1, 1, 2, 3], [3, 1, 2, 1]));
console.log(areArraysEqual([1, 2, 3, 4], [1, 1, 2, 3]));
console.log(areArraysEqual([1, 1, 2, 2], [4, 2, 3, 1]));
console.log(areArraysEqual([1, 1, 2], [1, 2, 2]));
console.log(areArraysEqual([1, 1, 1], [1, 1]));
console.log(areArraysEqual([1, 1], [1, 1]));