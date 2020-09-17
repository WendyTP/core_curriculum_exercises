function push(arr, ...args) {
  if (args.length !== 0) {
    for (let idx = 0; idx < args.length; idx += 1) {
      arr[arr.length] = args[idx];
    }
  }
  return arr.length;
}

const array2 = [1, 2, 3];
console.log(push(array2, 4, 5, 6))
console.log(array2);
console.log(push([1, 2], ['a', 'b']))
console.log(push([], 1))
console.log(push([]))