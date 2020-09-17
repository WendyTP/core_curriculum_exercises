function reverseSentence(sentence) {
  let reversedWords = sentence.split(' ').reverse();

  return reversedWords.join(' ');
}


console.log(reverseSentence(''));
console.log(reverseSentence('Hello World'));
console.log(reverseSentence('Reverse these words'));