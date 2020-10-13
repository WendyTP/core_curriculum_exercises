/*
17:00 -17: 51
input: a string
  invalid input:  non string type => invalid input!
                  no number word => return the chars as it is.
outpuit: another string with digits and chars
rule:
  
  - transform every number word to its digit (string) char.
  - keeps the dots with the digit (if it was there before)
  - assume special char is either at beginning or end of word ex. 'hey,' ; 'yes'
  - all other chars remain unchaged
  - number word ==> case sensitive?  ==> case insensitive
  - number word : zero --- nine
data:
  - object number words {'zero': 0, 'one': 1}
  - input: an array of words 
algo:
  - validate input
  - split input by space
  - iterate through array input, and transform it:
    - if a word inclues non-letter: 
        separate the non-letter char on the side (save to var.)
        remove non-letter char from word
    check if the word (all lowercase) matches the number word
        if yes:
          - return the number 
        if not:
          - return the word as it is
    - adds back non-letter char if there's any
  - join all words back by space
*/

const NUMBER_WORDS = {
  'zero': 0, 'one': 1, 'two': 2, 'three': 3, 'four': 4,
  'five': 5, 'six': 6, 'seven': 7, 'eight': 8, 'nine': 9,
};


function wordToDigit(string) {
  if (typeof string !== 'string') {
    return 'invalid input!';
  }

  let words = string.split(' ');

  return words.map(word => {
    let specialChar = '';

    if (word.slice(-1).match(/[^a-z]/)) {
      specialChar = word.slice(-1);
      
      word = word.slice(0, word.length - 1);
    }
    
    if (numberWordsIncludesWord(word)) {
      word = String(NUMBER_WORDS[word.toLowerCase()]);
    }
    
    return word.concat(specialChar);
  }).join(' ')
}

function numberWordsIncludesWord(word) {
  return Object.keys(NUMBER_WORDS).includes(word.toLowerCase());
}


//console.log(wordToDigit());  // invalid input

console.log(wordToDigit('please four.'))  // 'please 4.'

console.log(wordToDigit('Please call me at five five five one two three four. Thanks.'));
// "Please call me at 5 5 5 1 2 3 4. Thanks."

console.log(wordToDigit('The weight is done.'))
// "The weight is done."