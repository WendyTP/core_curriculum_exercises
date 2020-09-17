/*
  mutate original array
  3 mandatory arg : array, start idx, deleteCount
  1 or more optional args: elements (to be added)
  return new arr containing deleted elements or empty arr if no element is deleted
*/

function splice(array, start, deleteCount, ...elements) {
  let deletedElements = [];

  if (start > array.length) {
    start = array.length;
  }
  if (deleteCount > array.slice(start).length) {
    deleteCount = array.slice(start).length;
  }

  let arrayCopy = array.slice(0);
  let elementCount = elements.length;
  let newLength = array.length + elementCount - deleteCount;
  array.length = newLength;  // [1 ,2 ,3, empty]

  for (let i = 0; i < elementCount; i += 1) {
    array[start + i] = elements[i];     // start = 1; [1,2,3]  => [1, 'a', 2, 3]
  }

  let copyBackCount = array.length - (start + deleteCount); // 4 - (1 + 1) = 2
  for (let i = 0; i < copyBackCount; i += 1) {
    array[start + elementCount + i] = arrayCopy[start + deleteCount + i];
    // i = 0  array[1 + 1 + 0]  = arrayCopy[1+1+0] => array[2] = arrayCOpy[2] => 3
  }

  return arrayCopy.slice(start, start + deleteCount);

} 


splice([1, 2, 3], 1, 2);              // [2, 3]
splice([1, 2, 3], 1, 3);              // [2, 3]
splice([1, 2, 3], 1, 0);              // []
splice([1, 2, 3], 0, 1);              // [1]
splice([1, 2, 3], 1, 0, 'a');         // []

const arr2 = [1, 2, 3];
splice(arr2, 1, 1, 'two');             // [2]
arr2;                                  // [1, "two", 3]

const arr3 = [1, 2, 3];
splice(arr3, 1, 2, 'two', 'three');    // [2, 3]
arr3;                                  // [1, "two", "three"]

const arr4 = [1, 2, 3];
splice(arr4, 1, 0);                    // []
splice(arr4, 1, 0, 'a');               // []
arr4;                                  // [1, "a", 2, 3]

const arr5 = [1, 2, 3];
splice(arr5, 0, 0, 'a');               // []
arr5;                                  // ["a", 1, 2, 3]