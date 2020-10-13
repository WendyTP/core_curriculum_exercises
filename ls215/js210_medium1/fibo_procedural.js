/*
18:32 - 18: 50
rule:
  - avaScript can accurately compute intergers up to 16 digits long; meaning 
     that fibbonacci(78) is the largest Fibbonacci number that you can accurately compute with simple operations in JavaScript.
  - use non recursion to compute the nth fibo number
  - fibo number: 1, 1, (1 + 1), (1 + 2).... ; F(n) = F(n - 1) + F(n - 2) where n > 2
algo:
  - if nth <= 2; return 1
  - array of fibos [0,1,1]
  - nth = 3 : arr[3] = arr[2](n-1) + arr[1](n-2)
    nth = 5: 
      iterate from idx 3 to 5:
        arr[idx] = arr[idx -1] + arr[idx -2]
    return arr[5]    

*/
/* first attempt
function fibonacci(nth) {
  let fiboNumbers = [1,1];
  for (let idx = 2; idx < nth; idx += 1) {
    fiboNumbers[idx] = fiboNumbers[idx -1] + fiboNumbers[idx -2];
  }
  return fiboNumbers[nth - 1]
}
*/

// given solution
function fibonacci(nth) {
  let previousTwo = [1, 1];

  for (let counter = 3; counter <= nth; counter += 1) {
    previousTwo = [previousTwo[1], previousTwo[0] + previousTwo[1]];
  }

  return previousTwo[1];
}



console.log(fibonacci(12));      // 144
//console.log(fibonacci(20));  // 6765
//console.log(fibonacci(50));    // 12586269025
//console.log(fibonacci(75));    // 2111485077978050