function union(arr1, arr2) {
  let result = [];
  copyNonDuplicate(result, arr1);
  copyNonDuplicate(result, arr2);
  return result;
}


function copyNonDuplicate(resultArr, arr) {
  arr.forEach((element) => {
    if (!resultArr.includes(element)) {
      resultArr.push(element)
    }
  });
}

console.log(union([1, 3, 5], [3, 6, 9]));