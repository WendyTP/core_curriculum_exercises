
const MILLISECONDS_PER_MINUTE = 60000;

function timeOfDay(deltaMinutes) {
  let midnight = new Date('August 24, 2020 00:00');
  let aftermidnight = new Date(midnight.getTime() + deltaMinutes * MILLISECONDS_PER_MINUTE);
  let hours = aftermidnight.getHours();
  let minutes = aftermidnight.getMinutes();

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