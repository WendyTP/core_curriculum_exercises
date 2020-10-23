/*
17:12 - 17:25
1,1,2,3,5

*/


function fibonacci(nth) {
  if (nth <= 2) {
    return 1;
  }
  let fiboNums = [1,1];

  for (let count = 2; count < nth; count += 1) {
    fiboNums[count] = fiboNums[count -1] + fiboNums[count - 2];
  }

  return fiboNums.slice(-1)[0];

}


console.log(fibonacci(1));       // 1
console.log(fibonacci(2));       // 1
console.log(fibonacci(3));       // 2
console.log(fibonacci(4));       // 3
console.log(fibonacci(5));       // 5
console.log(fibonacci(12));      // 144
console.log(fibonacci(20));      // 6765