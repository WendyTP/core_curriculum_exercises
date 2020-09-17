function wordSizes(words) {
  let countResult = {};
  if (words.length < 1) {
    return countResult;
  } else {
    words.split(' ').forEach((word) => {
      if (Object.keys(countResult).includes(String(word.length))) {
        countResult[String(word.length)] += 1;
      } else {
        countResult[String(word.length)] = 1;
      }
    })
  
    return countResult;
  }
}

console.log(wordSizes('Four score and seven.'));
console.log(wordSizes('Hey diddle diddle, the cat and the fiddle!'));
console.log(wordSizes("What's up doc?"));
console.log(wordSizes(''));