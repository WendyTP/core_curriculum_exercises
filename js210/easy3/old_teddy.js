function getRandomInt(min, max) {
  [min, max] = min > max ? [min, max] : [max, min];
  minInt = Math.ceil(min);   // 3.3  => 3; 5 => 5
  maxInt = Math.floor(max);  // 4.4 => 4; 5 => 5

  return Math.round(Math.random() * (maxInt - minInt) + minInt);
}

let randomAge = getRandomInt(2, 5)

console.log(`Teddy is ${String(randomAge)} years old!`)
