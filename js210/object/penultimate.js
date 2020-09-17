function penultimate(string) {
  let words = string.split(' ');
  return words[words.length -2];
}

console.log(penultimate('last word'));
console.log(penultimate('Launch School is great!'));