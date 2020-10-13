/*
18:56 - 
rule: 
  refactor recursion function, by using memoization to save calls to fibonacci(nth -2);



*/
const MEMO = {};

function fibonacci(nth) {
  if (nth <= 2) {
    return 1;
  } else {
    if (MEMO[nth]) {
      return MEMO[neth];
    } else {
      MEMO[nth] = fibonacci(nth - 1) + fibonacci(nth - 2)
      return MEMO[nth];
    }
    
  }
}

// nth = 3
/*
  f(2) + f(1) => 2

  nth 4
  f(3) + f(2)
*/


console.log(fibonacci(1));       // 1
console.log(fibonacci(2));       // 1
console.log(fibonacci(3));       // 2
console.log(fibonacci(4));       // 3
console.log(fibonacci(5));       // 5
console.log(fibonacci(12));      // 144
//console.log(fibonacci(20));      // 6765