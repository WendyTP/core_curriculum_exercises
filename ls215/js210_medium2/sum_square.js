/*
16:57- 17: 20
input: positive integer
  invalid input: non-positive int, non-integer type
output: integer >= 0
rules:
  - first n inte. ==> includes n
  - positive int. starts from 1
  - square of sum ex. n =3 ==> (1 + 2 + 3) ** 2 === 36
  - sum of squares ex. n =3 ==> 1**2 + 2**2 + 3**2 === 14
  - difference : 36 - 14 === 12
data: num / array of numbers
algo:
  get all numbers :
  - arr = [];
    - num = 1
    - iterate n times:
      - num pushed into arr
      - num += 1
  
  square of sum:
    - reduce the arr to get the sum , then square it
  sum of square:
    - transfrom each num, then add them all up
  return square  - sum
*/

function sumSquareDifference(n) {
  let numbers = allPositiveIntegers(n);

  let squareOfSum = computeSquareOfSum(numbers);
  let sumOfSquares = computeSumOfSquare(numbers);

  return squareOfSum - sumOfSquares;
}

function allPositiveIntegers(n) {
  let result = [];
  let number = 1;
  for (let count = 1; count <= n; count += 1) {
    result.push(number);
    number += 1;
  }
  return result;
}

function computeSquareOfSum(arrOfNumbers) {
  let sum = arrOfNumbers.reduce((sum, num) => sum + num);
  return sum ** 2;
}

function computeSumOfSquare(arrOfNumbers) {
  let squares = arrOfNumbers.map(num => num ** 2);
  return squares.reduce((sum, num) => sum + num);
}

//console.log(allPositiveIntegers(3)) // [1,2,3]
//console.log(allPositiveIntegers(10)) // [1,2,...8.9.10]
//console.log(computeSquareOfSum([1,2,3])) // 36
//console.log(computeSumOfSquare([1,2,3])) // 14



console.log(sumSquareDifference(3));      // 22 --> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
console.log(sumSquareDifference(10));     // 2640
console.log(sumSquareDifference(1));      // 0
console.log(sumSquareDifference(100));    // 25164150


