let rlsync = require('readline-sync');

let timesOfInputs = 6;
let givenNumbers = [];
let givenNum;


function timeWithSuffix(number) {
  let timePlussuffix = '';
  let stringNum = String(number);
  if (number === 1) {
    timePlussuffix = stringNum + 'st';
  } else if (number === 2) {
    timePlussuffix = stringNum + 'nd';
  } else if (number === 3) {
    timePlussuffix = stringNum + 'rd';
  } else {
    timePlussuffix = stringNum + 'th';
  }

  return timePlussuffix;
}


for (let time = 1; time <= timesOfInputs; time += 1) {
  if (time < timesOfInputs) {
    givenNum = parseInt(rlsync.question(`Enter the ${timeWithSuffix(time)} number: `));
    givenNumbers.push(givenNum);
  } else {
    givenNum = parseInt(rlsync.question('Enter the last number: '));
  }
}

if (givenNumbers.includes(givenNum)) {
  console.log(`The number ${String(givenNum)} appears in [${String(givenNumbers)}]`)
} else {
  console.log(`The number ${String(givenNum)} does not appears in [${String(givenNumbers)}]`)
}