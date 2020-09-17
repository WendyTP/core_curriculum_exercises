const MILLISECONDS_PER_MINUTE = 60000;
const MINUTES_PER_HOUR = 60;
const HOURS_PER_DAY = 24;
const MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR;
const FIRST_DAY = '1970-01-01';

/* first attempt
function afterMidnight(time) {
  let hours = parseInt(time.split(':')[0]);
  let minutes = parseInt(time.split(':')[1]);
  let firstDateMilliSeconds = new Date(`${FIRST_DAY} 00:00`).getTime();

  let hoursMilliSeconds = new Date(`${FIRST_DAY} 00:00`).setHours(hours);

  return (hoursMilliSeconds - firstDateMilliSeconds) / MILLISECONDS_PER_MINUTE + minutes;
}
*/

// simpler approach
function afterMidnight(time) {
  let midnight = new Date(`${FIRST_DAY} 00:00`);
  let currentTime = new Date(`${FIRST_DAY} ${time}`);

  return (currentTime.getTime() - midnight.getTime()) / MILLISECONDS_PER_MINUTE;
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