/*
1 to 20
98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).
multiple of 3 or 5
*/

function multisum(number) {
  let sum = 0;
  for (let num = 1; num <= number; num += 1) {
    if (num % 3 === 0 || num % 5 === 0) {
      sum += num;
    }
  }
  return sum;
}

console.log(multisum(3));
console.log(multisum(5));
console.log(multisum(10));
console.log(multisum(1000));

