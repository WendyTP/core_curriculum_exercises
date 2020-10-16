/*
13:55 -
input: array (contain at least 2 elements)
output: sorted array

rules:
  - n itegers ==> iterate (n -1) times 
  - each iteration, compare current idx && idx + 1 
  - if idx > idx + 1 ==> swap positiions
   stop iteration when one round no swap
  - mutate given arg.
  - sort from small to big; a - z
data: array 
algo:
  - while true: 
    let original arr = arr.slice()
    - from idx 0 iterate upto arr.length - 1:
      -  if idx > idx + 1 : arr[idx] = original arr[idx+1]; arr[idx+1] = original arr[idx]
    - if original arr === arr, break the outer loop
  - return mutated array
  - 
*/

function bubbleSort(arr) {

  while (true) {

    let swapped = false;

    for (let idx = 0; idx < arr.length - 1; idx += 1) {
      if (arr[idx] > arr[idx + 1]) {
        let sortedPart = arr.slice(idx, idx + 2).reverse(); 
        arr[idx] = sortedPart[0];
        arr[idx + 1] = sortedPart[1];
        swapped = true;
      }
    }
    if (!swapped) {
      break;
    }
    
  }


}


const array1 = [5, 3];
bubbleSort(array1);
console.log(array1);    // [3, 5]

const array2 = [6, 2, 7, 18, 4];
bubbleSort(array2);
console.log(array2);    // [1, 2, 4, 6, 7]

//26147


const array3 = ['Sue', 'Pete', 'Alice', 'Tyler', 'Rachel', 'Kim', 'Bonnie'];
bubbleSort(array3);
console.log(array3);    // ["Alice", "Bonnie", "Kim", , "Pete", "Rachel", "Sue", "Tyler"]