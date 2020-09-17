const MINUTES_PER_HOUR = 60;
const HOURS_PER_DAY = 24;
const MINUTES_PER_DAY = MINUTES_PER_HOUR * HOURS_PER_DAY;

function afterMidnight(timeInString) {
  let hours = Number(timeInString.split(':')[0]);
  let minutes = Number(timeInString.split(':')[1]);

  return hours * MINUTES_PER_HOUR + minutes;
}

function beforeMidnight(timeInString) {
  let deltaTime = MINUTES_PER_DAY - afterMidnight(timeInString);

  if (deltaTime === MINUTES_PER_DAY) {
    deltaTime = deltaTime - MINUTES_PER_DAY;
  }

  return deltaTime;
}

console.log(afterMidnight('00:00'));
console.log(beforeMidnight('00:00'));
console.log(afterMidnight('12:34'));
console.log(beforeMidnight('12:34'));
console.log(afterMidnight('24:00'));
console.log(beforeMidnight('24:00'));




