/*
11:56 - 12:02 (6)
12:13 - 12:48 (35)
input: plain text (string); keyword (letters, either upper or lowercases)
output: encrypted text (vigenere cipher)
rules:
  -split text by length of keyword, each letter match to a letter in keyword
  -the split doesn't include non-alphabets
  - keword letter idx as the shift value (count from 0 --> 0 to 25 a - z)
  - encrypt letter using caesar cipher (subletteridx = (text letter idx + shift value) % 26)
  - keyword letter case doens't count ==> plain text is uppercase, then cipher text is uppercase
data:
  -alpabet lookup string 'ABCD...Z'
  - array of keyword shift values ex . [2, 24, 13, 1]
  - input string
algo:
  - create alphabet look up 
  - comput the shift value of each letter of keywords (transform each letter to a number)
  - create encrypted result = ''
  - let keyword shift value = 0;
  - iterate string, one char a time:
    - if char is alphabet:
      - find idx of char, comput the sub char (using shift value)
      - if char is lowercase, transfom sub char to uppercase
    - if (keyword shiftvalue > keyword.length -1), then shiftvalue = 0, otherwise: keyword shiftvalue += 1
    - if non char, then sub char is char
    - concat char to result
  - return encrypted result
*/

const ALPHABETS = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

function vigenereEncrypt(plainText, keyword) {
  let shiftValues = keyword.split('').map(char => ALPHABETS.indexOf(char.toUpperCase()));
  let encryptedText = '';
  let currentShiftValueIdx = 0;

  for (let idx = 0; idx < plainText.length; idx += 1) {
    let substituedLetter;

    if (/[a-zA-Z]/.test(plainText[idx])) {
      substituedLetter = encryptLetter(plainText[idx], shiftValues[currentShiftValueIdx]);

      if (/[a-z]/.test(plainText[idx])) {
        substituedLetter = substituedLetter.toLowerCase();
      }

      if (currentShiftValueIdx >= shiftValues.length - 1) {
        currentShiftValueIdx = 0;
      } else {
        currentShiftValueIdx += 1;
      }

    } else {
      substituedLetter = plainText[idx];
    }

    encryptedText += substituedLetter;
  }

  return encryptedText;
}

function encryptLetter(letter, shiftValue) {
  let letterIdx = ALPHABETS.indexOf(letter.toUpperCase());
  let subLetterIdx = (letterIdx + shiftValue) % ALPHABETS.length;
  return ALPHABETS[subLetterIdx];
}

//console.log(encryptLetter('a', 3))  // 'D'


console.log(vigenereEncrypt('Happy Friday!', 'meat'))
// Teppk Jrbpey!
/*
Happ yFri day
meat meat mea
Tepp kJrb pey
*/

console.log(vigenereEncrypt("Pineapples don't go on pizzas!", 'meat')) 
// Bmnxmtpeqw dhz'x gh ar pbldal!

/*
plaintext : Pine appl esdo ntgo onpi zzas
shift     : meat meat meat meat meat meat
ciphertext: Bmnx mtpe qwdh zxgh arpb ldal

*/