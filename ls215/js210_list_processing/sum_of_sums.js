/*
  Question: a function that takes an array as arg., returns the sum of 
   the sums of each leading subsequence for that array.
  assume that the array always contains at least one number.
  Algo:
    
*/

function sumOfSums(arr) {
  return arr.reduce((sum, num, currentIdx) => {
    let subsequenceResult = arr.slice(0, currentIdx + 1).reduce((innerSum, element) => innerSum + element)
    return sum + subsequenceResult;
  }, 0)
}

console.log(sumOfSums([3, 5, 2]));
console.log(sumOfSums([1, 5, 7, 3]));
console.log(sumOfSums([4]));
console.log(sumOfSums([1, 2, 3, 4, 5]));
