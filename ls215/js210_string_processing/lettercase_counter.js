function letterCaseCount(string) {
  let result = {
    lowercase: 0,
    uppercase: 0,
    neither: 0,
  };

  for (let idx = 0; idx < string.length; idx += 1) {
    if (/[a-z]/.test(string[idx])) {
      result.lowercase += 1;
    } else if (/[A-Z]/.test(string[idx])) {
      result.uppercase += 1;
    } else {
      result.neither += 1;
    }
  }

  return result;
}


console.log(letterCaseCount('abCdef 123'));
console.log(letterCaseCount('AbCd +Ef'));
console.log(letterCaseCount('123'));
console.log(letterCaseCount(''));