function objectsEqual(obj1, obj2) {
  let obj1Keys = Object.keys(obj1);
  let obj2Keys = Object.keys(obj2);
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

let aa = {a:1, b:2};
let bb = aa;
console.log(objectsEqual(aa, bb))   // true
let cc = {a:1, b: 2};
console.log(objectsEqual(aa, cc))   // true

console.log(aa === cc)  // false

let dd = {c: 1, d: 2}
console.log(objectsEqual(aa, dd))   // false



