function showMultiplicativeAverage(arr) {
  let product = arr.reduce((currentProduct, num) => currentProduct * num, 1);

  let average = product / (arr.length);
  return String(average.toFixed(3));
}

console.log(showMultiplicativeAverage([3, 5]));
console.log(showMultiplicativeAverage([2, 5, 7, 11, 13, 17]));