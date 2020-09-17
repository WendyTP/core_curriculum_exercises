function sequence(count, startNum) {
  let sequenceResult = [];
  for (let startCount = 1; startCount <= count; startCount += 1) {
    sequenceResult.push(startNum * startCount);
  }
  return sequenceResult;
}

console.log(sequence(5, 1));
console.log(sequence(4, -7));
console.log(sequence(3, 0));
console.log(sequence(0, 1000000));