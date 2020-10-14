/*
12:16 - 12:34 (18)
18 + 14 = 32 min
input: 3 numbers (integer/ float)
  invalid input: no input or less input  ==> 'invalid input'
                 non-number input  ==> 'invalid input'
output: a string - 'equilateral', 'isosceles', 'scalene', or 'invalid'.
rules:
  - valid triangle: sum of 2 shorter sides > longest length && every side > 0
  - Equilateral: All three sides are of equal length.
  - Isosceles: Two sides are of equal length, while the third is different.
  - Scalene: All three sides are of different lengths.
data:
  - input ==> array of sides
algo:
  - validate input
  - create an array of sides, sort them by length : ==> [5,4,3]
  - valid triangle :
    - arr[1] + arr[2] > arr[0]
    - arr doesn't inlude 0
    - if not valid, return 'invalid'
  - if arr[0] === arr[1] === arr[2] 
        return 'euqi..'
  - if arr[0] === arr[1] || arr[1] == arr[2]
      return 'iso...'
  - else , return scanlene

*/


function triangle(side1, side2, side3) {
  let allSides = [side1, side2, side3];

  if (!validDataInput(allSides)) {
    return 'Invalid Input!';
  }

  allSides.sort((a,b) => b - a);

  if (allSides[2] + allSides[1] <= allSides[0] || allSides.includes(0)) {
    return 'invalid';
  } else if (allSides[0] === allSides[1] && allSides[1] === allSides[2]) {
    return 'Equilateral';
  } else if (allSides[0] === allSides[1] || allSides[1] === allSides[2]) {
    return 'Isosceles';
  } else {
    return 'Scalene';
  }

}

function validDataInput(inputs) {
  let allInputs = inputs.length;
  return inputs.length === 3 &&
  inputs.filter(input => typeof input === 'number').length === inputs.length;
}

//console.log(triangle(3, 3));     // invalid input
//console.log(triangle(3, 3, 'we'));  // invalid input


console.log(triangle(3, 3, 3));        // "equilateral"
console.log(triangle(3, 3, 1.5));      // "isosceles"
console.log(triangle(3, 4, 5));        // "scalene"
console.log(triangle(0, 3, 3));        // "invalid"
console.log(triangle(3, 1, 1));        // "invalid"
