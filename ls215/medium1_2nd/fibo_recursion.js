/*
12:08 - 12:15
input: positve integer (nth Fibo number)
output: return the number that is the nth Fibo number
rules:
  fibo: 1, 1, (1 + 1), (1 + 2), (2 + 3)...(n-2 + n-1)
  recursion:
    It calls itself at least once.
It has an ending condition — e.g., if (n === 1), in the sum function above.
The results of each recursion are used in each step — e.g., n + sum(n - 1) uses sum(n - 1).
*/

function fibonacci(nth) {
  if (nth <= 2) {
    return 1;
  }

  return fibonacci(nth - 2) + fibonacci(nth - 1);

  
}

console.log(fibonacci(1));       // 1
console.log(fibonacci(2));       // 1
console.log(fibonacci(3));       // 2
console.log(fibonacci(4));       // 3
console.log(fibonacci(5));       // 5
console.log(fibonacci(12));      // 144
console.log(fibonacci(20));      // 6765