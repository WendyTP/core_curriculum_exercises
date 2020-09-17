function isPalindrome(text) {
  let comparedText = '';
  for (let idx = text.length - 1; idx >= 0; idx -= 1) {
    comparedText = comparedText + text[idx];
  }

  return text === comparedText;
}

console.log(isPalindrome('madam'));
console.log(isPalindrome('Madam'));
console.log(isPalindrome("madam i'm adam"));
console.log(isPalindrome('356653'));