function objectsEqual(obj1, obj2) {
  if (obj1 === obj2) {
    return true;
  }

  return keysEqual(obj1, obj2) && valuesEqual(obj1, obj2);
}
 
  


function keysEqual(obj1, obj2) {
  let obj1Keys = Object.keys(obj1).sort();
  let obj2Keys = Object.keys(obj2).sort();

  if (obj1Keys.length !== obj2Keys.length) {
    return false;
  }

  for (let idx = 0; idx < obj1Keys.length; idx += 1) {
    if (obj1[obj1Keys[idx]] !== obj2[obj2Keys[idx]]) {
      return false;
    }
  }

  return true;
}

function valuesEqual(obj1, obj2) {
  let obj1Keys = Object.keys(obj1).sort();
  return obj1Keys.every(key => obj1[key] === obj2[key]);
}

let aa = {a:1, b:2};
let bb = aa;
console.log(objectsEqual(aa, bb))   // true
let cc = {a:1, b: 2};
console.log(objectsEqual(aa, cc))   // true

console.log(aa === cc)  // false

let dd = {c: 1, d: 2}
console.log(objectsEqual(aa, dd))   // false
