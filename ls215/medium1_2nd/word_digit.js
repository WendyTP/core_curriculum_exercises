/*
11:30 - 12:00
  input: a string of words
    invalid input: empty string --> return empty string
                   non- string  --> return 'invalid input'
  output: a conveted string
  rules:
    - change number words (zero to nine ) to string digit
    - only number words to be changed, ex. 'freight' ==> 'freight'
    - keep other chars where it is 'four.' => '4.'
  data:
    number words : an array
    input: string
  algo:
    - create arry of number words
    - iterate through each number words:
      - replace all matching number words in input with the idx of number words(string form)
    - return transformed string
    match number word: new RegExp('\\b' + numberword + '\\b', 'g')

*/

function wordToDigit(string) {
  const numberWords = [ 'zero', 'one', 'two', 'three', 'four', 'five',
                         'six', 'seven', 'eight', 'nine'];


  numberWords.forEach((word, idx) => {
    let regex = new RegExp('\\b' + word + '\\b', 'g');
    string = string.replace(regex, String(idx));
  })

  return string;
}


console.log(wordToDigit('Please call me at five five five one two three four. Thanks.'));
// "Please call me at 5 5 5 1 2 3 4. Thanks."