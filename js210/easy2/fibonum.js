/*
1 1 2 3 5 8 13 21
Write a function that calculates and returns the index of the first Fibonacci number that has the number of digits
specified by the argument. (The first Fibonacci number has an index of 1.)

assume that the argument is always an integer greater than or equal to 2.
*/

function findFibonacciIndexByLength(numOfDigits) {
  let idx = 2;
  let previousFibNum = 1;
  let lastSecondFibNum = 1;
  let currentFibNum;

  do {
    currentFibNum = previousFibNum + lastSecondFibNum;
    lastSecondFibNum = previousFibNum;
    previousFibNum = currentFibNum;
    idx += 1;
  } while (String(currentFibNum).length < numOfDigits);

  return idx;
}

console.log(findFibonacciIndexByLength(2));
console.log(findFibonacciIndexByLength(10));
console.log(findFibonacciIndexByLength(16));