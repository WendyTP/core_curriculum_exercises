/*
Question: capitalize every word in a given string
  - arg: a string of words (non-whitsespace)
  - return a new string
Algo:
  - split string to words
  - transform each word with first letter uppercase and rest lowercase
  - return transformed string
*/

function wordCap(string) {
  return string.split(' ').map(word => {
    return word[0].toUpperCase().concat(word.slice(1).toLowerCase());
  }).join(' ');
}

console.log(wordCap('four score and seven'));
console.log(wordCap('the javaScript language'));
console.log(wordCap('this is a "quoted" word'));