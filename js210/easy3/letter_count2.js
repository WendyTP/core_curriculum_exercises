function wordSizes(words) {
  let countResult = {};

  if (words.length < 1) {
    return countResult;
  } else {
    removeNonLetters(words).forEach((word) => {
      if (Object.keys(countResult).includes(String(word.length))) {
        countResult[String(word.length)] += 1;
      } else {
        countResult[String(word.length)] = 1;
      }
    })
  
    return countResult;
  }
}

function removeNonLetters(words) {
  return words.split(' ').map((word) => {
    return word.replace(/[^a-zA-Z]/, '');
  })
}


console.log(removeNonLetters('what!is this'))

console.log(wordSizes('Four score and seven.'));
console.log(wordSizes('Hey diddle diddle, the cat and the fiddle!'));
console.log(wordSizes("What's up doc?"));
console.log(wordSizes(''));
