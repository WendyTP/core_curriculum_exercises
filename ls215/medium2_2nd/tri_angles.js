/*
18:45 - 18: 55

input: angles in degrees (integers)
output: one of  4 strings
rules:
  valid triangle: 
    - sum of angles === 180
    - each angle > 0
  Right: One angle is a right angle (exactly 90 degrees).
Acute: All three angles are less than 90 degrees.
Obtuse: One angle is greater than 90 degrees.

data: array of angles

algo:
  - create array of 3 angles
  - check valid triangle 
    - sum array === 180 
    - every angle > 0
  - if one angle is 90 => right
  - if one is > 90 => obtuse
  - else => acute
*/

function triangle(angle1, angle2, angle3) {
  let angles = [angle1, angle2, angle3];

  if (!validTriangle(angles)) {
    return 'invalid';
  }

  if (angles.some(angle => angle === 90)){
    return 'right';
  } else if (angles.some(angle => angle > 90)) {
    return 'obtuse';
  } else {
    return 'acute';
  }
}

function validTriangle(angles) {
  return angles.reduce((sum, angle) => sum + angle) === 180 &&
  angles.every(angle => angle > 0);
}


console.log(triangle(60, 70, 50));       // "acute"
console.log(triangle(30, 90, 60));       // "right"
console.log(triangle(120, 50, 10));      // "obtuse"
console.log(triangle(0, 90, 90));        // "invalid"
console.log(triangle(50, 50, 50));       // "invalid"