/*
18:23 -18: 44

input: 3 numbers (>= 0) 
output: one of the 4 string
rules:
  valid triangle: 
    - sum of the lengths of the two shortest sides > longest length
    - all sides > 0
  Equilateral: All three sides are of equal length.
  Isosceles: Two sides are of equal length, while the third is different.
  Scalene: All three sides are of different lengths.
data: array of lengths, sorted short to longest

algo:
  create array of all sides, sorted by length (short to long);
  check if valid triangle:
    - every side is > 0
    - arr[0] + arr[1] > arr[2]
  if arr[0] === arr[1] && arr[1] === arr[2] => equi
  if arr[0] === arr[1] || arr[1] === arr[2] => iso
  else => scal

*/

function triangle(side1, side2, side3) {
  let sides = [side1, side2, side3].sort((a,b) => a - b)

  if (!validTriangle(sides)) {
    return 'invalid';
  }

  if (sides[0] === sides[1] && sides[1] === sides[2]) {
    return 'equilateral';
  } else if (sides[0] === sides[1] || sides[1] === sides[2]) {
    return 'isosceles';
  } else {
    return 'scalene';
  }
  
}

function validTriangle(sides) {
  return sides.every(side => side > 0) && sides[0] + sides[1] > sides[2];
}

console.log(triangle(3, 3, 3));        // "equilateral"
console.log(triangle(3, 3, 1.5));      // "isosceles"
console.log(triangle(3, 4, 5));        // "scalene"
console.log(triangle(0, 3, 3));        // "invalid"
console.log(triangle(3, 1, 1));        // "invalid"