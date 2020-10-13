/*
18:20 - 18:31

input: positive integer (nth fibo number)
output:positive integer (result of nth fibo number)

rules:
  - use recursion 
    - ending con: n < 2  ==> return 1 
    - F(n) = F(n - 1) + F(n - 2)

  - fibo: 1 1, (1 + 1), (1 + 2)...;   F(n) = F(n - 1) + F(n - 2) where n > 2
algo:
  - if nth < 2
    return 1
  - otherwise:
    F(n - 1) + F(n - 2) 
*/

function fibonacci(nth) {
  if (nth <= 2) {
    return 1;
  } else {
    return fibonacci(nth - 1) + fibonacci(nth - 2)
  }
}




console.log(fibonacci(1));       // 1
console.log(fibonacci(2));       // 1
console.log(fibonacci(3));       // 2
console.log(fibonacci(4));       // 3
console.log(fibonacci(5));       // 5
console.log(fibonacci(12));      // 144
console.log(fibonacci(20));      // 6765