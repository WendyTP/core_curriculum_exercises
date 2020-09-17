function digitList(number) {
  let splittedNum = String(number).split('')

  return splittedNum.map((stringDigit) => parseInt(stringDigit, 10));
}


console.log(digitList(12345));
console.log(digitList(7));
console.log(digitList(375290));
console.log(digitList(444));