/*
Question: write a function that takes two arrays of numbers, 
  returns a new array containing  the products of all combinations of number pairs that exist between the two arrays.
return: ascending numbers in new array
both arguments are not empty array
Algo:
  iterate each element in first array
    - each iteration, iterate through all elements in 2nd array
    - push product to new array
*/

/* first try
function multiplyAllPairs(arr1, arr2) {
  let products = [];

  arr1.forEach(num => {
    arr2.forEach(arr2Num => {
      products.push(num * arr2Num);
    })
  })

  return products.sort((a,b) => a - b);
}
*/

function multiplyAllPairs(arr1, arr2) {
  let allProducts = arr1.map(num => {
    return arr2.map(arr2num => {
      return num * arr2num;
    })
  }).flat();

  return allProducts.sort((a,b) => a - b);
}

console.log(multiplyAllPairs([2, 4], [4, 3, 1, 2]))