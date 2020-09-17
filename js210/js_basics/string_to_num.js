/*
'4321' turns to number 4321
- turn to array of string
- loop through array of numbers 0 -9, if number converting to string matches the given string,
- add the number * 10 ** (arr length - 1) to sum
- return sum
*/

function stringToInteger(string) {
  let arrStr = string.split('');
  let nums = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
  let foundNum = []
  let arrStrLength = arrStr.length;

  let result = arrStr.reduce((accu, letter) => {
   

    foundNum = nums.filter((num) => {
      return String(num) === letter;
    });
    
    arrStrLength = arrStrLength - 1
    
    return accu + (foundNum[0] * (10**(arrStrLength)))

    }, 0);
    
    return result;
 
}

console.log(stringToInteger('4321')); 
console.log(stringToInteger('570'));
console.log(stringToInteger('0'));

