/*
determin which string is longer
concat short + long + short
return new string
*/

function shortLongShort(string1, string2) {
  let long = string1;
  let short = string2;
  if (string1.length < string2.length) {
    [long, short] = [string2, string1]
  }

  return short + long + short;
} 

console.log(shortLongShort('abc', 'ed'))
console.log(shortLongShort('gf', 'wefqe'))