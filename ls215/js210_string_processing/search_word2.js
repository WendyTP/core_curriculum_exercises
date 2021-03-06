/*
Question: a function that takes a word and a string of text as arguments, returns the 
  new text with the word highlighted
  To highlight word: enclose the word wth two ** on each side, and uppercase the whole word

Algo:
  - split the text by words
  - transform the text:
    - if the word matches the searched word, transform it
  - return the transformed text
*/

function searchWord(word, text) {
  return text.split(' ').map(currentWord => {
    if (isMatched(word, currentWord)) {
      return '**'.concat(currentWord.toUpperCase(), '**');
    } else {
      return currentWord;
    }
  }).join(' ');
}

function isMatched(givenMatch, word) {
  let matchPattern = new RegExp(`\\b${givenMatch}\\b`, 'i');
  return word.match(matchPattern);
}

let text = 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?';
console.log(searchWord('sed', text))

