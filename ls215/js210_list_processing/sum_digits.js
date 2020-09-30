/*
Question: Write a function that takes one argument, a positive integer, and returns the sum of its digits. 
Algo:
  turn integer to a string number
  turn string number to array of string numbers
  transform string numbers to numbers
  add up all numbers
*/

function sum(number) {
  let arrayOfNumbers = number.toString(10).split('');
  return arrayOfNumbers.reduce((sum, num) => {
    return sum + parseInt(num, 10);
  }, 0)

  //return arrayOfNumbers;
}


console.log(sum(23));
console.log(sum(496));
console.log(sum(123456789));