function isPalindromNumber(num) {
  let comparedNum = createReversedNumber(num);
  return num === comparedNum;
}

function createReversedNumber(num) {
  let StringNum = String(num);
  let reversedStringNum = StringNum.split('').reverse().join('');
  return parseInt(reversedStringNum, 10);
}

console.log(isPalindromNumber(34543));
console.log(isPalindromNumber(123210));
console.log(isPalindromNumber(22));
console.log(isPalindromNumber(5));