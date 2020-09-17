function isRealPalindrome(text) {
  let lowercasedPureText = text.replace(/[^0-9A-Za-z]/g, '').toLowerCase();
  let comparedText = lowercasedPureText.split('').reverse().join('');
  return lowercasedPureText === comparedText;
}


console.log(isRealPalindrome('madam'));
console.log(isRealPalindrome('Madam'));
console.log(isRealPalindrome("Madam, I'm Adam"));
console.log(isRealPalindrome('356653'));
console.log(isRealPalindrome('356a653'));
console.log(isRealPalindrome('123ab321'));