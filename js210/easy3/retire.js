let rlsync = require('readline-sync');

let userAge = parseInt(rlsync.question('What is your age? '), 10);

let retireAge = parseInt(rlsync.question('At what age would you like to retire? '), 10);

let timeToRetirement = retireAge - userAge;

let currentYear = new Date().getFullYear();

console.log(`It's ${currentYear}. You will retire in ${currentYear + timeToRetirement}.`)
console.log(`You have only ${timeToRetirement} years of work to go!`)