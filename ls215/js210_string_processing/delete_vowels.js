
function removeVowels(arrayOfString) {
  return arrayOfString.map(string => {
    return string.replace(/[aeiou]/ig, '');
  })
}

console.log(removeVowels(['abcdefghijklmnopqrstuvwxyz']));
console.log(removeVowels(['green', 'YELLOW', 'black', 'white']));
console.log(removeVowels(['ABC', 'AEIOU', 'XYZ']));
