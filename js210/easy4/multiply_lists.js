function multiplyList(arr1, arr2) {
  let mutiplyResult = [];

  for (let idx = 0; idx < arr1.length; idx += 1) {
    mutiplyResult.push(arr1[idx] * arr2[idx]);
  }
  
  return mutiplyResult;
}

console.log(multiplyList([3, 5, 7], [9, 10, 11]));