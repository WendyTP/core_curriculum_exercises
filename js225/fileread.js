/*
input: 2 strings (difference length)
output: 1 string of all extra chars
data: string
algo:
  compare which str is longer
  compare word:
    - create new string ''
    - iterate through longer str2
      - if a char in str1 match a char in str2, skit current loop
      - if not match, pop the char from str2 to new string, compare the next char to str1 current char again
      - if str1[idx] === undefined, add rest of chars to new str
*/

function wordsDifference(str1, str2) {
  let longStrChars = str1.length > str2.length ? str1.split('') : str2.split('');
  let shortStrChars = str1.length < str2.length ? str1.split('') : str2.split('');
  let result = '';

  for (let idx = 0; idx < longStrChars.length; idx += 1) {
    if (shortStrChars[idx] === undefined) {
      result += longStrChars[idx];
    } else if (longStrChars[idx] !== shortStrChars[idx]) {
      result += longStrChars.splice(idx,1)[0];
        idx -= 1;
    } else if (longStrChars[idx] === shortStrChars[idx]) {
      continue;
    }
  }

  return result;
}

console.log(wordsDifference('good', 'bgoopdy')) // bpy
//console.log(wordsDifference('go', 'bgo'))



let str1 = 'this is a good day'
let str2 = 'this is a ggood Dday'
console.log(wordsDifference(str1, str2))  // 'gD'

let str3 = 'perfect'
let str4 = 'pperfeccct'

console.log(wordsDifference(str3, str4))  // 'pcc'


