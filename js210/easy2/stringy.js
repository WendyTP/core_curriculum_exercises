function stringy(num) {
  let isOne = true;
  let newStr = '';

  for (let count = 1; count <= num; count += 1) {
    newStr = isOne ? newStr + '1' : newStr + '0';
    isOne = !isOne;
  }

  return newStr
}

console.log(stringy(6));
console.log(stringy(9));
console.log(stringy(4));
console.log(stringy(7));