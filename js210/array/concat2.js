function concat(arr1, ...moreArgument) {
  let newArr = [];
  newArr = arr1.slice(0);
  
  for (let idx = 0; idx < moreArgument.length; idx += 1) {
    if (Array.isArray(moreArgument[idx])) {
      moreArgument[idx].forEach(element => newArr.push(element));
    } else {
      newArr.push(moreArgument[idx]);
    }
  }
  
  return newArr;
}

console.log(concat([1, 2, 3], [4, 5, 6], [7, 8, 9]));
console.log(concat([1, 2], 'a', ['one', 'two']));
console.log(concat([1, 2], ['three'], 4));