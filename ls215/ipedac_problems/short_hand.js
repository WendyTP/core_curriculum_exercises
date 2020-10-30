/*
10:35 - 12: 42 (2h 17)
13:17 - 13: 52 (35)
input: string (contain digits and special chars)
  invalid input: non string; string contain other chars; empty string
output: array of numbers
rule:
  - possible separators are: ["-", ":", ".."]
  - range: - or : 
  - numbers always increase
  - range inclusive
data:
  array of string to numbers
algo:
  - separate string by ',' ==> arr of strings ['1', '1-3']
  - separate substringg by range chars (: or - or ..)  ==> ['1', ['1', '3']]
  - create result arr [];
  - iterate string arr:
    - if item is array ==> proceed range extend
    - else: 
      - transform string to number
      - set last number to be arr[0] or last number in result (if result is not empty)
      - if current number < last number:
          - last number + 1 + 1 until new number ends with current number
      - push new number (or non-changed number) to result arr
  - range array:
    - transform string to numer
    - set last number to be range[0] or last number in result (if result is not empty)
    - iterate/ transform range numbers:
      - if current number < last number:
        - last number + 1 + 1... until new number ends with current number
      - last number to be current number
      - return transformed number
    - push number to result arr, from range[0] to last item in range
  
*/

function extendNumbers(stringNums) {
  let result = [];
   let splitNums = stringNums.split(',').map(str => {
    if (/\D/.test(str)) {
      return createRange(str);
    } else {
      return str;
    }
  })
  let lastNumber = splitNums[0];

  splitNums.forEach(nums => {
    if (Array.isArray(nums)) {
      let extendedResult = extendRangeNumbers(nums, result);
      let lastDigitInRange = extendedResult[extendedResult.length -1];

      for (let count = extendedResult[0]; count <= lastDigitInRange; count += 1) {
        result.push(count);
      }
    } else {
        nums = parseInt(nums, 10);
        if (nums < lastNumber) {
          nums = findMatchingNumber(nums, lastNumber);
        }
        lastNumber = nums;
        result.push(nums);
    }
  })

  return result
  

}

function createRange(string) {
  return string.replace(/(\.{2}|\:|\-)/g, ',').split(',');
}

function extendRangeNumbers(rangeArr, resultArr) {
  let rangeNums = rangeArr.map(digit => parseInt(digit, 10));
  let lastNumber = resultArr.length === 0 ? rangeNums[0] : resultArr[resultArr.length - 1];

  return rangeNums.map((digit, idx) => {
    if (digit < lastNumber) {
      let matchingPattern = rangeArr[idx];
      digit = findMatchingNumber(matchingPattern, lastNumber);
    }

    lastNumber = digit;
    return digit;
  })
}

function findMatchingNumber(pattern, lastNumber) {
  let newDigit = lastNumber;

  while (true) {
    newDigit += 1;
    if (String(newDigit).endsWith(pattern)) {
      break;
    }
  }

  return newDigit;
}

//console.log(extendRangeNumbers(['1', '3'], [])) // [1 ,3]
//console.log(extendRangeNumbers(['1', '5', '2'], [])) // [1,5,12]
//console.log(extendRangeNumbers(['64', '11'], [545]))  // [564, 611]

//console.log(findMatchingNumber(1, 3))  // 11
// console.log(findMatchingNumber(64, 545))  // 564




// separate by ,
console.log(extendNumbers('1,3,7,2,4,1'));  // 1 , 3, 7, 12, 14, 21
// [1, 3, 7]
// 2 < 7, so 2 + 10 => 12 ; 12 > 7, [1,3,7,12]
// 1 < 14, so 1 + 10 + 10 => 21

// separate by , and - (range)
console.log(extendNumbers('1-3,1-2'));    //  1, 2, 3, 11, 12
// 1-3, 1-2 ==> [[1,3], [1,2]]
// 1-3 ==> [1,2,3]
// 1-2 ==> [1, 2] ==> [1+ 10, 2 + 10]

// separate by, and ..(range)
console.log(extendNumbers('1..3,1..2'));    //  1, 2, 3, 11, 12
// 1..3, 1..2 ==> [[1,3], [1,2]]
// 1..3 ==> [1,2,3]

// separate by :(range)
console.log(extendNumbers('1:5:2'));      //  1, 2, 3, 4, 5, 6, ... 12
// 1:5:2 ==> [[1, 5 , 2]]
// [1, 5 , 2] ==> [1, 5, 12]
// [1,5,12] ==> from 1 to 12 ==> [1,2,3,,,12]
console.log(extendNumbers('104-2'));     //  104, 105, ... 112
// 104-2 ==> [[104,2]]
// 2 < 104 , so 104 + 1 + 1... until 112 % 10 === 2
// [104, 112] ==> from 104 to 112 ==> [104, 105,... 112]
console.log(extendNumbers('104-02'));    //  104, 105, ... 202
// 104-02 ==> [[104, 2]]

console.log(extendNumbers('545,64:11'));   // 545, 564, 565, .. 611
// '545, 64:11' ==> [545, [64,11]]
// 64 < 545, so 545 + 1 + 1... until number ends with '64' ==> 564
// 11 < 564, so 564 + 1 + 1... until number ends with '11' ==> 611
// [564, 611] ==> from 564 to 611 ==> [564, 565, ... 611]
