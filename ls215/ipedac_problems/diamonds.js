/*
17:30 - 17: 59
input: positive odd integer n
output: n strings of space and *
rules:
  - n lines of strings
  - each string: space and *
  middle line: n stars (idx 0)
  upper: space = n - stars;  each side: space / 2;   n - 2 * 1 stars  (idx 1)  ==> spaces + stars + spaces
        n - 2 * 2  (idx 2)
        n - 2 * 3 (idx 3)
        n - 2 * 4  (idx 4)     Math.floor(n / 2)
  bottom: reverse of upper parts
data: 
  each line : string
  all lines: array of strings
algo:
  array of n lines of diamonds
  middle line: n * stars
  create upper part:
    create array of upper part = [];
    iterate from 1 to idx (n / 2):
      create stars: n - 2 * idx  * star
      create space: n - number of stars, devide by 2 
      concat space + stars + space
      unshift to upper part
  create lower part:
    reverse upper part
  add upper part , middle line, lower part to all lines array, remove inner array, then join each line by \n
*/

function diamond(number) {
  let star = '*';
  let space = ' ';
  let allLines = [];
  let middleLine = star.repeat(number);
  let upperLines = [];

  for (let idx = 1; idx < number / 2; idx += 1) {
    upperLines.unshift(createLineOfStar(star, space, number, idx));
  }

  let lowerLines = upperLines.slice().reverse();
  
  allLines.push(upperLines, middleLine, lowerLines);

  console.log(allLines.flat().join('\n'));
  
}

function createLineOfStar(star, space, number, idx) {
  let totalStars = number - (2 * idx);
  let spaceOnEachSide = (number - totalStars) / 2; 
  return space.repeat(spaceOnEachSide) + star.repeat(totalStars) + space.repeat(spaceOnEachSide);
}




//diamond(1);
//diamond(3);
//diamond(5);
diamond(9)
