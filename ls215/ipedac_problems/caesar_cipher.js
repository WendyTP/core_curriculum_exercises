/* 11:05 - 11: 43 (38 mins)
input: plain text (string) ; key (integer >= 0)
output: encrypted plain text
rules:
  letter substitued by another letter (shift value)
  if shift value + letter exceed length of alphabet (26), wraps from beginning
    ex: 'y' (24th); 24+ 5(key)= 29; 29 -26 = 3 ==> d (3rd, counting from 0)
  encrypt only alphabets
  keep case (upper => upper)
data: look up alphabets string 
      input as string
algo:
  - create alphabets 'ABCD...Z'
  - create empty string (result) = ''
  - iterate the input one char at a time:
    if char is letter
      - find the idx of uppercased letter from alphabets; comput to get the sub letter
      - if char is lowercase
      - transfform sub letter back to lowecase
    else:
      - return char as it is
    concat sub char to empty string
  - return result string
*/

const ALPHABETS = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

function caesarEncrypt(text, key) {
  let encryptedText = '';

  for (let idx = 0; idx < text.length; idx += 1) {
    let substituedLetter;
    if (/[a-zA-Z]/.test(text[idx])) {
      substituedLetter = encryptLetter(text[idx], key);

      if (/[a-z]/.test(text[idx])) {
        substituedLetter = substituedLetter.toLowerCase();
      }

    } else {
      substituedLetter = text[idx];
    }
    
    encryptedText += substituedLetter;
  }

  return encryptedText;
}




function encryptLetter(letter, shiftValue) {
  let letterIdx = ALPHABETS.indexOf(letter.toUpperCase()) // 0
  let subLetterIdx = (letterIdx + shiftValue) % ALPHABETS.length;
  return ALPHABETS[subLetterIdx];
}

// simple shift
console.log(caesarEncrypt('A', 0));       // "A"
console.log(caesarEncrypt('A', 3));       // "D"
// a (1st); (1 + 3) % 26 === 4th ===> d

// wrap around
console.log(caesarEncrypt('y', 5));       // "d"
// y (25th); (25 + 5) % 26 === 4th ==> d
console.log(caesarEncrypt('a', 47));      // "v"
// a (1st); (1 + 47) % 26 === 22th ==> v



// all letters
console.log(caesarEncrypt('ABCDEFGHIJKLMNOPQRSTUVWXYZ', 25));
// "ZABCDEFGHIJKLMNOPQRSTUVWXY"
console.log(caesarEncrypt('The quick brown fox jumps over the lazy dog!', 5));
// "Ymj vznhp gwtbs ktc ozrux tajw ymj qfed itl!"

// many non-letters
console.log(caesarEncrypt('There are, as you can see, many punctuations. Right?; Wrong?', 2));
// "Vjgtg ctg, cu aqw ecp ugg, ocpa rwpevwcvkqpu. Tkijv?; Ytqpi?"
