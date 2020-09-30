/*
Question: a function that swap every letter with opposite case  - lower to upper; upper to lower
 arg: a string
 return a new string
algo: 
  - transform each char of the string
    - lowercase -> uppercase
    - uppercase -> lowercase
    - neither -> unchanged
  - return transfomred string
*/

/* first try
function swapCase(string) {
  return string.split('').map(char => {
    char = char.match(/[a-z]/) ? char.toUpperCase() : char.toLowerCase();
    return char;
  }).join('')
}
*/

function swapCase(string) {
  return string.split('').map(char => {
    if (/[a-z]/.test(char)) {
      return char.toUpperCase();
    } else if (/[A-Z]/.test(char)) {
      return char.toLowerCase();
    } else {
      return char;
    }
  }).join('');
}

console.log(swapCase('CamelCase'));
console.log(swapCase('Tonight on XYZ-TV'));