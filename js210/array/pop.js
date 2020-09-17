function pop(arr) {
  let poppedElements = [];
  if (arr.length === 0) {
    return undefined;
  } else {
    poppedElements.push(arr[arr.length -1]);
    arr.length = arr.length - 1;
  }
  return poppedElements;
}

const array1 = [1, 2, 3];
console.log(pop(array1));
console.log(array1);  
console.log(pop([]));
console.log(pop([1, 2, ['a', 'b', 'c']]));