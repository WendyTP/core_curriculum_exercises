
/*
array1 = [[1, 2, 3], [4, 5, 6], [7, 8, 9]];
col [0, 2] ==> [[1, 4, 7], [3, 6, 9]]
result = []

i = 0 / j = 0
result[0] = [];
result : [[1]]

i = 0/ j = 1
result[1] = [];
result: [[1], [2], [3]] // if j <= cols.length
[[1], [4], [7]]  // if numbers[j][cols[i]]
result[i = 0] => [[]]   // if result[i] = [];
result[i][j] => result[0][0] => [[1,4,7], [2]]

for (var i = 0, length = cols.length; i < length; i += 1) {
    for (var j = 0, length = number.length; j < length; j += 1) {
      if (!result[i]) {
        result[i] = [];
      }

      result[i][j] = numbers[j][cols[i]];
    }
  }

  return result;
}

i = 0 
result = [[]] => [[1,4,7], [3,6,9 ]]

i = 0
result = [[]] => [[1, 4, 7]]

*/

function getSelectedColumns(numbers, cols) {
  var result = [];


  for (let i = 0, length = cols.length; i < length; i += 1) {
   
    for (let j = 0, length = numbers.length; j < length; j += 1) {
      if (!result[i]) {
        result[i] = [];
      }

      result[i][j] = numbers[j][cols[i]];
      
    }
   
  }

  return result;
}

// given the following arrays of number arrays
const array1 = [[1, 2, 3], [4, 5, 6], [7, 8, 9]];
const array2 = [[1, 2, 3], [1, 2, 3], [1, 2, 3]];

// `array1` in row/column format
// [[1, 2, 3],
//  [4, 5, 6],
//  [7, 8, 9]]

console.log(getSelectedColumns(array1, [0]));
console.log(getSelectedColumns(array1, [0, 2]));
console.log(getSelectedColumns(array2, [1, 2]));