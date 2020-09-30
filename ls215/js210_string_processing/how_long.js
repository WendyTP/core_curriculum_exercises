/*
Question: a function that returns an aray with each word and the count of letters in the word
  - arg. a string of words separated bby single space
  - return an array of strings ex. ['apple 5', 'cat 3']
algo:
  - create an empty array
  - split string by words
  - count letters of each word
  - add the word and count to array
  - return array
*/

function wordLengths(string) {
  let result = [];

  if (string === undefined || string === '') {
    return result; 
  }

  string.split(' ').forEach(word => {
    result.push(word.concat(' ', String(word.length)));
  })

  return result;
}

console.log(wordLengths('cow sheep chicken'));
console.log(wordLengths('baseball hot dogs and apple pie'));
console.log(wordLengths("It ain't easy, is it?"));
console.log(wordLengths('Supercalifragilisticexpialidocious'));
console.log(wordLengths(''));
console.log(wordLengths());
