/*
Question: Write a function that takes a grocery list (a two-dimensional array),
  with each element containing a fruit and a quantity.
return: a one-dimensional array of fruits, in which each fruit appears a number of times equal to its quantity.
Algo:
  - transform the 2-d array into 1-d array:
    - iterate through each subarray, and return the transformes subarray
      - repeate the fruit by qunatity given
*/

function buyFruit(fruits) {
  return fruits.map(fruitAndQuantity => {
    return repeateNames(fruitAndQuantity)
  }).flat();
}

function repeateNames(arr) {
  let result = [];

  for (let idx = 0; idx < arr[1]; idx += 1) {
    result.push(arr[0]);
  }

  return result;
}


console.log(buyFruit([['apple', 3], ['orange', 1], ['banana', 2]]))