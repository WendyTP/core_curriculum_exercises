/*
16:43 - 17: 21 (38)
input: integer (number of switch)
  invalid input: non- integer ; non-positive integer
output: array of integers (lights that are on)
rules:
  - n lights , n passes
  - lights off (begin)
  - 1st pass: all lights switched
  - 2nd pass: multiple of 2
  - 3rd : multiple of 3
  - nth : mu.. of n
  - each light: on or off
data: {1: on, 2: off...}
      [1, 2, 3...]
algo:
  - create n lights, with value of 'false' (light off)
  - iterate (from 1 to n):
      switch lights
  - select all lights that have value of 'true'

  - swith lights (lights, currentpass):
    select lights to be switched
    iterate through the selcted, !value

*/

function lightsOn(switches) {
  let allLights = {};

  for (let light = 1; light <= switches; light += 1) {
    allLights[String(light)] = false;
  }

  for (let currentPass = 1; currentPass <= switches; currentPass += 1) {
    switchLights(allLights, currentPass);
  }

  let lightsStillOn = Object.keys(allLights).filter(light => allLights[light] === true)
  return lightsStillOn.map(light => parseInt(light, 10))
}


function switchLights(lights, pass) {
  let lightNumberings = Object.keys(lights).map(light => parseInt(light, 10));
  let lightsToSwitch = lightNumberings.filter(light => light % pass === 0);

  lightsToSwitch.forEach(light => {
    lights[String(light)] = !lights[String(light)];
  })

  return lights;
}


/*
let allLights = {1: false, 2: false, 3: false, 4: false,}
console.log(switchLights(allLights, 2))
*/



console.log(lightsOn(5));        // [1, 4]
// Detailed result of each round for `5` lights
// Round 1: all lights are on
// Round 2: lights 2 and 4 are now off;     1, 3, and 5 are on
// Round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
// Round 4: lights 2 and 3 are now off;     1, 4, and 5 are on
// Round 5: lights 2, 3, and 5 are now off; 1 and 4 are on

console.log(lightsOn(100));      // [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]
