function asciiValue(string) {
  let sum = 0;
  for (let idx = 0; idx < string.length; idx += 1) {
    sum += string[idx].charCodeAt();
  }

  return sum;
}

console.log(asciiValue('Four score'));
console.log(asciiValue('Launch School'));
console.log(asciiValue('a'));
console.log(asciiValue(''));
