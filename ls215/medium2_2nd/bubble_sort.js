/*
14:54 - 15: 17
input: array
output: mutated array (sorted)

rules:
  - array contain at least 2 items  (numbers or strings)
  - sort items in arr from small to large
  - bubble sort:
    - iterate through arr (from idx = 0 to arr.length - 2):
      - check current idx and idx + 1
          - if idx > idx + 1, then swap
    - if an iteration is complete without any swap, finish sort
data:
  array
algo:
  let swap = false;
  do
    swap = false
    iterate arr from idx 0 to arr.length - 2:
      if idx 0 > idx 1, then swap 2 items
      swap = true;
  while swap === true
      
  swap 2 items in arr:
    temp = arr[0];
    arr[1] = arr[0];
    arr[0] = temp

*/


function bubbleSort(arr) {
  let swap = false;

  do {
    swap = false;
    for (let idx = 0; idx < arr.length - 1; idx += 1) {
      if (arr[idx] > arr[idx + 1]) {
        swapElements(arr, idx);
        swap = true;
      }
    }
  } while (swap === true)

  return arr;
}


function swapElements(array, idx) {
  let temp = array[idx + 1]; 
  
  array[idx + 1] = array[idx];   
  array[idx] = temp;  
}



/*
let arr = [4,3]
console.log(swapElements(arr, 0))
console.log(arr)
*/


const array1 = [5, 3];
bubbleSort(array1);
console.log(array1);    // [3, 5]

const array2 = [6, 2, 7, 1, 4];
bubbleSort(array2);
console.log(array2);    // [1, 2, 4, 6, 7]

const array3 = ['Sue', 'Pete', 'Alice', 'Tyler', 'Rachel', 'Kim', 'Bonnie'];
bubbleSort(array3);
console.log(array3);    // ["Alice", "Bonnie", "Kim", "Pete", "Rachel", "Sue", "Tyler"]
