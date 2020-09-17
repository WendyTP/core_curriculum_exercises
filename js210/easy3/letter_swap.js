function swap(stringOfWords) {
  let swappedWords = stringOfWords.split(' ').map(word => swapFirstAndLastLetters(word));
  return swappedWords.join(' ');
}



function swapFirstAndLastLetters(word) {
  let wordLength = word.length;
  let middleLetters = word.split('').slice(1, wordLength - 1).join('');

  if (wordLength > 1) {
    return word[wordLength - 1] + middleLetters + word[0];
  } else {
    return word;
  }
}

console.log(swap('Oh what a wonderful day it is'));
console.log(swap('Abcde'));
console.log(swap('A'));