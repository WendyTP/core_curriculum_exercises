/*
16:03- 16:20
input: array with 0 or more items
  invalid input:  return undefined
  empty arr: return empty arr
output: array with first item to last
rules: 
  - not mutate oiriginal arr
  - move first item to last
data: array
algo:
validate input:
  if input is not array, return undefined
  slice arr from idx 1 to last, then concat with arr[0]
*/

function rotateArray(arr) {
  if (!Array.isArray(arr)) {
    return undefined;
  }

  return arr.slice(1).concat(arr.slice(0,1));
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