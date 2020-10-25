/*
12:03 - 12:17
input: positive int
output: integer >= 0
rules:
  - square of sum (ex . (1+2+3) ** 2)
  - sum of squares (ex. 1**2 + 2**2 + 3 **2)
  - square of sum - sum of square
data:
  number
algo:
  - create sum = 0
  - create sum of squares = 0
  iterate from 1 to n: 
    - compute sum of numbers
    - compute squares
  - return sum ** 2 - sum of square
*/

function sumSquareDifference(number) {
  let sum = 0;
  let squares = 0;

  for (let count = 1; count <= number; count += 1) {
    sum += count;
    squares += count ** 2;
  }

  return sum ** 2 - squares;
}

console.log(sumSquareDifference(3));      // 22 --> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
console.log(sumSquareDifference(10));     // 2640
console.log(sumSquareDifference(1));      // 0
console.log(sumSquareDifference(100));    // 25164150