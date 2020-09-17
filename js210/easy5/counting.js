function sequence(num) {
  let numbers = [];
  for (let count = 1; count <= num; count += 1) {
    numbers.push(count);
  }
  return numbers;
}

console.log(sequence(5));
console.log(sequence(3));
console.log(sequence(1));