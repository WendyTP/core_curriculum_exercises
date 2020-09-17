/*
function crunch(string) {
  let chrunchedStr = ''

  for (let idx = 0; idx < string.length; idx += 1) {
    if (string[idx] !== string[idx + 1]) {
      chrunchedStr += string[idx];
    }
  }

  return chrunchedStr;
}
*/

function crunch(string) {
  return string.replace(/(\w)\1+/g, '$1')
}


console.log(crunch('ddaaiillyy ddoouubbllee'));
console.log(crunch('4444abcabccba'));
console.log(crunch('ggggggggggggggg'));
console.log(crunch('a'));
console.log(crunch(''));