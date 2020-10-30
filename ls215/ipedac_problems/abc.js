/*
18:50 - 19: 15
input: string (only alphabets?)
output: true / false
rules:
  - case insensitive
  - spelling blocks has two letters per block
  - each block can be used once, no both letters
data: spelling block: array of strings
      input: string
algo:
  - create spelling block array
  - create another array [] (used blocks)
  - iterate through string:
      - iterate through spelling block
          select the block that includes the given char
      - if used blocks contains spelling block, return false
       else push spelling block to used block
  - return true
*/

const SPELLING_BLOCKS = ['BO', 'XK', 'DQ', 'CP', 'NA', 'GT', 'RE',
                         'FS', 'JW', 'HU', 'VI', 'LY', 'ZM']

function isBlockWord(word) {
  let usedBlocks = [];

  for (let idx = 0; idx < word.length; idx += 1) {
    let matchedBlock = findSpellingBlock(word[idx]);

    if (usedBlocks.includes(matchedBlock)) {
      return false;
    } else {
      usedBlocks.push(matchedBlock);
    }
  }

  return true;
}

function findSpellingBlock(alphabet) {
  return SPELLING_BLOCKS.filter(block => block.includes(alphabet.toUpperCase()))[0];
}


//console.log(findSpellingBlock('a'))


console.log(isBlockWord('BATCH'));      // true
console.log(isBlockWord('BUTCH'));      // false
console.log(isBlockWord('jest'));       // true
console.log(isBlockWord('floW'));  // t
console.log(isBlockWord('APPLE'));  // f
console.log(isBlockWord('apple'));  // f
console.log(isBlockWord('apPlE'));  // f
console.log(isBlockWord('Box'));   // f