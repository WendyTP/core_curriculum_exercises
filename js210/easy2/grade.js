function getGrade(grd1, grd2, grd3) {
  let averageGrade = (grd1 + grd2 + grd3) / 3;
 
  if (averageGrade >= 90 && averageGrade <= 100) {
    return 'A';
  } else if (averageGrade >= 80 && averageGrade < 90) {
    return 'B'; 
  } else if (averageGrade >= 70 && averageGrade < 80) {
    return 'C';
  } else if (averageGrade >= 60 && averageGrade < 70) {
    return 'D';
  } else {
    return 'F'
  }
}

console.log(getGrade(95, 90, 93));
console.log(getGrade(50, 50, 95))