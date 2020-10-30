/*
15:42 - 16:05
decode a rail-fence-encoded message
input: encrypted message , railfenceNum
output: decrypted message(rows of rail fences)
rules:
  ex. encrypted message: 'WECRLTEERDSOEEFEAOCAIVDEN'
  step 1:
  ? . . . ? . . . ? . . . ? . . . ? . . . ? . . . ?
  . ? . ? . ? . ? . ? . ? . ? . ? . ? . ? . ? . ? .
  . . ? . . . ? . . . ? . . . ? . . . ? . . . ? . .
  step 2:
  W . . . E . . . C . . . R . . . L . . . T . . . E
  . ? . ? . ? . ? . ? . ? . ? . ? . ? . ? . ? . ? .
  . . ? . . . ? . . . ? . . . ? . . . ? . . . ? . .
  step 3: 
   2nd row takes "ERDSOEEFEAOC"
   step 4: 3rd row takes "AIVDEN" 

  result:
  W . . . E . . . C . . . R . . . L . . . T . . . E
  . E . R . D . S . O . E . E . F . E . A . O . C .
  . . A . . . I . . . V . . . D . . . E . . . N . .

algo:
  create array of encrypted message 
  create array of railfenceNum of inner array, filled with dots
  iterate through message:
    fill right spot with '?'
  iterate/ transform through each rail:
    iterate/ transform through each chars:
    - if rail[idx] === ?, then shift one letter from arry of encrypted message
  
*/

function decodeRailFencedText(codedMessage, railfenceNum) {
  let messageChars = codedMessage.split('');
  let railFences = createRailFences(codedMessage, railfenceNum);
  
  let filledRailFences = fillSignToFences(railFences, codedMessage, '?');

  return filledRailFences.map(railLine => {
    return railLine.map(char => {
      if (char === '?') {
        char = messageChars.shift();
      }
      return char;
    }).join('');
  })
}

function fillSignToFences(railFences, allLetters, tempSign) {
  let currentRailIdx = 0;
  let increase = true;

  
  for (let letterIdx = 0; letterIdx < allLetters.length; letterIdx += 1) {
    railFences[currentRailIdx][letterIdx]= tempSign;
    
    if (currentRailIdx === railFences.length - 1) {
      increase = false;
    } else if (currentRailIdx === 0) {
      increase = true;
    }

    if (increase) {
      currentRailIdx += 1;
    } else {
      currentRailIdx -= 1;
    }
  }

  return railFences;
}

function createRailFences(string, num) {
  let result = [];
  let railBase = '.'
  
  for (let count = 1; count <= num; count += 1) {
    let allDots = railBase.repeat(string.length);
    result.push(allDots.split(''));
  }
  return result;
}


let encryptedText = 'WECRLTEERDSOEEFEAOCAIVDEN';
console.log(decodeRailFencedText(encryptedText, 3));
//console.log(encryptedText);