/*
15:13- 
input: 3 angles (valid : integers and in degrees)
output: a string 'right', 'acute', 'obtuse', or 'invalid'.
rules: 
  - valid triangle:   sum of the angles must be exactly 180 degrees && every angle > 0
  - right: only one angle === 90
  - acute: all 3 angles < 90
  - obtuse: only one angle > 90

data: array of angles
algo: 
  - create an array of angles
  - valid triangle:
    - if array includes 0? or if sum !== 180? if yes, return 'invalid'
  - if max angle is > 90 , return obtuse
  - if max angle is === 90, return right
  - else return acute
*/

function triangle(angle1, angle2, angle3) {
  let allAngles = [angle1, angle2, angle3];

  if (!validTriangle(angle1, angle2, angle3)) {
    return 'invalid';
  } else {
    return getTriangleType(angle1, angle2, angle3);
  }
}

function validTriangle(angle1, angle2, angle3) {
  let allAngles = [angle1, angle2, angle3];
  return allAngles.reduce((sum, angle) => sum + angle) === 180 &&
  !allAngles.includes(0);
}

function getTriangleType(angle1, angle2, angle3) {
  let maxAngleDegree = Math.max(angle1, angle2, angle3);
  
  if (maxAngleDegree > 90) {
    return 'obtuse';
  } else if (maxAngleDegree === 90) {
    return 'right';
  } else {
    return 'acute';
  }
}


console.log(triangle(60, 70, 50));  // "acute"
console.log(triangle(30, 90, 60));  // "right"
console.log(triangle(120, 50, 10)); // "obtuse"
console.log(triangle(0, 90, 90));   // "invalid"
console.log(triangle(50, 50, 50));   // "invalid"