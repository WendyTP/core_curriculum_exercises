/*
14:28 - 15: 41 (1h 12)
  encoding
  input: a string of words (separate by space), rail fence number
  output: encrypted string (no space)
rules:
ex. rail fence number = 3 
ex. a string of 25 letters ==> 25 dots on each rail

#1 W . . . E . . . C . . . R . . . L . . . T . . . E
#2 . E . R . D . S . O . E . E . F . E . A . O . C .
#3 . . A . . . I . . . V . . . D . . . E . . . N . .
 
1 letter: line 1, idx 1  ; line 2 & line 3 => fill with dot
2 letter: line 2, idx 2
3 letter: line 3, idx 3
4 letter: line (3 - 1), idx 4   ( line > 3, then decrease: line -= 1)
5 letter: line (3 - 2), idx 5
6 letter: line 2         (line < 1, then increase: line += 1)

current line

data: array of strings (ex. 3 rail fences)
algo:
  - remove all space from input string
  - create an array with n array, filled with input.length dots
  - set current line = arr[0];
  - set increase = true;
  - iterate through input:
    current line[current idx] = letter
    
    if (line idx === arr.length - 1), then increase = false
    if (line idx === 0), then increase = true

    if (increase), then line idx += 1
    else, then line idx -= 1
  - transform the arr:
    - remove dots from each rail fence
  - join the 3 lines in arr to become a string
*/

function railEncoding(plainText, railFenceNum) {
  let allLetters = plainText.replace(/\s/g, '');
  let railFences = createRailFences(allLetters, railFenceNum);

  let filledRailFences = fillLetterToFences(railFences, allLetters);

  return filledRailFences.map(railLine => {
    return railLine.join('').replace(/[.]/g, '' )
  }).join('');
}

function fillLetterToFences(railFences, allLetters) {
  let currentRailIdx = 0;
  let increase = true;

  
  for (let letterIdx = 0; letterIdx < allLetters.length; letterIdx += 1) {
    railFences[currentRailIdx][letterIdx]= allLetters[letterIdx];
    
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

//console.log(createRailFences('WEARE', 3))

let message = 'WE ARE DISCOVERED FLEE AT ONCE'
console.log(railEncoding(message, 3)) // WECRLTEERDSOEEFEAOCAIVDEN
//console.log(message) // 'WE ARE DISCOVERED FLEE AT ONCE'