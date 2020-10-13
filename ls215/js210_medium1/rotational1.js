/*
15:30 - 15:52 
input: an array, can be empty
  invalid input:  non-array ==> return undefined
  empty array: return empty array
output: a new array with the rotated elements (original array not mutated)

rules:
  - rotation: move the first element to the end of array
  - array can contin any data type (mixed as well)
Data:
  - array
algo:
  - validate input
  - 
    - slice array from 2nd idx till last 
    - add the first element to the sliced array
    - return this new array
*/

function rotateArray(arr) {
  if (!Array.isArray(arr)) {
    return undefined;
  }

  if (arr.length === 0) {
    return arr;
  }

  return arr.slice(1).concat(arr[0]);
}



console.log(rotateArray([7, 3, 5, 2, 9, 1]));       // [3, 5, 2, 9, 1, 7]
console.log(rotateArray(['a', 'b', 'c']));          // ["b", "c", "a"]
console.log(rotateArray(['a']));                    // ["a"]
console.log(rotateArray([1, 'a', 3, 'c']));         // ["a", 3, "c", 1]
console.log(rotateArray([{ a: 2 }, [1, 2], 3]));    // [[1, 2], 3, { a: 2 }]
console.log(rotateArray([]));                       // []


// return `undefined` if the argument is not an array
console.log(rotateArray());                         // undefined
console.log(rotateArray(1));                        // undefined


// the input array is not mutated
const array = [1, 2, 3, 4];
console.log(rotateArray(array));                    // [2, 3, 4, 1]
console.log(array);                                 // [1, 2, 3, 4]
