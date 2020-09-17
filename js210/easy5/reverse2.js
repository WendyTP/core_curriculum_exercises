function reverseWords(sentence) {
  let words = sentence.split(' ');
  let reversedResult = [];
  
  words.forEach((word) => {
    let currentWord = word;
    if (word.length >= 5) {
      currentWord = reverseLetters(word);
    }
    reversedResult.push(currentWord);
  })

  return reversedResult.join(' ');
}

function reverseLetters(word) {
  return word.split('').reverse().join('');
}

console.log(reverseWords('Professional'));
console.log(reverseWords('Walk around the block'));
console.log(reverseWords('Launch School'));