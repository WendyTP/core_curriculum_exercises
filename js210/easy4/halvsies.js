function halvsies(arr) {
  let nestArr = [[], []];
  let middleIdxEvenArr = (arr.length / 2) - 1;      // idx 1

  let middleIdxOddArr = Math.floor(arr.length / 2);  // idx 2

  if (arr.length % 2 !== 0) {
    nestArr[0] = arr.slice(0, middleIdxOddArr + 1);    // idx 3
    nestArr[1] = arr.slice(middleIdxOddArr + 1);
  } else {
    nestArr[0] = arr.slice(0, middleIdxEvenArr + 1);    // idx 2
    nestArr[1] = arr.slice(middleIdxEvenArr + 1);
  }
  return nestArr;
}

console.log(halvsies([1, 2, 3, 4]));
console.log(halvsies([1, 5, 2, 4, 3]));
console.log(halvsies([5]));
console.log(halvsies([]));