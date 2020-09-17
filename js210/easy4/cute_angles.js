function dms(angleDegree) {
  let degrees = Math.floor(angleDegree);
  let minutes = 0;
  let secondes = 0;
  if (!Number.isInteger(angleDegree)) {
    let remainingDegree = (angleDegree - degrees) * 60;
    
    minutes = Math.floor(remainingDegree);
    if (!Number.isInteger(remainingDegree)) {
      secondes = Math.floor((remainingDegree - minutes) * 60);
    
    }
  }
  return `${stringDms(degrees)}${String.fromCharCode(176)}${stringDms(minutes)}'${stringDms(secondes)}"`
}

function stringDms(number) {
  if (String(number).length > 1) {
    return String(number);
  } else {
    return `0${String(number)}`;
  }
}

console.log(dms(30));
console.log(dms(76.73));
console.log(dms(254.6));
console.log(dms(93.034773));
console.log(dms(0));
console.log(dms(360));