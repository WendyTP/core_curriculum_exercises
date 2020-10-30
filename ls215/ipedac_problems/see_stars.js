/*
21:08 - 21:47  (39)
input: odd integer (n x n grid) >= 7
output: n x strings of star and space
rules:
  - n is odd  => n lines
  - middle line: n stars
  - other lines: 3 stars (n - 3) spaces
example - n = 7:
1st line: 1s, 2sp, 1s, 2sp 1s  
2nd line: 1sp, 1s, 1sp, 1s, 1sp, 1s, 1sp
3rd line: 2sp, 3st, 2sp 
middle : 7 s

#1: * / / * / / *   (star idx 1, spaces until idx 4 which is star; opposit after star)
#2: / * / * / * /   
#3: / / * * * / /

middle line
reversed upper parts

data:
  array of star lines
  each line: arr of star and space
algo:
  - create an array for all lines []
  - middle line: n stars
  - create an array for upper lines ( floor n / 2)
      - iterate from idx 1 to idx n /2:
        - create a single line 
        - push to th upper line arr
  - create an arry for bottom lines (reversed of upper lines)
  - push upper line, middle, bottom line to all line arr, then join by \n
        - single line 
          create right array
          (iterate from idx 1 to floor n/2)
            if current idx, add star
            else: add space
          create left side array (reversed right side arr)
          add right + middle + left, turn to string
        
*/

function star(nGrid) {
  let space = ' ';
  let star = '*';
  let allLines = [];
  let middleLine = star.repeat(nGrid);
  let upperLines = [];
  
  for (let line = 1; line <= Math.floor(nGrid / 2); line += 1) {
    upperLines.push(ceateSingleLine(star, space, line, nGrid));
  }

  let bottomLines = upperLines.slice().reverse();

  allLines.push(upperLines, middleLine, bottomLines);

  console.log(allLines.flat().join('\n'))
  
}


function ceateSingleLine(star, space, lineNumber, nGrid) {
  let fullLine = [];
  let leftSide = [];
  
  for (let idx = 1; idx <= Math.floor(nGrid / 2); idx += 1) {
    if (idx === lineNumber) {
      leftSide.push(star);
    } else {
      leftSide.push(space);
    }
  }

  let rightSide = leftSide.slice().reverse();

  fullLine.push(leftSide, '*', rightSide);

  return fullLine.flat().join('');
}

/*
console.log(ceateSingleLine('*', '?', 1, 7))
console.log(ceateSingleLine('*', '?', 2, 7))
console.log(ceateSingleLine('*', '?', 3, 7))
*/


//star(7);
star(9)