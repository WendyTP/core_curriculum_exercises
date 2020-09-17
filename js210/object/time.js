const MINUTE_PER_HOUR = 60;
const HOUR_PER_DAY = 24;
const MINUTE_PER_DAY = MINUTE_PER_HOUR * HOUR_PER_DAY;

function timeOfDay(deltaMinutes) {
  deltaMinutes = deltaMinutes % MINUTE_PER_DAY;

  if (deltaMinutes < 0) {
    deltaMinutes = deltaMinutes + MINUTE_PER_DAY;
  }

  let hours = Math.floor(deltaMinutes / MINUTE_PER_HOUR);
  let minutes = deltaMinutes % MINUTE_PER_HOUR;

  return `${padWithZeros(hours, 2)}:${padWithZeros(minutes, 2)}`;
}

function padWithZeros(number, length) {
  let numberString = String(number);
  if (numberString.length < length) {
    numberString = `0${numberString}`;
  }
  return numberString;
}

console.log(timeOfDay(0));
console.log(timeOfDay(-3));
console.log(timeOfDay(35));
console.log(timeOfDay(-1437));
console.log(timeOfDay(3000));
console.log(timeOfDay(800));
console.log(timeOfDay(-4231));